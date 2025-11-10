import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

/// Handles both FCM (remote) and local notifications for iOS & Android.
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  Future<void> sendNotificationToAll({
    required String bearerToken, // <-- new parameter
    required String message,
    required String messageType,
    required String senderName,
    required String senderProfilePix,
    required String senderId,
    required List<String> tokens,
  }) async {
    try {
      if (tokens.isEmpty) {
        print('No tokens found.');
        return;
      }

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      };

      for (String deviceToken in tokens) {
        final Map<String, dynamic> body = {
          'message': {
            'token': deviceToken,
            'notification': {
              'title': '$senderName sent a message',
              'body': message,
            },
            'data': {
              'type': messageType,
              'senderId': senderId,
              'senderName': senderName,
              'senderProfilePix': senderProfilePix,
            },
          },
        };

        // Add APNS payload for iOS
        if (Platform.isIOS) {
          body['message']['apns'] = {
            'payload': {
              'aps': {
                'mutable-content': 1,
                'sound': 'default',
                'alert': {
                  'title': '$senderName sent a message',
                  'body': message,
                },
              },
            },
          };
        }

        final response = await http.post(
          Uri.parse(
            'https://fcm.googleapis.com/v1/projects/curnect-test-f9bc0/messages:send',
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('✅ Notification sent to $deviceToken');
        } else {
          print(
            '❌ Failed to send notification: ${response.statusCode} -> ${response.body}',
          );
        }
      }
    } catch (e) {
      print('⚠️ Error sending notification: $e');
    }
  }

  /// Initialize Firebase Messaging + Local Notifications
  Future<void> initialize() async {
    await Firebase.initializeApp();

    // Background handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Request permissions
    await _requestPermissions();

    // Initialize local notifications
    await _initializeLocalNotifications();

    // Foreground message handler
    FirebaseMessaging.onMessage.listen(_onMessageReceived);

    // Handle notification taps (when app is in background or terminated)
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

    // Allow iOS foreground banners
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    log('✅ NotificationService initialized successfully');
  }

  /// Handle messages received in foreground
  Future<void> _onMessageReceived(RemoteMessage message) async {
    log('🔔 Foreground message: ${message.data}');
    await _showLocalNotification(message);
  }

  /// Handle when notification is tapped
  Future<void> _onMessageOpenedApp(RemoteMessage message) async {
    print('🟢 Notification tapped: ${message.data}');
    // You can route to a specific page based on message.data['type']
    // Example: Navigator.pushNamed(context, '/chat');
  }

  /// Local notification initialization
  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print('📩 Local notification tapped with payload: ${response.payload}');
      },
    );
  }

  /// Request notification permissions
  Future<void> _requestPermissions() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('🔓 User granted notification permission');
    } else {
      print('🚫 User declined or has not accepted notification permission');
    }
  }

  /// Show local notification for foreground messages
  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    final data = message.data;

    String type = data['type'] ?? 'general';
    String isAmber = data["is_amber_alert"];
    String title = notification?.title ?? 'Notification';
    String body = notification?.body ?? 'You have a new message';

    String imagePath = await downloadAndSaveImage(
      data["media_url"],
      'chat_${data["senderId"]}.jpg',
    );

    final AndroidNotificationDetails androidDetails = _getAndroidChannelDetails(
      type,
      imagePath,
      isAmber,
    );

    final NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await _localNotifications.show(
      notification.hashCode,
      title,
      body,
      notificationDetails,
      payload: type,
    );
  }

  /// Define different notification channels based on type
  AndroidNotificationDetails _getAndroidChannelDetails(
    String type,
    String imageUrl,
    String isAmber,
  ) {
    switch (isAmber.toLowerCase()) {
      case "true":
        return AndroidNotificationDetails(
          'announcement_channel',
          'Announcements',
          channelDescription: 'Community announcements and broadcasts',
          importance: Importance.high,
          priority: Priority.defaultPriority,
          playSound: true,
          styleInformation: BigPictureStyleInformation(
            FilePathAndroidBitmap(imageUrl),
            contentTitle: '<b>Announcement</b>',
            htmlFormatContentTitle: true,
            htmlFormatSummaryText: true,
            hideExpandedLargeIcon: true,
          ),
        );
      case "false":
        return const AndroidNotificationDetails(
          'general_channel',
          'General Notifications',
          channelDescription: 'Miscellaneous notifications',
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          playSound: true,
        );
      default:
        return const AndroidNotificationDetails(
          'general_channel',
          'General Notifications',
          channelDescription: 'Miscellaneous notifications',
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          playSound: true,
        );
    }
    // switch (type) {
    //   case 'payment':
    //     return const AndroidNotificationDetails(
    //       'payment_channel',
    //       'Payment Notifications',
    //       channelDescription: 'Notifications related to payments',
    //       importance: Importance.max,
    //       priority: Priority.high,
    //       playSound: true,
    //       ticker: 'payment',
    //     );
    //   case 'chat':
    //     return AndroidNotificationDetails(
    //       'chat_channel',
    //       'Chat Notifications',
    //       channelDescription: 'Chat messages and replies',
    //       importance: Importance.max,
    //       priority: Priority.high,
    //       playSound: true,
    //       ticker: 'chat',
    //       largeIcon: FilePathAndroidBitmap(imageUrl),

    //       // ✅ REPLY ACTION
    //       actions: <AndroidNotificationAction>[
    //         AndroidNotificationAction(
    //           'REPLY_ACTION', // Action key
    //           'Reply',
    //           inputs: <AndroidNotificationActionInput>[
    //             AndroidNotificationActionInput(
    //               label: 'Type a reply...', // placeholder
    //             ),
    //           ],
    //           showsUserInterface: true,
    //           allowGeneratedReplies: true,
    //         ),
    //       ],

    //       styleInformation: const InboxStyleInformation(
    //         [],
    //         htmlFormatContentTitle: true,
    //       ),
    //     );

    //   case 'announcement':
    //     return AndroidNotificationDetails(
    //       'announcement_channel',
    //       'Announcements',
    //       channelDescription: 'Community announcements and broadcasts',
    //       importance: Importance.high,
    //       priority: Priority.defaultPriority,
    //       playSound: true,
    //       styleInformation: BigPictureStyleInformation(
    //         FilePathAndroidBitmap(imageUrl),
    //         contentTitle: '<b>Announcement</b>',
    //         htmlFormatContentTitle: true,
    //         htmlFormatSummaryText: true,
    //         hideExpandedLargeIcon: true,
    //       ),
    //     );
    //   case 'reminder':
    //     return const AndroidNotificationDetails(
    //       'reminder_channel',
    //       'Reminders',
    //       channelDescription: 'Reminders and alerts',
    //       importance: Importance.max,
    //       priority: Priority.high,
    //       playSound: true,
    //     );
    //   default:
    //     return const AndroidNotificationDetails(
    //       'general_channel',
    //       'General Notifications',
    //       channelDescription: 'Miscellaneous notifications',
    //       importance: Importance.defaultImportance,
    //       priority: Priority.defaultPriority,
    //       playSound: true,
    //     );
    // }
  }

  Future<String> downloadAndSaveImage(String url, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';

    if (url.isNotEmpty) {
      final response = await http.get(Uri.parse(url));
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
    }

    return filePath;
  }

  Future _onNotificationTap(String? payload) async {
    if (payload == null) return;
    final data = jsonDecode(payload);

    switch (data['type']) {
      case 'chat':
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => ChatScreen(chatId: data['chatId']),
        //   ),
        // );
        break;

      case 'announcement':
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => BannerDetailsPage(id: data['bannerId']),
        //   ),
        // );
        break;
    }
  }

  /// Background handler (must be top-level)
  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    await Firebase.initializeApp();
    print('📩 Background message: ${message.data}');
  }

  /// Get FCM token for debugging or server registration
  Future<String?> getToken() async {
    final token = await _messaging.getToken();
    print('🔥 FCM Token: $token');
    return token;
  }
}
