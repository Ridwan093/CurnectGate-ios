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

  /// Minimal initialization required for background isolates
  Future<void> initBackground() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _localNotifications.initialize(initializationSettings);
  }

  /// Initialize Firebase Messaging + Local Notifications for foreground
  Future<void> initialize() async {
    await Firebase.initializeApp();

    await _requestPermissions();
    await _initializeLocalNotifications();

    FirebaseMessaging.onMessage.listen(_onMessageReceived);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    log('✅ NotificationService initialized successfully');
  }

  Future<void> _onMessageReceived(RemoteMessage message) async {
    log('🔔 Foreground message: ${message.data}');
    await showLocalNotification(message);
  }

  Future<void> _onMessageOpenedApp(RemoteMessage message) async {
    print('🟢 Notification tapped: ${message.data}');
  }

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

  Future<void> showLocalNotification(RemoteMessage message) async {
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

    String titleText = 'Notification';
    if (type == 'new_message') {
      titleText = "New message from ${data["title"] ?? 'Unknown'}";
    } else {
      titleText = data["title"] ?? notification?.title ?? 'Notification';
    }

    final String title = titleText;
    final String body =
        data["body"] ?? notification?.body ?? 'You have a new message';

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

    // 🔥 STYLE SELECTION
    StyleInformation style;

    if (imagePath != null) {
      style = BigPictureStyleInformation(
        FilePathAndroidBitmap(imagePath),
        summaryText: body,
        htmlFormatSummaryText: true,
        hideExpandedLargeIcon: true,
      );
    } else {
      style = BigTextStyleInformation(body, htmlFormatBigText: true);
    }

    // 🔥 CHANNEL SELECTION
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
          importance: Importance.high,
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
        Importance importance;
        Priority notifPriority;
        bool bypassDnd = false;
        bool fullScreen = false;
        String channelId = 'general_channel';
        String channelName = 'General Notifications';

        if (isUrgentAmber) {
          importance = Importance.max;
          notifPriority = Priority.high;
          bypassDnd = shouldBypass;
          fullScreen = shouldBypass;
          channelId = 'amber_urgent_channel_v2';
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
          channelBypassDnd: bypassDnd,
          fullScreenIntent: fullScreen,
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

    InterruptionLevel level = InterruptionLevel.active;
    if (isUrgentAmber) {
      level = InterruptionLevel.timeSensitive;
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

  Future<String?> getToken() async {
    final token = await _messaging.getToken();
    print('🔥 FCM Token: $token');
    return token;
  }
}
