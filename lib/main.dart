import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:curnectgate/features/chat/data/chat_model/message_model.dart';
import 'package:curnectgate/features/chat/data/chat_model/messages_Enum/M_enum.dart';
import 'package:curnectgate/features/chat/data/hive_migration.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/screen/estateOnbarding.dart';
import 'package:curnectgate/features/member_management/screen/tab_screen/CommunityScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {}

  SharedPreferences preferences = await SharedPreferences.getInstance();

  var id = preferences.getString("currentuserId");
  runApp(
    ProviderScope(
      // Wrap your app with ProviderScope
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: id != null ? EstateOnboardingScreen() : CommunityScreen(),
      ),
    ),
  );
}
