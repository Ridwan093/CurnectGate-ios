// Riverpod Providers
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabIndexProvider = StateProvider<int>((ref) => 0);
final bottomSheetProvider = StateProvider<bool>((ref) => false);
final cardStatusProvider = StateProvider<bool>((ref) => true);


enum BottomSheetType { settings, confirmation ,startGenerate }
enum ConfirmationAction { regenerate, deactivate , activate}

final bottomSheetTypeProvider = StateProvider<BottomSheetType?>((ref) => null);
final confirmationActionProvider = StateProvider<ConfirmationAction?>((ref) => null);


