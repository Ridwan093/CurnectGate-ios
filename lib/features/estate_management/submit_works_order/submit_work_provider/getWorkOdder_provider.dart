// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/get_workOder/work_orders_response.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workOrderProvider =
    AsyncNotifierProvider.autoDispose<WorkOrdrNotifier, WorkOrderResponse?>(
      () {
        return WorkOrdrNotifier();
      },
    );

class WorkOrdrNotifier
    extends AutoDisposeAsyncNotifier<WorkOrderResponse?> {
  @override
  Future<WorkOrderResponse?> build() async {
    // First try to load from local storage
    final localworkOder = await SharedPrefsService.getWorkOrder();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshWork = await ref
          .read(getApiServiceProvider)
          .getWorkerOrder(bearerToken: token);

      // Only update local storage if data is different
      if (localworkOder?.toJson() != freshWork.toJson()) {
        await SharedPrefsService.saveWorkOrder(freshWork);
      }

      return freshWork;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
      if (localworkOder != null) {
        log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
        // Show error toast but still return local data
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text('Using cached data: ${e.toString()}'),
        //       duration: const Duration(seconds: 2),
        //     ),
        //   );
        // });
        return localworkOder;
      }
      rethrow;
    }
  }

  Future<void> refreshWorkOrders(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final freshworkOrders = await ref
            .read(getApiServiceProvider)
            .getWorkerOrder(bearerToken: token!);
        await SharedPrefsService.saveWorkOrder(freshworkOrders);
        return freshworkOrders;
      } catch (e) {
        if (e.toString().contains(
          "Unauthenticated. Please login to continue.",
        )) {
          log(e.toString());
          ref.read(authProvider.notifier).seassionExpire(context, ref);
        } else if (e.toString().contains("The connection errored")) {
          log(e.toString());
          showCustomSuccessToast(
            context: context,
            message: 'Connection failed. Please check your network',
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey300,
            positionNumber: 72,
          );
        }

        final localcat = await SharedPrefsService.getWorkOrder();
        if (localcat != null) return localcat;
        rethrow;
      }
    });
  }
}
