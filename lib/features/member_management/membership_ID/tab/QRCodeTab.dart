import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/empty_body.dart';
import 'package:curnectgate/features/member_management/membership_ID/provider/getDigitalIDProvider.dart';
import 'package:curnectgate/features/member_management/membership_ID/widget/QR_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QRCodeTab extends ConsumerWidget {
  const QRCodeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final digitalIDAsync = ref.watch(digitMemberIDprovider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(digitMemberIDprovider.notifier)
              .refreshDigitalID(context, ref),

      child: digitalIDAsync.when(
        data: (digitalcode) {
          final digit = digitalcode?.data;
          if (digit?.user != null && digit?.estate != null) {
            return QrWidget(data: digit!);
          } else {
            return EmptyBody(
              onTap: () {},
              imagepath: AssetPaths.qr,
              emptyMessag: "No Digital Id",
              buttonTexe: "Refre",
            );
          }
        },
        loading: () {
          try {
            final digitalcode = ref.read(digitMemberIDprovider).value;
            final digit = digitalcode?.data;

            return digit?.user != null && digit?.estate != null
                ? QrWidget(data: digit!)
                : Loadingstates();
          } catch (e) {
            return Loadingstates();
          }
        },
        error: (error, stack) {
          try {
            // Handle session expiration
            if (error.toString().contains("Unauthorized")) {
              return Expiresessionbody();
            }
            final digit = ref.read(digitMemberIDprovider).value;

            // Try to show cached data

            if (digit!.data.digitalId!.digitalIdCode!.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    QrWidget(data: digit.data),
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
                      .read(digitMemberIDprovider.notifier)
                      .refreshDigitalID(context, ref),
              firstMessae: "Faile to load Digital code?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(digitMemberIDprovider.notifier)
                      .refreshDigitalID(context, ref),
              firstMessae: "Faile to load Digital code??",
            );
          }
        },
      ),
    );
  }
}
