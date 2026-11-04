// Provider for your API class
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/features/security/model/count_model/violation_count_response.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// provider: lib/.../providers.dart
final violationCountProvider = FutureProvider.autoDispose.family<
  ViolationCountResponse?,
  String
>((ref, type) async {
  // Try load cached
  final local = await SharedPrefsService.getViolationCount();

  try {
    // Fetch fresh from API using the passed `type` argument
    final fresh = await ref.read(getApiServiceProvider).getViolationCounts();

    // Save if changed
    if (local == null || local.toJson() != fresh.toJson()) {
      await SharedPrefsService.saveViolationCount(fresh);
    }

    return fresh;
  } catch (e) {
    // On error return cached when available, else rethrow so FutureProvider goes to error state
    if (local != null) return local;
    rethrow;
  }
});
