import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/getpermissionStatic_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/packing_access_content.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/visitor_inivitaiton_cotent.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PackingAccessSettingsScreen extends ConsumerWidget {
  final int id;
  const PackingAccessSettingsScreen({super.key, required this.id});

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
              return PackingAccessContent(permission: user.permissions, id: id);
            } else {
              return EmptyBodys(message: "No packing settings?");
            }
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(statisticProvider.notifier)
                      .refreshPermission(context, ref),
              firstMessae: "Faile to load packing setting?",
            );
          }
        },
        loading: () {
          try {
            final cachedsetting = ref.read(statisticProvider).value;
            return cachedsetting != null
                ? PackingAccessContent(
                  permission: cachedsetting.data?.permissions,
                  id: id,
                )
                : Container(height: 200, child: Loadingstates());
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(statisticProvider.notifier)
                      .refreshPermission(context, ref),
              firstMessae: "Faile to load packing setting?",
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
                  VisitorInivitaitonCotent(
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
              firstMessae: "Faile to load packing settings?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(statisticProvider.notifier)
                      .refreshPermission(context, ref),
              firstMessae: "Faile to load pcaking setting?",
            );
          }
        },
      ),
    );
  }
}
