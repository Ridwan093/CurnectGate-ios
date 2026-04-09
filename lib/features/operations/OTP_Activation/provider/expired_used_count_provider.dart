// Provider for your API class
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/active_Otp_count/Expired_count/expired_count_response.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// provider: lib/.../providers.dart
final expiredCountProvider = FutureProvider.autoDispose.family<
  ExpiredCountResponse?,
  String
>((ref, type) async {
  // Try load cached
  final local = await SharedPrefsService.getActiveExpiredCount();

  try {
    // Fetch fresh from API using the passed `type` argument
    final fresh = await ref
        .read(getApiServiceProvider)
        .getExpiredCount(used_expired: type);

    // Save if changed
    if (local == null || local.toJson() != fresh.toJson()) {
      await SharedPrefsService.saveActivExpiredeCount(fresh);
    }

    return fresh;
  } catch (e) {
    // On error return cached when available, else rethrow so FutureProvider goes to error state
    if (local != null) return local;
    rethrow;
  }
});

final combinedVisitorCountProvider = FutureProvider.autoDispose<int>((ref) async {
  final used = await ref.watch(expiredCountProvider("used").future);
  final expired = await ref.watch(expiredCountProvider("expired").future);

  return (used?.data?.count ?? 0) + (expired?.data?.count ?? 0);
});
