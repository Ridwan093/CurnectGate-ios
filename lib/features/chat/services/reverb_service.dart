import 'dart:async';
import 'dart:convert';
import 'dart:developer';

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
import 'package:http/http.dart' as http;

class ReverbService {
  static PusherChannelsClient? _client;
  static bool _initialized = false;
  static int? _currentUserId; // Track for re-setup
  static int? _currentChatId; // Track for re-setup

  static PrivateChannel? _globalChannel;
  static StreamSubscription<ChannelReadEvent>? _globalMessageSub;

  static PrivateChannel? _chatChannel;
  static StreamSubscription<ChannelReadEvent>? _chatMessageSub;
  static StreamSubscription<ChannelReadEvent>? _typingSub;
  static StreamSubscription<ChannelReadEvent>? _chatBindAllSub;

  static StreamSubscription? _connectionStateSub;
  static StreamSubscription? _errorEventSub;

  static void _log(String message) {
    // No emojis as requested
    log('[ReverbService] $message', name: 'ReverbService');
  }

  static PusherChannelsClient get client {
    if (_client == null) {
      _log('Error: ReverbService not initialized. Call init() first.');
      throw Exception("ReverbService not initialized. Call init() first.");
    }
    return _client!;
  }

  static Future<void> init({
    required WidgetRef ref,
    required String token,
    required String appKey,
    required String host,
    required int port,
    required String scheme,
    required String broadcaster,
    String? cluster,
  }) async {
    // We remove the strict _initialized gate to allow updating the connection
    // if called again with a new token or configuration.
    if (_initialized && _client != null) {
      _log('Already initialized, skipping redundant init.');
      return;
    }

    _log('Initializing ReverbService...');
    _log(
      'Host: $host, Port: $port, Scheme: $scheme, Broadcaster: $broadcaster',
    );

    _initialized = true;

    late PusherChannelsOptions options;

    if (broadcaster.toLowerCase() == 'pusher' && cluster != null) {
      _log('Using Pusher cluster: $cluster');
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
      _log('Using custom host: $host with scheme: $wsScheme');

      options = PusherChannelsOptions.fromHost(
        scheme: wsScheme,
        host: host,
        key: appKey,
        port: port,
        shouldSupplyMetadataQueries: true,
        metadata: PusherChannelsOptionsMetadata.byDefault(),
      );
    }

    // Clean up existing client to ensure a fresh connection with new credentials
    if (_client != null) {
      _log('Cleaning up existing client before creating a new one.');
      await _client?.disconnect();
      _connectionStateSub?.cancel();
      _errorEventSub?.cancel();
    }

    _client = PusherChannelsClient.websocket(
      options: options,
      activityDurationOverride: const Duration(seconds: 30),
      waitForPongDuration: const Duration(seconds: 10),
      connectionErrorHandler: (exception, trace, refresh) async {
        _log('Connection error occurred: $exception');
        _log('Attempting to refresh connection in 2 seconds...');
        await Future.delayed(const Duration(seconds: 2));
        refresh();
      },
    );

    final connectCompleter = Completer<void>();

    // MONITOR CONNECTION STATE
    _connectionStateSub = _client!.lifecycleStream.listen((state) {
      _log('Connection state changed to: $state');
      if (state == PusherChannelsClientLifeCycleState.establishedConnection) {
        _log('Connection successfully established.');
        if (!connectCompleter.isCompleted) {
          connectCompleter.complete();
        } else {
          // CONNECTION WAS RESTORED (Watchdog)
          _log('Connection restored. Re-applying listeners...');
          if (_currentUserId != null) {
            setupGlobalListener(_currentUserId!, ref);
          }
          if (_currentChatId != null) {
            subscribeChat(chatId: _currentChatId!, ref: ref);
          }
        }
      } else if (state == PusherChannelsClientLifeCycleState.disconnected ||
          state == PusherChannelsClientLifeCycleState.disposed) {
        _log('Connection disconnected/disposed.');
      } else if (state == PusherChannelsClientLifeCycleState.connectionError) {
        _log('Connection error state.');
      }
    });

    _errorEventSub = _client!.pusherErrorEventStream.listen((error) {
      final data = error.tryGetDataAsMap();
      final message = data?['message'] ?? error.data;
      final code = data?['code'] ?? 'Unknown';
      _log('Pusher error event: $message (Code: $code)');
    });

    _log('Attempting to connect to Reverb server...');
    await _client!.connect();

    try {
      await connectCompleter.future.timeout(const Duration(seconds: 10));
      _log('Connection process finished.');
    } catch (e) {
      _log('Connection attempt timed out or failed: $e');
    }
  }

