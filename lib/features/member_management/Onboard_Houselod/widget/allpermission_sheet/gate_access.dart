import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/getpermissionStatic_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/gateAccess_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GateSettingsScreen extends ConsumerWidget {
  final int id;

  const GateSettingsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissionAsync = ref.watch(statisticProvider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(statisticProvider.notifier)
              .refreshPermission(context, ref),
      child: permissionAsync.when(
        data: (profile) {
          try {
            final user = profile?.data;
            if (user != null && user.permissions != null) {
              return GateContet(permission: user.permissions, id: id);
            } else {
              return EmptyBodys(message: "No gate settings?");
            }
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(statisticProvider.notifier)
                      .refreshPermission(context, ref),
              firstMessae: "Faile to load gate?",
            );
          }
        },
        loading: () {
          try {
            final cachedsetting = ref.read(statisticProvider).value;
            return cachedsetting != null
                ? GateContet(
                  permission: cachedsetting.data?.permissions,
                  id: id,
                )
                : Loadingstates();
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(statisticProvider.notifier)
                      .refreshPermission(context, ref),
              firstMessae: "Faile to load gate?",
            );
          }
        },
        error: (error, stack) {
          try {
            // Handle session expiration
            if (error is DioException && error.response?.statusCode == 401) {
              return const Expiresessionbody();
            }

            // Try to show cached data
            final cachedetting = ref.read(statisticProvider).value;
            if (cachedetting != null) {
              return Column(
                children: [
                  GateContet(
                    permission: cachedetting.data?.permissions,
                    id: id,
                  ),
                  Emmergencybody(error: error.toString()),
                ],
              );
            }

            // No cached data available
            return Builderroul(
              error: error.toString(),
              onTap:
                  () => ref
                      .read(statisticProvider.notifier)
                      .refreshPermission(context, ref),
              firstMessae: "Faile to load gate settings?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(statisticProvider.notifier)
                      .refreshPermission(context, ref),
              firstMessae: "Faile to load gate?",
            );
          }
        },
      ),
    );
  }
}
