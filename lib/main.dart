import 'dart:developer';

import 'package:curnectgate/core/%20utils/service/app_lifecycle_service.dart';
import 'package:curnectgate/core/%20utils/service/notification_service.dart';
import 'package:curnectgate/core/navigation/app_rout.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/chat/data/hive_migration.dart';
import 'package:curnectgate/features/chat/data/model/chat_message.dart';
import 'package:curnectgate/features/signOut/errorWidget/sesional_expired.dart';
import 'package:curnectgate/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FlutterLocalization.instance.ensureInitialized();
  await NotificationService().initialize();
  // Initialize Hive with your app's documents directory
  await Hive.initFlutter();
  // Hive.registerAdapter(MessagesAdapter());
  try {
    await HiveMigration.migrateMessages();
  } catch (e) {
    log('Migration error: $e');
  }
  // Open message boxes
  await Hive.openBox<ChatMessage>('messages');

  // SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      // Wrap your app with ProviderScope
      child: DevicePreview(
        enabled: true,
        builder: (context) => MyApp(), // Wrap your app
      ),
    ),
  );
}

//  MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: id != null ? EstateOnboardingScreen() : ActivityPage(),
//       ),
//     ),
//   );

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late AppLifecycleService _lifecycleService;

  @override
  void initState() {
    super.initState();
    // Create service with ref
    _lifecycleService = AppLifecycleService(ref);
  }

  @override
  void dispose() {
    _lifecycleService.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context, ) {
    
    final router = ref.watch(routerProvider); // Get the router

    return SessionExpiryListener(
      child: MaterialApp.router(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          // Add more locales if you support them
        ],

        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: AppColors.instance.teal400,
            selectionHandleColor: AppColors.instance.teal400,
            cursorColor: Colors.black,
          ),
        ),
        routerConfig: router,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        // GoRouter integration
        debugShowCheckedModeBanner: false,
        title: 'CurnectGate',
      ),
    );
  }
}
