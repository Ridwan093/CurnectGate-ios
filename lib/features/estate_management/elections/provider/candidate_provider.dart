// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/candidate/candidates_response.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final candidateProvider =
    AsyncNotifierProvider.autoDispose<CandidateNotifier, CandidatesResponse?>(
      () {
        return CandidateNotifier();
      },
    );

class CandidateNotifier extends AutoDisposeAsyncNotifier<CandidatesResponse?> {
  @override
  Future<CandidatesResponse?> build() async {
    // First try to load from local storage
    final locaCandidate = await SharedPrefsService.getCandidate();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }
      final id = ref.watch(electionProvider).id.toString();
      if (id.isEmpty) {
        throw Exception("Unauthenticated");
      }
      final freshCanidate = await ref
          .read(getApiServiceProvider)
          .getCandidate(bearerToken: token, id: id);

      // Only update local storage if data is different
      if (locaCandidate?.toJson() != freshCanidate.toJson()) {
        await SharedPrefsService.saveCandidate(freshCanidate);
      }

      return freshCanidate;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}");
      if (locaCandidate != null) {
        log("${e}");
        // Show error toast but still return local data
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text('Using cached data: ${e.toString()}'),
        //       duration: const Duration(seconds: 2),
        //     ),
        //   );
        // });
        return locaCandidate;
      }
      rethrow;
    }
  }

  Future<void> refreshCandidate(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final id = ref.watch(electionProvider).id.toString();
        final token = await ref.watch(accessTokenProvider.future);
        final freshCandidate = await ref
            .read(getApiServiceProvider)
            .getCandidate(bearerToken: token!, id: id);
        await SharedPrefsService.saveCandidate(freshCandidate);
        return freshCandidate;
      } catch (e) {
        if (e.toString().contains(
          "Unauthenticated. Please login to continue.",
        )) {
          log(e.toString());
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else if (e.toString().contains("The connection errored")) {
          log(e.toString());
          showCustomSuccessToast(
            context: context,
            message: 'Connection failed. Please check your network',
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey300,
            positionNumber: 72,
          );
        }

        final localcandidate = await SharedPrefsService.getCandidate();
        if (localcandidate != null) return localcandidate;
        rethrow;
      }
    });
  }
}
