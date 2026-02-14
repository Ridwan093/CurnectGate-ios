// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/%20operations/property_agreement/model/agreements_response.dart';
import 'package:curnectgate/features/%20operations/property_agreement/model/compliance/compliance_response.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final complianceprovider =
    AsyncNotifierProvider.autoDispose<AgreementNotifier, ComplianceResponse?>(
      () {
        return AgreementNotifier();
      },
    );

class AgreementNotifier extends AutoDisposeAsyncNotifier<ComplianceResponse?> {
  @override
  Future<ComplianceResponse?> build() async {
    // First try to load from local storage
    final localAgreement = await SharedPrefsService.getCompliance();

    try {
      // Then try to fetch fresh data
     

    
      final freshAgreement =
          await ref.read(getApiServiceProvider).getMyComplence();

      // Only update local storage if data is different
      if (localAgreement?.toJson() != freshAgreement.toJson()) {
        await SharedPrefsService.saveCompliance(freshAgreement);
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

  Future<void> refreshCompliance(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final freshAgreement =
            await ref.read(getApiServiceProvider).getMyComplence();
        await SharedPrefsService.saveCompliance(freshAgreement);
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

        final localAgreement = await SharedPrefsService.getCompliance();
        if (localAgreement != null) return localAgreement;
        rethrow;
      }
    });
  }
}
