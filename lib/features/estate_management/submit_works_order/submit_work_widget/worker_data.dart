import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/getWorkOdder_provider.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/workOderList.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkOderData extends ConsumerWidget {
  const WorkOderData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeOtasync = ref.watch(workOrderProvider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(workOrderProvider.notifier)
              .refreshWorkOrders(context, ref),

      child: activeOtasync.when(
        data: (workOder) {
          // if (workOder?.data.workorders != null) {
          //   return Workoderlist(data: workOder?.data);
          // } else {
          //   return _buildEmtyBody();
          // }
          return workOder?.data.workorders.data != null
              ? Workoderlist(data: workOder?.data)
              : _buildEmtyBody();
          // If data is valid
        },
        loading: () {
          final workOder = ref.read(workOrderProvider).value;

          if (workOder != null && workOder.status) {
            return Workoderlist(data: workOder.data);
          }

          return const Loadingstates();
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
            final workOder = ref.read(workOrderProvider).value;

            // Try to show cached data

            if (workOder!.data.workorders.data.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Workoderlist(data: workOder.data),
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
                      .read(workOrderProvider.notifier)
                      .refreshWorkOrders(context, ref),
              firstMessae: "Faile to load workoder?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(workOrderProvider.notifier)
                      .refreshWorkOrders(context, ref),
              firstMessae: "Faile to load workoder?",
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
            Image.asset(AssetPaths.dashboardWorkOrder, height: 100, width: 100),
            SizedBox(height: 10),
            Text(
              "Your work detailes appears here",
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