  static Future<void> initRealtime(WidgetRef ref, int userId) async {
    _log('initRealtime triggered for User ID: $userId');
    try {
      final token = await SharedPrefsService().getUserToken();
      if (token == null) {
        _log('Aborting: No user token found in storage.');
        return;
      }

      _log('Fetching Reverb config from API...');
      final res = await ref.read(getApiServiceProvider).getReverbConfig();

      if (res['status'] == true) {
        _log('Reverb config received successfully.');
        final config = res['data'];

        final model = ReverbConfig.fromJson(config);
        await SharedPrefsService().saveReverbConfig(model);
        ref.read(reverbConfigProvider.notifier).state = model;

        await init(
          ref: ref,
          token: token,
          appKey: model.appKey,
          host: model.host,
          port: model.port,
          scheme: model.scheme,
          cluster: model.cluster,
          broadcaster: model.broadcaster,
        );

        await setupGlobalListener(userId, ref);
      } else {
        _log(
          'Failed to fetch Reverb config: ${res['message'] ?? 'Unknown error'}',
        );
      }
    } catch (e) {
      _log('Error during initRealtime: $e');
    }
  }

  static Future<void> setupGlobalListener(int userId, WidgetRef ref) async {
    _log('Setting up global conversation listener for User ID: $userId');
    _currentUserId = userId;

    try {
      final config = await SharedPrefsService().getReverbConfig();
      if (config == null) {
        _log('Setup failed: Reverb config missing.');
        return;
      }

      final token = await SharedPrefsService().getUserToken();
      if (token == null) {
        _log('Setup failed: User token missing.');
        return;
      }

      if (_globalChannel != null) {
        _log('Removing existing global channel subscription.');
        _globalChannel?.unsubscribe();
        _globalMessageSub?.cancel();
      }

      final channelName = 'private-user.$userId.conversations';
      _log('Subscribing to channel: $channelName');

      _globalChannel = client.privateChannel(
        channelName,
        authorizationDelegate:
            DynamicTokenAuthorizationDelegate.forPrivateChannel(
              authorizationEndpoint: Uri.parse(config.authEndpoint),
            ),
      );

      _globalChannel!.subscribe();

      _globalChannel!.whenSubscriptionSucceeded().listen((event) {
        _log('Global channel subscription succeeded.');
      });

      _globalChannel!.onSubscriptionError().listen((event) {
        _log('Global channel subscription error: ${event.data}');
      });

      _globalChannel!.onAuthenticationSubscriptionFailed().listen((event) {
        _log('Global channel authentication failed: ${event.data}');
      });

      _globalChannel!.bind('conversation.created').listen((event) {
        _log('Event received: conversation.created');
        try {
          final payload =
              jsonDecode(event.data as String) as Map<String, dynamic>;
          final conversationJson = payload['conversation'];

          ref
              .read(conversationListProvider.notifier)
              .updateConversation(Conversation.safeFromJson(conversationJson));
        } catch (e) {
          _log('Error parsing conversation.created: $e');
        }
      });

      _globalMessageSub = _globalChannel!.bind('message.sent').listen((
        event,
      ) async {
        _log('Event received (Global): message.sent');
        try {
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
            _log('Redirecting message to background message provider.');
            ref
                .read(messagesProvider(conversationId).notifier)
                .addIncomingMessage(messageJson);
          }
        } catch (e) {
          _log('Error parsing global message.sent: $e');
        }
      });
    } catch (e) {
      _log('Error in setupGlobalListener: $e');
    }
  }

  static Future<void> subscribeChat({
    required int chatId,
    required WidgetRef ref,
  }) async {
    _log('Subscribing to specific chat: $chatId');
    _currentChatId = chatId;
    try {
      final config = await SharedPrefsService().getReverbConfig();
      if (config == null) return;

      final token = await SharedPrefsService().getUserToken();
      if (token == null) return;

      await _chatMessageSub?.cancel();
      await _typingSub?.cancel();
      await _chatBindAllSub?.cancel();

      if (_chatChannel != null) {
        _log('Unsubscribing from current chat channel: ${_chatChannel!.name}');
        try {
          _chatChannel?.unsubscribe();
        } catch (e) {
          _log('Unsubscribe error: $e');
        }
        _chatChannel = null;
      }

      final channelName = 'private-conversation.$chatId';
      _log('Subscribing to channel: $channelName');

      _chatChannel = client.privateChannel(
        channelName,
        authorizationDelegate:
            DynamicTokenAuthorizationDelegate.forPrivateChannel(
              authorizationEndpoint: Uri.parse(config.authEndpoint),
            ),
      );

      _chatChannel!.subscribe();

      _chatChannel!.whenSubscriptionSucceeded().listen((event) {
        _log('Chat channel subscription succeeded.');
      });

      _chatChannel!.onSubscriptionError().listen((event) {
        _log('Chat channel subscription error: ${event.data}');
      });

      _chatChannel!.onAuthenticationSubscriptionFailed().listen((event) {
        _log('Chat channel auth failed: ${event.data}');
      });

      _chatMessageSub = _chatChannel!.bind('message.sent').listen((event) {
        _log('Event received (Chat): message.sent');
        try {
          final payload =
              jsonDecode(event.data as String) as Map<String, dynamic>;
          final messageJson = payload['message'];

          ref
              .read(messagesProvider(chatId).notifier)
              .addIncomingMessage(messageJson);
        } catch (e) {
          _log('Error parsing chat message.sent: $e');
        }
      });

      _chatChannel!.bind('message.read').listen((event) {
        _log('Event received: message.read');
        ref
            .read(messagesProvider(chatId).notifier)
            .markSentMessagesAsReadLocally();
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
        } catch (e) {
          _log('Error parsing user.typing: $e');
        }
      });
    } catch (e) {
      _log('Error in subscribeChat: $e');
    }
  }

  static void unsubscribeChat() {
    _log('Unsubscribing from chat...');
    _currentChatId = null;
    _chatMessageSub?.cancel();
    _typingSub?.cancel();
    _chatBindAllSub?.cancel();

    if (_chatChannel != null) {
      _log('Closing channel: ${_chatChannel!.name}');
      try {
        _chatChannel!.unsubscribe();
      } catch (e) {
        _log('Unsubscribe error: $e');
      }
      _chatChannel = null;
    }
  }

  static void sendTyping({
    required int chatId,
    required int userId,
    required bool isTyping,
  }) {
    try {
      if (_chatChannel != null) {
        _chatChannel!.trigger(
          eventName: 'client-typing',
          data: {"user_id": userId, "chat_id": chatId, "typing": isTyping},
        );
      } else {
        _log('Cannot send typing: No active chat channel.');
      }
    } catch (e) {
      _log('Error sending typing trigger: $e');
    }
  }

  static void disconnect() {
    _log('Disconnecting ReverbService and clearing all subscriptions...');
    _globalMessageSub?.cancel();
    _chatMessageSub?.cancel();
    _typingSub?.cancel();
    _chatBindAllSub?.cancel();
    _connectionStateSub?.cancel();
    _errorEventSub?.cancel();

    _globalChannel?.unsubscribe();
    _chatChannel?.unsubscribe();

    _client?.disconnect();
    _client = null;
    _currentUserId = null;
    _currentChatId = null;
    _initialized = false;
    _log('Disconnected successfully.');
  }
}

