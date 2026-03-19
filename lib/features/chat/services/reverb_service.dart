import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/features/chat/data/model/conversation.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/get_conversation_provider.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/get_list_message.dart';
import 'package:curnectgate/features/chat/data/provider/reverb_provider.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReverbService {
  static PusherChannelsClient? _client;
  static String? _token;
  static bool _initialized = false;

  /// GLOBAL CHANNEL
  static PrivateChannel? _globalChannel;
  static StreamSubscription<ChannelReadEvent>? _globalMessageSub;

  /// CHAT CHANNEL
  static PrivateChannel? _chatChannel;
  static StreamSubscription<ChannelReadEvent>? _chatMessageSub;
  static StreamSubscription<ChannelReadEvent>? _typingSub;

  static PusherChannelsClient get client {
    if (_client == null) {
      throw Exception("ReverbService not initialized. Call init() first.");
    }
    return _client!;
  }

  // =========================
  // INIT (ONLY ONCE)
  // =========================
  static Future<void> init({
    required String token,
    required String appKey,
    required String host,
    required int port,
    required String scheme,
    required String broadcaster,
    String? cluster, // cluster should be passed when available
  }) async {
    if (_initialized) {
      dev.log('⚠️ Reverb already initialized');
      return;
    }

    _initialized = true;
    _token = token;

    late PusherChannelsOptions options;

    if (broadcaster.toLowerCase() == 'pusher' && cluster != null) {
      dev.log('⚡ Initializing Pusher via cluster $cluster');

      options = PusherChannelsOptions.fromCluster(
        scheme: 'wss',
        cluster: cluster,
        key: appKey,
        port: 443,
        shouldSupplyMetadataQueries: true,
        metadata: PusherChannelsOptionsMetadata.byDefault(),
      );
    } else {
      // Use host for Reverb or custom servers
      host = host.replaceAll(RegExp(r'^https?://'), '');
      final wsScheme = scheme.toLowerCase() == 'https' ? 'wss' : 'ws';

      options = PusherChannelsOptions.fromHost(
        scheme: wsScheme,
        host: host,
        key: appKey,
        port: port,
        shouldSupplyMetadataQueries: true,
        metadata: PusherChannelsOptionsMetadata.byDefault(),
      );
    }

    _client = PusherChannelsClient.websocket(
      options: options,
      connectionErrorHandler: (exception, trace, refresh) async {
        dev.log('❌ Connection Error: $exception');
        await Future.delayed(const Duration(seconds: 2));
        refresh();
      },
    );

    _client!.onConnectionEstablished.listen((_) {
      dev.log('🟢 Connected to socket');
    });

    _client!.pusherErrorEventStream.listen((_) {
      dev.log('🔴 Disconnected from socket');
    });

    await _client!.connect();
  }

  // =========================
  // INIT REALTIME (CALL ONCE AFTER LOGIN)
  // =========================
  static Future<void> initRealtime(WidgetRef ref, int userId) async {
    try {
      final token = await SharedPrefsService().getUserToken();
      if (token == null) return;

      final res = await ref.read(getApiServiceProvider).getReverbConfig();

      if (res['status'] == true) {
        final config = res['data'];

        final model = ReverbConfig.fromJson(config);
        await SharedPrefsService().saveReverbConfig(model);
        ref.read(reverbConfigProvider.notifier).state = model;

        await init(
          token: token,
          appKey: model.appKey,
          host: model.host,
          port: model.port,
          scheme: model.scheme,
          cluster: model.cluster,
          broadcaster: model.broadcaster, // Send broadcaster type
        );

        await setupGlobalListener(userId, ref);
      }
    } catch (e) {
      dev.log("❌ initRealtime error: $e");
    }
  }

  // =========================
  // GLOBAL LISTENER (user.{id})
  // =========================
  static Future<void> setupGlobalListener(int userId, WidgetRef ref) async {
    try {
      final config = await SharedPrefsService().getReverbConfig();
      if (config == null) return;

      final token = await SharedPrefsService().getUserToken();
      if (token == null) return;

      // 🔥 Cancel previous listeners
      _globalMessageSub?.cancel();
      _globalChannel?.unsubscribe();

      // =========================
      // CREATE CHANNEL
      // =========================
      _globalChannel = client.privateChannel(
        'user.$userId.conversations',
        authorizationDelegate:
            EndpointAuthorizableChannelTokenAuthorizationDelegate.forPrivateChannel(
              authorizationEndpoint: Uri.parse(config.authEndpoint),
              headers: {'Authorization': 'Bearer $token'},
            ),
      );

      // =========================
      // SUBSCRIBE FIRST ✅
      // =========================
      _globalChannel!.subscribeIfNotUnsubscribed();

      _globalChannel!.bindToAll().listen((event) {
        dev.log(
          "ChatList channelevent Check: ${event.channelName} => ${event.data}",
        );
      });
      _globalChannel!.whenSubscriptionSucceeded().listen((event) {
        dev.log("✅ Global subscribed: ${event.channelName}");
      });

      _globalChannel!.onSubscriptionError().listen((event) {
        dev.log("❌ Global subscription error: ${event.data}");
      });

      _globalChannel!.onAuthenticationSubscriptionFailed().listen((event) {
        dev.log("❌ Global auth failed: ${event.data}");
      });

      // =========================
      // 🆕 NEW CONVERSATION
      // =========================
      _globalChannel!.bind('.conversation.created').listen((event) {
        final payload =
            jsonDecode(event.data as String) as Map<String, dynamic>;
        final conversationJson = payload['conversation'];

        dev.log("🟢 New conversation => $conversationJson");

        ref
            .read(conversationListProvider.notifier)
            .updateConversation(Conversation.safeFromJson(conversationJson));
      });

      // =========================
      // 🔥 NEW MESSAGE (THIS WAS MISSING)
      // =========================
      _globalMessageSub = _globalChannel!.bind('.message.sent').listen((event) {
        final payload =
            jsonDecode(event.data as String) as Map<String, dynamic>;
        final messageJson = payload['message'];

        dev.log("📩 Global message => $messageJson");

        final conversationId = messageJson['conversation_id'];

        // ✅ UPDATE CHAT LIST
        // ref.read(conversationListProvider.notifier).updateLastMessage(
        //       conversationId: conversationId,
        //       message: messageJson,
        //     );

        // ✅ OPTIONAL: update chat screen if already open
        ref
            .read(messagesProvider(conversationId).notifier)
            .addIncomingMessage(messageJson);
      });
    } catch (e) {
      dev.log("❌ Global listener setup failed: $e");
    }
  }

  static Future<void> subscribeChat({
    required int chatId,
    required WidgetRef ref,
  }) async {
    try {
      final config = await SharedPrefsService().getReverbConfig();
      if (config == null) return;

      final token = await SharedPrefsService().getUserToken();
      if (token == null) return;

      // Cancel previous subscriptions
      _chatMessageSub?.cancel();
      _typingSub?.cancel();
      _chatChannel?.unsubscribe();

      _chatChannel = client.privateChannel(
        'conversation.$chatId',
        authorizationDelegate:
            EndpointAuthorizableChannelTokenAuthorizationDelegate.forPrivateChannel(
              authorizationEndpoint: Uri.parse(config.authEndpoint),
              headers: {'Authorization': 'Bearer $token'},
            ),
      );

      _chatChannel!.subscribeIfNotUnsubscribed();

      // 🔹 Log subscription success
      _chatChannel!.whenSubscriptionSucceeded().listen((event) {
        dev.log(
          "✅ chat channel subscription succeeded: ${event.channelName}",
        );
      });

      // 🔹 Log subscription errors
      _chatChannel!.onSubscriptionError().listen((event) {
        dev.log("❌ Chat subscription error: ${event.data}");
      });

      // 🔹 Log authentication failures
      _chatChannel!.onAuthenticationSubscriptionFailed().listen((event) {
        dev.log("❌ Chat auth failed: ${event.data}");
      });

      // 🔹 Bind to all events for debugging
      _chatChannel!.bindToAll().listen((event) {
        dev.log("🌐 Chat channel event: ${event.channelName} => ${event.data}");
      });

      // MESSAGE SENT
      _chatMessageSub = _chatChannel!.bind('.message.sent').listen((event) {
        final payload =
            jsonDecode(event.data as String) as Map<String, dynamic>;
        final messageJson = payload['message'];

        dev.log("📩 New message realtime => $messageJson");

        ref
            .read(messagesProvider(chatId).notifier)
            .addIncomingMessage(messageJson);
      });

      // MESSAGE READ
      _chatChannel!.bind('.message.read').listen((event) {
        final payload =
            jsonDecode(event.data as String) as Map<String, dynamic>;
        dev.log("👁 message read => $payload");
      });

      // USER TYPING
      _typingSub = _chatChannel!.bind('.user.typing').listen((event) {
        final payload =
            jsonDecode(event.data as String) as Map<String, dynamic>;
        dev.log("✍️ typing => $payload");
      });
    } catch (e) {
      dev.log("❌ Chat subscription setup failed: $e");
    }
  }

  // =========================
  // UNSUBSCRIBE CHAT (VERY IMPORTANT)
  // =========================
  static void unsubscribeChat() {
    _chatMessageSub?.cancel();
    _typingSub?.cancel();
    _chatChannel?.unsubscribe();
  }

  // =========================
  // SEND TYPING EVENT
  // =========================
  static void sendTyping({
    required int chatId,
    required int userId,
    required bool isTyping,
  }) {
    try {
      _chatChannel?.trigger(
        eventName: 'client-typing',
        data: {"user_id": userId, "chat_id": chatId, "typing": isTyping},
      );
    } catch (e) {
      log("❌ Typing send failed: $e");
    }
  }

  // =========================
  // LOCAL CACHE UPDATE
  // =========================
  static void _updateHiveFromNotification(Map<String, dynamic> data) {
    log("💾 Saved message to Hive (implement here)");
  }

  // =========================
  // DISCONNECT (LOGOUT)
  // =========================
  static void disconnect() {
    _globalMessageSub?.cancel();
    _chatMessageSub?.cancel();
    _typingSub?.cancel();

    _globalChannel?.unsubscribe();
    _chatChannel?.unsubscribe();

    _client?.disconnect();
    _client = null;
    _initialized = false;

    log("🔌 Socket disconnected");
  }
}
