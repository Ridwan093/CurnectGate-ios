// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/%20operations/property_agreement/model/agreements_response.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final agreementProvider =
    AsyncNotifierProvider.autoDispose<AgreementNotifier, AgreementsResponse?>(
      () {
        return AgreementNotifier();
      },
    );

class AgreementNotifier extends AutoDisposeAsyncNotifier<AgreementsResponse?> {
  @override
  Future<AgreementsResponse?> build() async {
    // First try to load from local storage
    final localAgreement = await SharedPrefsService.getAgreement();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshAgreement =
          await ref.read(getApiServiceProvider).getAgreement();

      // Only update local storage if data is different
      if (localAgreement?.toJson() != freshAgreement.toJson()) {
        await SharedPrefsService.saveAgreement(freshAgreement);
      }

      return freshAgreement;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e} THIS IS agreemnet SCREEN THAT LOADING AFTER LOGOUT THE APP");
      if (localAgreement != null) {
        return localAgreement;
      }
      rethrow;
    }
  }

  Future<void> refreshAgreement(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final freshAgreement =
            await ref.read(getApiServiceProvider).getAgreement();
        await SharedPrefsService.saveAgreement(freshAgreement);
        return freshAgreement;
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

        final localAgreement = await SharedPrefsService.getAgreement();
        if (localAgreement != null) return localAgreement;
        rethrow;
      }
    });
  }
}
