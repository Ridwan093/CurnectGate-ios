import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/getPermittactive_permitt.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/workPermit/permit_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class PermitData extends ConsumerWidget {
  const PermitData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeOtasync = ref.watch(getActivePermit);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh: () =>
          ref.read(getActivePermit.notifier).refreshActive(context, ref),

      child: activeOtasync.when(
        data: (activeOtp) {
          final otps = activeOtp?.data?.otps;

          if (otps != null && otps.isNotEmpty && activeOtp?.data != null) {
            final data = activeOtp!.data; // promoted safely by condition
            return BuildPermitlist(otp: data);
          }

          return _buildEmtyBody();
        },

        loading: () {
          final cachedOtp = ref.read(getActivePermit).value;
          final cachedData = cachedOtp?.data;
          final cachedOtps = cachedData?.otps;

          final hasCachedData =
              (cachedOtp?.status ?? false) &&
              cachedOtps != null &&
              cachedOtps.isNotEmpty;

          if (hasCachedData && cachedData != null) {
            return BuildPermitlist(otp: cachedData);
          }

          return const Loadingstates();
        },

        error: (error, stack) {
          try {
          if (error.toString().contains("Unauthorized")) {
            return const Expiresessionbody();
          }

          final cachedOtp = ref.read(getActivePermit).value;
          final cachedData = cachedOtp?.data;
          final cachedOtps = cachedData?.otps;

          if (cachedOtps != null && cachedOtps.isNotEmpty && cachedData != null) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  BuildPermitlist(otp: cachedData),
                  Emmergencybody(error: error.toString()),
                ],
              ),
            );
          }

          return Builderroul(
            error: error.toString(),
            onTap: () =>
                ref.read(getActivePermit.notifier).refreshActive(context, ref),
            firstMessae: "Failed to load permit?",
          );
      
    } catch (e) {
       return Builderroul(
            error: e.toString(),
            onTap: () =>
                ref.read(getActivePermit.notifier).refreshActive(context, ref),
            firstMessae: "Failed to load permit?",
          );
      
    
  }} ));}

  Widget _buildEmtyBody() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetPaths.setCurfew, height: 100, width: 100),
            const SizedBox(height: 10),
            Text(
              "Your active permit appear here",
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
