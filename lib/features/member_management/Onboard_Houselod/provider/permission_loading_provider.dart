// permission_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final permissionLoadingProvider = StateNotifierProvider.family<
    PermissionLoadingNotifier, bool, String>((ref, slug) {
  return PermissionLoadingNotifier();
});

class PermissionLoadingNotifier extends StateNotifier<bool> {
  PermissionLoadingNotifier() : super(false);

  void setLoading(bool loading) {
    state = loading;
  }
}