/// A custom authorization delegate that fetches a fresh token for every request.
/// This ensures that reconnections use valid credentials even if the token was refreshed.
class DynamicTokenAuthorizationDelegate<T extends EndpointAuthorizationData>
    implements EndpointAuthorizableChannelAuthorizationDelegate<T> {
  final Uri authorizationEndpoint;
  final T Function(http.Response response) parser;

  DynamicTokenAuthorizationDelegate({
    required this.authorizationEndpoint,
    required this.parser,
  });

  @override
  EndpointAuthFailedCallback? get onAuthFailed => (exception, trace) {
    log(
      '[ReverbService] Authorization failed: $exception',
      name: 'ReverbService',
    );
  };

  @override
  FutureOr<T> authorizationData(String socketId, String channelName) async {
    final prefs = SharedPrefsService();
    final token = await prefs.getUserToken();
    final cookie = await prefs.getSessionCookie();

    log(
      '[ReverbService] Dynamic auth request for $channelName',
      name: 'ReverbService',
    );

    final headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    if (cookie != null && cookie.isNotEmpty) {
      headers['Cookie'] = cookie;
    }

    final response = await http.post(
      authorizationEndpoint,
      headers: headers,
      body: {'socket_id': socketId, 'channel_name': channelName},
    );

    if (response.statusCode != 200) {
      log(
        '[ReverbService] Auth error payload: ${response.body}',
        name: 'ReverbService',
      );
      throw Exception(
        'Failed to get authorization data. Status: ${response.statusCode}, Body: ${response.body}',
      );
    }

    return parser(response);
  }

  static DynamicTokenAuthorizationDelegate<PrivateChannelAuthorizationData>
  forPrivateChannel({required Uri authorizationEndpoint}) =>
      DynamicTokenAuthorizationDelegate(
        authorizationEndpoint: authorizationEndpoint,
        parser: (response) {
          final decoded = jsonDecode(response.body) as Map;
          final auth = decoded['auth'] as String;
          return PrivateChannelAuthorizationData(authKey: auth);
        },
      );
}
