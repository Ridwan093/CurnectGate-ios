import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/Work_permit/clearance_permit_data.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/Wor_permit_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/getActiveOtpByfilter_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/workPermit/permit_history_list.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/workPermit/textform.dart';
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
          if (activeOtp?.data?.permits?.isNotEmpty ?? false) {
            var data = activeOtp?.data;
            return _buildShearcWithDataBody(data!);
          } else {
            return _buildEmtyBody();
          }

          // If data is valid
        },
        loading: () {
          final cachedOtp = ref.read(getWorkpermitProvider).value;

          if (cachedOtp?.data?.permits?.isNotEmpty ?? false) {
            var data = cachedOtp?.data;
            return _buildShearcWithDataBody(data!);
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

            if (otp?.data?.permits?.isNotEmpty ?? false) {
              var data = otp?.data;
              return _buildShearcWithDataBody(data!);
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

  Widget _buildShearcWithDataBody(ClearancePermitData data) {
    return Column(
      children: [
        PermitSearchField(),
        SizedBox(height: 10),

        Expanded(child: BuildPermitlist(otp: data)),
      ],
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
              "Your permit appears here",
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
