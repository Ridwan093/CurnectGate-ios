import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/provider/getActiveOtpByfilter_provider.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/widget/buildActiveList.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivedataWidget extends ConsumerWidget {
  const ActivedataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeOtasync = ref.watch(getActiveOtpProvider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(getActiveOtpProvider.notifier)
              .refreshActive(context, ref),

      child: activeOtasync.when(
        data: (activeOtp) {
          if (activeOtp!.data.otps.isNotEmpty) {
            return Buildactivelist(otp: activeOtp.data);
          } else {
            return _buildEmtyBody();
          }

          // If data is valid
        },
        loading: () {
          final cachedOtp = ref.read(getActiveOtpProvider).value;

          if (cachedOtp != null &&
              cachedOtp.status &&
              cachedOtp.data.otps.isNotEmpty) {
            return Buildactivelist(otp: cachedOtp.data);
          }

          return const Loadingstates();
        },
        error: (error, stack) {
          if (error.toString().contains("Unauthenticated")) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ref.read(authProvider.notifier).seassionExpire(context, ref);
            });
            return const Expiresessionbody();
          }
          if (error.toString().contains("connection")) {
            return Builderroul(
              error: error.toString(),
              onTap:
                  () => ref
                      .read(getActiveOtpProvider.notifier)
                      .refreshActive(context, ref),
              firstMessae: "Failed to load Active OTPs",
            );
          }

          final cachedOtp = ref.read(getActiveOtpProvider).value;

          if (cachedOtp != null &&
              cachedOtp.status &&
              cachedOtp.data.otps.isNotEmpty) {
            return Column(
              children: [
                Buildactivelist(otp: cachedOtp.data),
                Emmergencybody(error: error.toString()),
              ],
            );
          }

          return Builderroul(
            error: error.toString(),
            onTap:
                () => ref
                    .read(getActiveOtpProvider.notifier)
                    .refreshActive(context, ref),
            firstMessae: "Failed to load Active OTPs",
          );
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetPaths.dashboardWorkOrder, height: 100, width: 100),
          SizedBox(height: 10),
          Text(
            "Your Active Otp detailes appears here",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black300,
              fontSize: 12,
              fontWeight: FontFamilies.medium,
            ),
          ),
        ],
      ),
    );
  }
}
