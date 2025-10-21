import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


/// Handles both FCM (remote) and local notifications for iOS & Android.
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

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
    String title = notification?.title ?? 'Notification';
    String body = notification?.body ?? 'You have a new message';

    final AndroidNotificationDetails androidDetails =
        _getAndroidChannelDetails(type);

    final NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _localNotifications.show(
      notification.hashCode,
      title,
      body,
      notificationDetails,
      payload: type,
    );
  }

  /// Define different notification channels based on type
  AndroidNotificationDetails _getAndroidChannelDetails(String type) {
    switch (type) {
      case 'payment':
        return const AndroidNotificationDetails(
          'payment_channel',
          'Payment Notifications',
          channelDescription: 'Notifications related to payments',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          ticker: 'payment',
        );
      case 'chat':
        return const AndroidNotificationDetails(
          'chat_channel',
          'Chat Notifications',
          channelDescription: 'Chat messages and replies',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          ticker: 'chat',
        );
      case 'announcement':
        return const AndroidNotificationDetails(
          'announcement_channel',
          'Announcements',
          channelDescription: 'Community announcements and broadcasts',
          importance: Importance.high,
          priority: Priority.defaultPriority,
          playSound: true,
        );
      case 'reminder':
        return const AndroidNotificationDetails(
          'reminder_channel',
          'Reminders',
          channelDescription: 'Reminders and alerts',
          importance: Importance.max,
          priority: Priority.high,
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
  }

  /// Background handler (must be top-level)
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
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
