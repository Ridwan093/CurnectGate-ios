import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/history_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/buildActiveList.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActiveHistoryDataWidget extends ConsumerWidget {
  const ActiveHistoryDataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeOtasync = ref.watch(getActiveOtpHistoryProvider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(getActiveOtpHistoryProvider.notifier)
              .refreshActive(context, ref),

      child: activeOtasync.when(
        data: (activeOpt) {
          final otp = activeOpt?.data;
          if (otp!.otps.isNotEmpty) {
            return Buildactivelist(otp: otp);
          } else {
            return _buildEmtyBody();
          }
        },
        loading: () {
          try {
            final otp = ref.read(getActiveOtpHistoryProvider).value;
            return otp!.data!.otps.isNotEmpty
                ? Buildactivelist(otp: otp.data)
                : Loadingstates();
          } catch (e) {
            return Loadingstates();
          }
        },
        error: (error, stack) {
          try {
            // Handle session expiration
            if (error.toString().contains("Unauthenticated")) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref.read(authProvider.notifier).seassionExpire(context, ref);
              });
              return Expiresessionbody();
            }
            final otp = ref.read(getActiveOtpHistoryProvider).value;

            // Try to show cached data

            if (otp!.data!.otps.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Buildactivelist(otp: otp.data),
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
                      .read(getActiveOtpHistoryProvider.notifier)
                      .refreshActive(context, ref),
              firstMessae: "Faile to load Active OTPs?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(getActiveOtpHistoryProvider.notifier)
                      .refreshActive(context, ref),
              firstMessae: "Faile to load Active OTPs?",
            );
          }
        },
      ),
    );
  }

  Widget _buildEmtyBody() {
    return Center(
      child: SingleChildScrollView(
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
      ),
    );
  }
}
