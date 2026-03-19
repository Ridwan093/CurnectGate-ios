import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/getActiveOtpByfilter_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/buildActiveList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivedataWidget extends ConsumerWidget {
  const ActivedataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(getActiveOtpProvider.notifier)
              .refreshActive(context, ref),

      child: const _ActiveOtpBody(), // 👈 isolate rebuilds
    );
  }
}

class _ActiveOtpBody extends ConsumerWidget {
  const _ActiveOtpBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeOtpAsync = ref.watch(getActiveOtpProvider);

    return activeOtpAsync.when(
      data: (activeOtp) {
        if (activeOtp!.data!.otps.isNotEmpty) {
          return Consumer(
            // ← Isolate rebuilds here
            builder: (context, ref, child) {
              // Only rebuild this part when getActiveOtpProvider changes
              return Buildactivelist(otp: activeOtp.data);
            },
          );
        } else {
          return _buildEmptyBody();
        }
      },
      loading: () {
        final cachedOtp = ref.read(getActiveOtpProvider).value;

        if (cachedOtp != null &&
            cachedOtp.status &&
            cachedOtp.data!.otps.isNotEmpty) {
          return Buildactivelist(otp: cachedOtp.data);
        }

        return const Loadingstates();
      },
      error: (error, stack) {
        try {
          // Handle session expiration
          if (error.toString().contains("Unauthorized")) {
            return Expiresessionbody();
          }

          final cachedOtp = ref.read(getActiveOtpProvider).value;

          if (cachedOtp != null && cachedOtp.data!.otps.isNotEmpty) {
            return SingleChildScrollView(
              child: Column(children: [Buildactivelist(otp: cachedOtp.data)]),
            );
          }
          ;
          // No cached data available
          return Builderroul(
            error: error.toString(),
            onTap:
                () => ref
                    .read(getActiveOtpProvider.notifier)
                    .refreshActive(context, ref),
            firstMessae: "Failed to load Active OTPs?",
          );
        } catch (e) {
          return Builderroul(
            error: error.toString(),
            onTap:
                () => ref
                    .read(getActiveOtpProvider.notifier)
                    .refreshActive(context, ref),
            firstMessae: "Failed to load Active OTPs?",
          );
        }
      },
    );
  }

  Widget _buildEmptyBody() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetPaths.dashboardActivities,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 10),
            Text(
              "Active Otp detiles appear here",
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
