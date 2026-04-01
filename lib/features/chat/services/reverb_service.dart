import 'dart:async';
import 'dart:convert';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/features/chat/data/model/conversation.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/get_conversation_provider.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/get_list_message.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/unread_counts_provider.dart';
import 'package:curnectgate/features/chat/data/provider/reverb_provider.dart';
import 'package:curnectgate/features/chat/data/provider/typingindicator_provider.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReverbService {
  static PusherChannelsClient? _client;
  static bool _initialized = false;

  static PrivateChannel? _globalChannel;
  static StreamSubscription<ChannelReadEvent>? _globalMessageSub;

  static PrivateChannel? _chatChannel;
  static StreamSubscription<ChannelReadEvent>? _chatMessageSub;
  static StreamSubscription<ChannelReadEvent>? _typingSub;
  static StreamSubscription<ChannelReadEvent>? _chatBindAllSub;

  static PusherChannelsClient get client {
    if (_client == null) {
      throw Exception("ReverbService not initialized. Call init() first.");
    }
    return _client!;
  }

  static Future<void> init({
    required String token,
    required String appKey,
    required String host,
    required int port,
    required String scheme,
    required String broadcaster,
    String? cluster,
  }) async {
    if (_initialized) return;

    _initialized = true;

    late PusherChannelsOptions options;

    if (broadcaster.toLowerCase() == 'pusher' && cluster != null) {
      options = PusherChannelsOptions.fromCluster(
        scheme: 'wss',
        cluster: cluster,
        key: appKey,
        port: 443,
        shouldSupplyMetadataQueries: true,
        metadata: PusherChannelsOptionsMetadata.byDefault(),
      );
    } else {
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
        await Future.delayed(const Duration(seconds: 2));
        refresh();
      },
    );

    final connectCompleter = Completer<void>();

    _client!.onConnectionEstablished.listen((_) {
      if (!connectCompleter.isCompleted) {
        connectCompleter.complete();
      }
    });

    _client!.pusherErrorEventStream.listen((_) {});

    await _client!.connect();

    try {
      await connectCompleter.future.timeout(const Duration(seconds: 5));
    } catch (_) {}
  }

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
          broadcaster: model.broadcaster,
        );

        await setupGlobalListener(userId, ref);
      }
    } catch (_) {}
  }



  static Future<void> setupGlobalListener(int userId, WidgetRef ref) async {


    try {
      final config = await SharedPrefsService().getReverbConfig();
      if (config == null) return;

      final token = await SharedPrefsService().getUserToken();
      if (token == null) return;

      _globalChannel?.unsubscribe();

      _globalChannel = client.privateChannel(
        'private-user.$userId.conversations',
        authorizationDelegate:
            EndpointAuthorizableChannelTokenAuthorizationDelegate.forPrivateChannel(
              authorizationEndpoint: Uri.parse(config.authEndpoint),
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
              },
            ),
      );

      _globalChannel!.subscribe();

      _globalChannel!.bindToAll().listen((event) {});

      _globalChannel!.whenSubscriptionSucceeded().listen((event) {});

      _globalChannel!.onSubscriptionError().listen((event) {});

      _globalChannel!.onAuthenticationSubscriptionFailed().listen((event) {});

      _globalChannel!.bind('conversation.created').listen((event) {
        final payload =
            jsonDecode(event.data as String) as Map<String, dynamic>;
        final conversationJson = payload['conversation'];

        ref
            .read(conversationListProvider.notifier)
            .updateConversation(Conversation.safeFromJson(conversationJson));
      });

      _globalMessageSub = _globalChannel!.bind('message.sent').listen((
        event,
      ) async {
        final payload =
            jsonDecode(event.data as String) as Map<String, dynamic>;
        final messageJson = payload['message'];

        final conversationId = messageJson['conversation_id'];

        ref
            .read(conversationListProvider.notifier)
            .updateLastMessage(
              conversationId: conversationId,
              message: messageJson,
            );

        await ref.read(unreadCountsProvider.notifier).refreshCounts();

        if (_chatChannel == null ||
            _chatChannel!.name != 'private-conversation.$conversationId') {
          ref
              .read(messagesProvider(conversationId).notifier)
              .addIncomingMessage(messageJson);
        }
      });
    } catch (_) {}
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

      await _chatMessageSub?.cancel();
      await _typingSub?.cancel();
      await _chatBindAllSub?.cancel();

      if (_chatChannel != null) {
        try {
          _chatChannel?.unsubscribe();
        } catch (_) {}
        _chatChannel = null;
      }

      _chatChannel = client.privateChannel(
        'private-conversation.$chatId',
        authorizationDelegate:
            EndpointAuthorizableChannelTokenAuthorizationDelegate.forPrivateChannel(
              authorizationEndpoint: Uri.parse(config.authEndpoint),
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
              },
            ),
      );

      _chatChannel!.subscribe();

      _chatChannel!.whenSubscriptionSucceeded().listen((event) {});

      _chatChannel!.onSubscriptionError().listen((event) {});

      _chatChannel!.onAuthenticationSubscriptionFailed().listen((event) {});

      _chatBindAllSub = _chatChannel!.bindToAll().listen((event) {});

      _chatMessageSub = _chatChannel!.bind('message.sent').listen((event) {
        final payload =
            jsonDecode(event.data as String) as Map<String, dynamic>;

        final messageJson = payload['message'];

        ref
            .read(messagesProvider(chatId).notifier)
            .addIncomingMessage(messageJson);
      });

      _chatChannel!.bind('message.read').listen((event) {
        jsonDecode(event.data as String) as Map<String, dynamic>;
      });

      _typingSub = _chatChannel!.bind('user.typing').listen((event) {
        try {
          final payload =
              jsonDecode(event.data as String) as Map<String, dynamic>;

          final isTyping = payload['is_typing'] ?? payload['typing'] ?? true;

          final senderStr =
              payload['user_id']?.toString() ??
              payload['sender_id']?.toString() ??
              payload['participant_id']?.toString();

          if (senderStr != null) {
            final senderId = int.tryParse(senderStr) ?? 0;

            ref
                .read(typingStatusProvider(chatId).notifier)
                .updateTyping(senderId, isTyping);
          }
        } catch (_) {}
      });
    } catch (_) {}
  }

  static void unsubscribeChat() {
    _chatMessageSub?.cancel();
    _typingSub?.cancel();
    _chatBindAllSub?.cancel();

    if (_chatChannel != null) {
      try {
        _chatChannel!.unsubscribe();
      } catch (_) {}
      _chatChannel = null;
    }
  }

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
    } catch (_) {}
  }

  static void disconnect() {
    _globalMessageSub?.cancel();
    _chatMessageSub?.cancel();
    _typingSub?.cancel();

    _globalChannel?.unsubscribe();
    _chatChannel?.unsubscribe();

    _client?.disconnect();
    _client = null;
    _initialized = false;
  }
}
