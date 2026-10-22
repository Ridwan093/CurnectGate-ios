import 'package:upgrader/upgrader.dart';

class UpdateConfig {
  static final upgrader = Upgrader(
    debugLogging: false,
    debugDisplayAlways: false,
    durationUntilAlertAgain: const Duration(days: 1),
    storeController: UpgraderStoreController(
      oniOS: () => UpgraderAppStore(iOSAppID: '6761664988'),
    ),
  );
}
