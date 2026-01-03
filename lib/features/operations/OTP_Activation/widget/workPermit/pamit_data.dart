import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/Wor_permit_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/getActiveOtpByfilter_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/workPermit/permit_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PermitData extends ConsumerWidget {
  const PermitData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeOtasync = ref.watch(getWorkpermitProvider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(getActiveOtpProvider.notifier)
              .refreshActive(context, ref),

      child: activeOtasync.when(
        data: (activeOtp) {
          if (activeOtp!.data!.permits!.isNotEmpty) {
            return BuildPermitlist(otp: activeOtp.data);
          } else {
            return _buildEmtyBody();
          }

          // If data is valid
        },
        loading: () {
          final cachedOtp = ref.read(getWorkpermitProvider).value;

          if (cachedOtp != null &&
              cachedOtp.status! &&
              cachedOtp.data!.permits!.isNotEmpty) {
            return BuildPermitlist(otp: cachedOtp.data);
          }

          return const Loadingstates();
        },
        error: (error, stack) {
          try {
            // Handle session expiration
            if (error.toString().contains("Unauthorized")) {
              return const Expiresessionbody();
            }
            final otp = ref.read(getWorkpermitProvider).value;

            // Try to show cached data

            if (otp!.data!.permits!.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    BuildPermitlist(otp: otp.data),
                    Emmergencybody(error: error.toString()),
                  ],
                ),
              );
            }

            // No cached data available
            return Builderroul(
              error: error.toString(),
              onTap:
                  () => ref
                      .read(getActiveOtpProvider.notifier)
                      .refreshActive(context, ref),
              firstMessae: "Faile to load Active OTPs?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(getWorkpermitProvider.notifier)
                      .refreshActive(context, ref),
              firstMessae: "Faile to load Active OTPs?",
            );
          }
        },
      ),

      // Expanded(
      //   child:
      //       generatedList.isNotEmpty
      //           ? _buildMemberList(ref, size)
      //           : _buildEmtyBody(),
      // ),
    );
  }

  Widget _buildEmtyBody() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetPaths.setCurfew, height: 100, width: 100),
            SizedBox(height: 10),
            Text(
              "Your Active Otp permit appears here",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black300,
                fontSize: 12,
                fontWeight: FontFamilies.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
