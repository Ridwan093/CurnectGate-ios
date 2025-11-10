import 'dart:developer';

import 'package:curnectgate/core/%20utils/service/notification_service.dart';
import 'package:curnectgate/core/navigation/app_rout.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/chat/data/chat_model/message_model.dart';
import 'package:curnectgate/features/chat/data/chat_model/messages_Enum/M_enum.dart';
import 'package:curnectgate/features/chat/data/hive_migration.dart';
import 'package:curnectgate/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await NotificationService().initialize();
  // Initialize Hive with your app's documents directory
  await Hive.initFlutter();

  // Register adapters (generated files)

  Hive.registerAdapter(MessageEnumAdapter()); // From M_enum.dart
  Hive.registerAdapter(MessagesAdapter()); // Your generated adapter
  try {
    await HiveMigration.migrateMessages();
  } catch (e) {
    log('Migration error: $e');
  }
  // Open message boxes
  await Hive.openBox<Messages>('chat_messages'); // Active messages
  await Hive.openBox<Messages>('pending_messages');

  // SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      // Wrap your app with ProviderScope
      child: MyApp(),
    ),
  );
}

//  MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: id != null ? EstateOnboardingScreen() : ActivityPage(),
//       ),
//     ),
//   );

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider); // Get the router

    return MaterialApp.router(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.instance.teal400,
          selectionHandleColor: AppColors.instance.teal400,
          cursorColor: Colors.black,
        ),
      ),
      routerConfig: router, // GoRouter integration
      debugShowCheckedModeBanner: false,
      title: 'CurnectGate',
    );
  }
}

// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;

// Future<void> sendNotificationToAll({
//   required String bearerToken, // <-- new parameter
//   required String message,
//   required String messageType,
//   required String senderName,
//   required String senderProfilePix,
//   required String senderId,
//   required List<String> tokens,
// }) async {
//   try {
//     if (tokens.isEmpty) {
//       print('No tokens found.');
//       return;
//     }

//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $bearerToken',
//     };

//     for (String deviceToken in tokens) {
//       final Map<String, dynamic> body = {
//         'message': {
//           'token': deviceToken,
//           'notification': {
//             'title': '$senderName sent a message',
//             'body': message,
//           },
//           'data': {
//             'type': messageType,
//             'senderId': senderId,
//             'senderName': senderName,
//             'senderProfilePix': senderProfilePix,
//           },
//         },
//       };

//       // Add APNS payload for iOS
//       if (Platform.isIOS) {
//         body['message']['apns'] = {
//           'payload': {
//             'aps': {
//               'mutable-content': 1,
//               'sound': 'default',
//               'alert': {
//                 'title': '$senderName sent a message',
//                 'body': message,
//               },
//             },
//           },
//         };
//       }

//       final response = await http.post(
//         Uri.parse(
//           'https://fcm.googleapis.com/v1/projects/curnect-test-f9bc0/messages:send',
//         ),
//         headers: headers,
//         body: json.encode(body),
//       );

//       if (response.statusCode == 200) {
//         print('✅ Notification sent to $deviceToken');
//       } else {
//         print('❌ Failed to send notification: ${response.statusCode} -> ${response.body}');
//       }
//     }
//   } catch (e) {
//     print('⚠️ Error sending notification: $e');
//   }
// }
