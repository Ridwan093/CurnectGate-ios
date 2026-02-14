import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/features/%20operations/property_agreement/management_popup_screen.dart';
import 'package:curnectgate/features/%20operations/property_agreement/provider/agreement_provider.dart';
import 'package:curnectgate/features/%20operations/property_agreement/provider/complince_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgreementPopupData extends ConsumerWidget {
  final Widget child;
  const AgreementPopupData({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agreementAsync = ref.watch(complianceprovider);
    return agreementAsync.when(
      data: (agreement) {
        try {
          final user = agreement?.data?.agreementStatus?.propertyAgreement;
          return user != null
              ? AgreementCheck(mustSign: user.accepted ?? false, child: child)
              : EmptyBodys(message: "No agreement?");
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(complianceprovider.notifier)
                    .refreshCompliance(context, ref),
            firstMessae: "Faile to load Agreement?",
          );
        }
      },
      loading: () {
        try {
          final cachedProfile = ref.read(complianceprovider).value;
          final data =
              cachedProfile
                  ?.data
                  ?.agreementStatus
                  ?.propertyAgreement
                  ?.accepted ??
              false;
          "";
          return cachedProfile?.data?.agreementStatus != null
              ? AgreementCheck(mustSign: data, child: child)
              : Loadingstates();
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(complianceprovider.notifier)
                    .refreshCompliance(context, ref),
            firstMessae: "Faile to load agreement?",
          );
        }
      },
      error: (error, stack) {
        try {
          // Handle session expiration
          if (error.toString().contains("Unauthorized")) {
            return Expiresessionbody();
          }

          // Try to show cached data
          final cachedProfile = ref.read(complianceprovider).value;
          final data =
              cachedProfile
                  ?.data
                  ?.agreementStatus
                  ?.propertyAgreement
                  ?.accepted ??
              false;
          "";
          if (cachedProfile?.data?.agreementStatus?.propertyAgreement != null) {
            return AgreementCheck(mustSign: data, child: child);
          }

          // No cached data available
          return Builderroul(
            error: error.toString(),
            onTap:
                () => ref
                    .read(agreementProvider.notifier)
                    .refreshAgreement(context, ref),
            firstMessae: "Faile to load agreement?",
          );
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(agreementProvider.notifier)
                    .refreshAgreement(context, ref),
            firstMessae: "Faile to load agreement?",
          );
        }
      },
    );
  }
}
