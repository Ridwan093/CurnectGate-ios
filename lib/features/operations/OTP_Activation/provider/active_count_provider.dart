// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/active_Otp_count/active_count/active_count_response.dart';

import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getActiveCountProvider = AsyncNotifierProvider.autoDispose<
  ActiveOtpCountNotifier,
  ActiveCountResponse?
>(() {
  return ActiveOtpCountNotifier();
});

class ActiveOtpCountNotifier
    extends AutoDisposeAsyncNotifier<ActiveCountResponse?> {
  @override
  Future<ActiveCountResponse?> build() async {
    // First try to load from local storage
    final localcount = await SharedPrefsService.getActiveCount();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);


      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshcount = await ref.read(getApiServiceProvider).getActiveCount();

      // Only update local storage if data is different
      if (localcount?.toJson() != freshcount.toJson()) {
        await SharedPrefsService.saveActiveCount(freshcount);
      }

      return freshcount;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
      if (localcount != null) {
        log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
        // Show error toast but still return local data
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text('Using cached data: ${e.toString()}'),
        //       duration: const Duration(seconds: 2),
        //     ),
        //   );
        // });
        return localcount;
      }
      rethrow;
    }
  }
}
