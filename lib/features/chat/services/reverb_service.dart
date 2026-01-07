import 'dart:async';
import 'dart:developer' as dev;
import 'dart:developer';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/features/chat/data/provider/reverb_provider.dart';
import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReverbService {
  static PusherChannelsClient? _client;
  static String? _token;

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
    required String port,
    required String scheme, // 'http' or 'https'
    required String authEndpoint,
  }) async {
    _token = token;

    final options = PusherChannelsOptions.fromHost(
      scheme: scheme == 'https' ? 'wss' : 'ws',
      host: host,
      port: int.parse(port),
      key: appKey,
      shouldSupplyMetadataQueries: true, // Recommended for Reverb
      metadata: PusherChannelsOptionsMetadata.byDefault(),
    );

    _client = PusherChannelsClient.websocket(
      options: options,
      connectionErrorHandler: (exception, trace, refresh) async {
        dev.log('❌ Reverb Connection Error: $exception');
        // Optional: refresh() to retry connection
      },
    );

    // Optional: Listen to connection lifecycle
    _client!.onConnectionEstablished.listen((_) {
      dev.log('🟢 Reverb Connected');
    });

    _client!.pusherErrorEventStream.listen((_) {
      dev.log('🔴 Reverb Disconnected');
    });

    // Connect
    await _client!.connect();
  }


static StreamSubscription<ChannelReadEvent>? _globalMessageSub;

  static Future<void> setupGlobalListener(String userId, WidgetRef ref) async {
    try {
      final reverbConfig = ref.read(reverbConfigProvider);
      if (reverbConfig == null) return;

      final token = await SharedPrefsService().getUserToken();
      if (token == null) return;

      // Global private channel for user's notifications (ask backend for exact name)
      final globalChannel = client.privateChannel(
        'user.${userId}', // e.g., 'user.123' or 'notifications.123'
        authorizationDelegate: EndpointAuthorizableChannelTokenAuthorizationDelegate.forPrivateChannel(
          authorizationEndpoint: Uri.parse(reverbConfig.authEndpoint),
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      globalChannel.subscribeIfNotUnsubscribed();

      // Listen for new message notification
      _globalMessageSub = globalChannel.bind('NewMessageNotification').listen((event) { // ← Your backend event name for notifications
        final data = event.data as Map<String, dynamic>;

        log("🟢 Global new message notification: $data");

        // Data might include: chatId, lastMessage, senderId, timestamp, unreadCount

        // 1. Update local Hive for that chat (instant, offline-safe)
        _updateHiveFromNotification(data);

        // 2. Trigger refresh of conversation list API (sync backend changes)
        // ref.read(conversationListProvider.notifier).refreshConversations();

        // Optional: Show system notification if app in background
      });

      // Listen for typing (global for all chats)
      globalChannel.bind('UserTyping').listen((event) {
        final data = event.data as Map<String, dynamic>;
        final typingChatId = data['chat_id'];
        final typingUserId = data['user_id'];

        log("Typing in chat $typingChatId by $typingUserId");

        // Update typing state for that conversation in Riverpod/Hive
        // ref.read(typingStatusProvider(typingChatId).notifier).updateTyping(typingUserId, true);
      });

      log("✅ Global Reverb listener set up for user.$userId");

    } catch (e) {
      log("❌ Global listener setup failed: $e");
    }
  }

  static void _updateHiveFromNotification(Map<String, dynamic> data) {
    // Open Hive box
    // final box = Hive.box<Message>('messages');

    // // Parse new message
    // final newMessage = Message.fromJson(data, currentUserId: "your_user_id");

    // // Save to Hive
    // box.put(newMessage.id, newMessage);

    log("Saved new message to Hive from notification");
  }

  static void disposeGlobalListener() {
    _globalMessageSub?.cancel();
  }


  static void disconnect() {
    _client?.disconnect();
    _client = null;
  }
}