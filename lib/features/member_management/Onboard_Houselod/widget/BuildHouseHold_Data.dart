import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/getHouseHold_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/memberList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HouseholdDatas extends ConsumerWidget {
  const HouseholdDatas({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberHouseHoldasync = ref.watch(houseProvider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref.read(houseProvider.notifier).refreshHuseHold(context, ref),

      child: memberHouseHoldasync.when(
        data: (householdData) {
          final data = householdData?.data;
          final house = data?.householdMembers;
          if (house != null) {
            return Memberlist(housemember: data!.householdMembers!);
          } else {
            return _buildEmtyBody();
          }
        },
        loading: () {
          try {
            final householdData = ref.read(houseProvider).value;
            final data = householdData?.data;

            return householdData?.data != null && data?.householdMembers != null
                ? Memberlist(housemember: data!.householdMembers!)
                : Loadingstates();
          } catch (e) {
            return Loadingstates();
          }
        },
        error: (error, stack) {
          try {
            // Handle session expiration
            if (error.toString().contains("Unauthorized")) {
              return const Expiresessionbody();
            }
            final householdData = ref.read(houseProvider).value;
            final data = householdData?.data;

            // Try to show cached data

            if (data!.householdMembers!.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Memberlist(housemember: data.householdMembers!),
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
                      .read(houseProvider.notifier)
                      .refreshHuseHold(context, ref),
              firstMessae: "Faile to load Member?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(houseProvider.notifier)
                      .refreshHuseHold(context, ref),
              firstMessae: "Faile to load Member?",
            );
          }
        },
      ),
    );
  }

  Widget _buildEmtyBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetPaths.addMember, height: 100, width: 100),
          SizedBox(height: 10),
          Text(
            "Members added to your profile appears here",
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
