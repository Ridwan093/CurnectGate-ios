import 'dart:developer';

import 'package:curnectgate/core/%20utils/service/app_lifecycle_service.dart';
import 'package:curnectgate/core/%20utils/service/notification_service.dart';
import 'package:curnectgate/core/%20utils/update/update_config.dart';
import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/app_rout.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/chat/data/hive_migration.dart';
import 'package:curnectgate/features/chat/services/reverb_service.dart';
import 'package:curnectgate/features/signOut/errorWidget/sesional_expired.dart';
import 'package:curnectgate/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:upgrader/upgrader.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  final notificationService = NotificationService();
  await notificationService
      .initBackground(); // rename your initBackground to this
  await notificationService.showLocalNotification(message);
}

void main() async {
  //  CRITICAL: Must be the VERY FIRST call in main() before anything else.

  WidgetsFlutterBinding.ensureInitialized();
  // 2. Initialize Firebase
  try {
    print('🔵 [DEBUG] Starting Firebase initialization...');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('✅ [DEBUG] Firebase initialized successfully!');
  } catch (e, stack) {
    print('❌ [DEBUG] FIREBASE INITIALIZATION FAILED!');
    print('Error: $e');
    print('Stack trace: $stack');
  }

  // 3. Register background handler ONLY ONCE, as early as possible
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // 4. Other initializations
  await FlutterLocalization.instance.ensureInitialized();

  // Full notification service init (foreground + local notifications setup)
  await NotificationService().initialize();
  await Hive.initFlutter();

  // Register Hive adapters first (no user required)
  await initChatHive();

  // If a user is already logged in, open their personal Hive boxes immediately.
  try {
    final authData = await SharedPrefsService().getAuthData();
    final userId = authData?['user']?['id']?.toString();
    if (userId != null && userId.isNotEmpty) {
      await openMessagesBox(userId);
      await getConversationsBox(userId);
    }
  } catch (e) {
    log('Hive box init error: $e');
  }

  print('🚀 [DEBUG] Reaching runApp()...');
  runApp(
    ProviderScope(
      child: MyApp(),
      // child: DevicePreview(enabled: true, builder: (context) => MyApp()),
    ),
  );
}

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
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    ref.listen(authProvider, (previous, next) {
      final authState = ref.watch(authProvider);
      final user = authState.user;

      if (user != null) {
        // Safely parse the user ID to ensure it's a valid integer
        final idString = user["id"]?.toString() ?? "0";
        final parsedId = int.tryParse(idString) ?? 0;

        if (parsedId != 0) {
          ReverbService.initRealtime(ref, parsedId);
        } else {
          log(" Cannot init Reverb: User ID is invalid/0");
        }
      }
    }); // Get the router

    return SessionExpiryListener(
      child: UpgradeAlert(
        upgrader: UpdateConfig.upgrader,
        dialogStyle: UpgradeDialogStyle.material,
        showIgnore: false,
        showLater: true,
        barrierDismissible: true,
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
          builder: (context, child) {
            final mediaQuery = MediaQuery.of(context);
            final scale = mediaQuery.textScaleFactor.clamp(0.9, 1.1);

            return MediaQuery(
              data: mediaQuery.copyWith(textScaleFactor: scale),
              child: child!,
            );
          },

          theme: ThemeData(
            progressIndicatorTheme: ProgressIndicatorThemeData(
              color: AppColors.instance.yellow500,
              refreshBackgroundColor: Colors.white,
            ),
            textSelectionTheme: TextSelectionThemeData(
              selectionColor: AppColors.instance.teal400,
              selectionHandleColor: AppColors.instance.teal400,
              cursorColor: Colors.black,
            ),
          ),

          routerConfig: router,
          useInheritedMediaQuery: true,

          // GoRouter integration
          debugShowCheckedModeBanner: false,
          title: 'CurnectGate',
        ),
      ),
    );
  }
}
