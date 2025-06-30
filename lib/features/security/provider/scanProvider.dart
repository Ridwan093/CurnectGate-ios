// Riverpod Providers
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedTabProvider = StateProvider<int>((ref) => 0);
final qrScanProvider = StateProvider<bool>((ref) => false);
final torchStateProvider = StateProvider<bool>((ref) => false);
