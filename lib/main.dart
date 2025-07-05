import 'dart:developer';

import 'package:curnectgate/core/navigation/app_rout.dart';
import 'package:curnectgate/features/chat/data/chat_model/message_model.dart';
import 'package:curnectgate/features/chat/data/chat_model/messages_Enum/M_enum.dart';
import 'package:curnectgate/features/chat/data/hive_migration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      // theme: Theme.of(context).,
      routerConfig: router, // GoRouter integration
      debugShowCheckedModeBanner: false,
      title: 'CurnectGate',
    );
  }
}
