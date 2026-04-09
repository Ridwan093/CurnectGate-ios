import 'package:upgrader/upgrader.dart';

class UpdateConfig {
  static final upgrader = Upgrader(
    // debugLogging: true, // Set to true to see debug logs
    // debugDisplayAlways: true, // Force the dialog to show in debug mode
    durationUntilAlertAgain: const Duration(days: 1), // Remind daily
  );
}
