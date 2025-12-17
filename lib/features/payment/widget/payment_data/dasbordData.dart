import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/payment/provider/dashbord_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashbordData<T> extends ConsumerWidget {
  final Widget Function(BuildContext context, T data) builder;

  const DashbordData({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashbordProviderAsync = ref.watch(paymentDashbordProvider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(paymentDashbordProvider.notifier)
              .refreshPaymentDashbord(context, ref),
      child: dashbordProviderAsync.when(
        data: (profile) {
          final userData = profile?.data;
          if (userData != null) {
            return builder(context, userData as T);
          } else {
            return EmptyBodys(message: "No dashboard data?");
          }
        },
        loading: () {
          final cachedProfile = ref.read(paymentDashbordProvider).value;
          if (cachedProfile?.data != null) {
            return builder(context, cachedProfile?.data as T);
          } else {
            return Loadingstates();
          }
        },
        error: (error, stack) {
          if (error.toString().contains("Unauthorized")) {
            return Expiresessionbody();
          }

          final cachedProfile = ref.read(paymentDashbordProvider).value;
          if (cachedProfile?.data != null) {
            return builder(context, cachedProfile?.data as T);
          }

          return Builderroul(
            error: error.toString(),
            onTap:
                () => ref
                    .read(paymentDashbordProvider.notifier)
                    .refreshPaymentDashbord(context, ref),
            firstMessae: "Failed to load Dashboard Balance?",
          );
        },
      ),
    );
  }
}
