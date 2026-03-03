import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
          notificationCategories: [
            DarwinNotificationCategory(
              'AMBER_CATEGORY',
              actions: [
                DarwinNotificationAction.plain(
                  'OPEN_URL',
                  'View Alert',

                  options: {
                    DarwinNotificationActionOption.foreground,
                    DarwinNotificationActionOption.destructive,
                  },
                ),
              ],
            ),
          ],
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

      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        log('📩 Local notification tapped with payload: ${response.payload}');
        final payload = response.payload;
        if (response.actionId == 'OPEN_URL' &&
            payload != null &&
            payload.isNotEmpty &&
            payload.startsWith('http')) {
          final url = response.payload;
          if (url != null && url.isNotEmpty) {
            await launchUrl(Uri.parse(url));
          }
        }
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

  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    final data = message.data;

    final String type = data['type'] ?? 'general';
    final String isAmber = (data["is_amber_alert"] ?? "false").toString();
    final String priority = (data["priority"] ?? "").toString();
    final String? actionText = data["action_text"];
    final String? actionUrl = data["action_url"];
    final String playsound = (data["include_audio"] ?? "false").toString();
    final String byPassSetting =
        (data["bypass_device_settings"] ?? "false").toString();

    final String title = notification?.title ?? 'Notification';
    final String body = notification?.body ?? 'You have a new message';

    // ✅ download image if exists
    String? imagePath;
    if (data["media_url"] != null && data["media_url"].toString().isNotEmpty) {
      imagePath = await downloadAndSaveImage(
        data["media_url"],
        'notif_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );
    }

    final androidDetails = _getAndroidChannelDetails(
      byPassSetting: byPassSetting,
      playsound: playsound,
      type: type,
      imagePath: imagePath,
      isAmber: isAmber,
      priority: priority,
      actionText: actionText,
      actionUrl: actionUrl,
      body: body,
    );

    final iosDetails = _getIOSDetails(
      byPassSetting: byPassSetting,
      isAmber: isAmber,
      priority: priority,
      playsound: playsound,
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      notificationDetails,
      payload: actionUrl, // 👈 used when tapped
    );
  }

  AndroidNotificationDetails _getAndroidChannelDetails({
    required String type,
    required String? imagePath,
    required String isAmber,
    required String priority,
    required String? actionText,
    required String? actionUrl,
    required String playsound,
    required String byPassSetting,
    required String body,
  }) {
    final bool isAmberTrue = isAmber.toLowerCase() == "true";
    final String priorityLower = priority.toLowerCase();

    final bool isUrgentAmber = isAmberTrue && priorityLower == "urgent";
    final bool isHighAmber = isAmberTrue && priorityLower == "high";
    final bool isNormalAmber =
        isAmberTrue && (priorityLower.isEmpty || priorityLower == "normal");
    final bool shouldBypass = byPassSetting.toLowerCase() == "true";

    final bool shouldShowActionByPriority =
        priorityLower == 'high' || priorityLower == 'urgent';

    final bool showAction =
        shouldShowActionByPriority && actionText != null && actionUrl != null;
    final bool isplaySound = playsound.toLowerCase() == "true";

    String? soundName;
    if (isAmberTrue && isplaySound) {
      soundName = 'amber_urgent';
    }
    // 🔥 STYLE SELECTION
    StyleInformation style;

    if (imagePath != null) {
      style = BigPictureStyleInformation(
        FilePathAndroidBitmap(imagePath),
        summaryText: body,
        htmlFormatSummaryText: true,
        hideExpandedLargeIcon: true, // ✅ FIXED
      );
    } else {
      style = BigTextStyleInformation(body, htmlFormatBigText: true);
    }

    // 🔥 CHANNEL SELECTION (restored your logic)
    switch (type) {
      case 'payment':
        return AndroidNotificationDetails(
          'payment_channel',
          'Payment Notifications',
          channelDescription: 'Notifications related to payments',
          importance: Importance.max,
          priority: Priority.high,
          styleInformation: style,
        );

      case 'chat':
        return AndroidNotificationDetails(
          'chat_channel',
          'Chat Notifications',
          channelDescription: 'Chat messages and replies',
          importance: Importance.max,
          priority: Priority.high,
          largeIcon:
              imagePath != null ? FilePathAndroidBitmap(imagePath) : null,
          styleInformation: style,
        );

      case 'reminder':
        return AndroidNotificationDetails(
          'reminder_channel',
          'Reminders',
          channelDescription: 'Reminders and alerts',
          importance: Importance.max,
          priority: Priority.high,
          styleInformation: style,
        );

      default:
        // 🔥 determine importance by amber priority
        Importance importance;
        Priority notifPriority;
        bool bypassDnd = false;
        bool fullScreen = false;
        String channelId = 'general_channel';
        String channelName = 'General Notifications';

        if (isUrgentAmber) {
          importance = Importance.max;
          notifPriority = Priority.high;
          bypassDnd = shouldBypass; // 🔥 key for urgent
          fullScreen = shouldBypass; // 🔥 emergency feel
          channelId = 'amber_urgent_channel_v2'; // 🔥 bump version
          channelName = 'Amber Alerts (Urgent)';
        } else if (isHighAmber) {
          importance = Importance.high;
          notifPriority = Priority.high;
          channelId = 'amber_high_channel';
          channelName = 'Amber Alerts (High)';
        } else if (isNormalAmber) {
          importance = Importance.defaultImportance;
          notifPriority = Priority.defaultPriority;
          channelId = 'amber_normal_channel';
          channelName = 'Amber Alerts';
        } else {
          importance = Importance.defaultImportance;
          notifPriority = Priority.defaultPriority;
        }

        return AndroidNotificationDetails(
          channelId,
          channelName,
          channelDescription: 'Miscellaneous notifications',
          importance: importance,
          priority: notifPriority,
          playSound: isplaySound,
          sound: RawResourceAndroidNotificationSound('amber_urgent'),
          // 🔥 only urgent tries to bypass DND
          channelBypassDnd: bypassDnd,

          // 🔥 only urgent uses fullscreen
          fullScreenIntent: fullScreen,

          // collapsed image
          largeIcon:
              imagePath != null ? FilePathAndroidBitmap(imagePath) : null,

          styleInformation: style,

          actions:
              showAction
                  ? [
                    AndroidNotificationAction(
                      'OPEN_URL',
                      actionText,
                      showsUserInterface: true,
                      cancelNotification: true,
                    ),
                  ]
                  : null,
        );
    }
  }

  DarwinNotificationDetails _getIOSDetails({
    required String isAmber,
    required String byPassSetting,
    required String priority,
    required String playsound,
  }) {
    final bool isAmberTrue = isAmber.toLowerCase() == "true";
    final String priorityLower = priority.toLowerCase();

    final bool isUrgentAmber = isAmberTrue && priorityLower == "urgent";
    final bool isHighAmber = isAmberTrue && priorityLower == "high";

    final bool isplaySound = playsound.toLowerCase() == "true";
    String? soundName;
    if (isplaySound) {
      soundName = 'amber_alert.caf'; // your CAF file name
    }

    InterruptionLevel level = InterruptionLevel.active;

    if (isUrgentAmber) {
      level = InterruptionLevel.timeSensitive; // 🔥 strongest allowed
    } else if (isHighAmber) {
      level = InterruptionLevel.active;
    }

    return DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: isplaySound,

      sound: "amber_alert.caf",
      interruptionLevel: level,
      categoryIdentifier: isUrgentAmber ? 'AMBER_CATEGORY' : null,
    );
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

  // Future _onNotificationTap(String? payload) async {
  //   if (payload == null) return;
  //   final data = jsonDecode(payload);

  //   switch (data['type']) {
  //     case 'chat':
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (_) => ChatScreen(chatId: data['chatId']),
  //       //   ),
  //       // );
  //       break;

  //     case 'announcement':
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (_) => BannerDetailsPage(id: data['bannerId']),
  //       //   ),
  //       // );
  //       break;
  //   }
  // }

  /// Background handler (must be top-level)
  ///
  Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    await Firebase.initializeApp();
    print('📩 Background message: ${message.data}');
    await _showLocalNotification(message);
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  /// Get FCM token for debugging or server registration
  Future<String?> getToken() async {
    final token = await _messaging.getToken();
    print('🔥 FCM Token: $token');
    return token;
  }
}
