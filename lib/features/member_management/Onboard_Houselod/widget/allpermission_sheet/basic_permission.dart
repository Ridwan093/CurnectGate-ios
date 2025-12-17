import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/getPermission_status_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/permission_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicPermission extends ConsumerWidget {
  final int id;
  const BasicPermission({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissionAsync = ref.watch(permissionStatusProvider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(permissionStatusProvider.notifier)
              .refreshPermissionstatus(context, ref),
      child: permissionAsync.when(
        data: (profile) {
          try {
            final user = profile?.data;
            if (user != null && user.permissions != null) {
              return PermissionContent(permission: user.permissions, id: id);
            } else {
              return EmptyBodys(message: "No permission settings?");
            }
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(permissionStatusProvider.notifier)
                      .refreshPermissionstatus(context, ref),
              firstMessae: "Faile to load permission settings?",
            );
          }
        },
        loading: () {
          try {
            final cachedsetting = ref.read(permissionStatusProvider).value;
            return cachedsetting != null
                ? PermissionContent(
                  permission: cachedsetting.data?.permissions,
                  id: id,
                )
                : Loadingstates();
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(permissionStatusProvider.notifier)
                      .refreshPermissionstatus(context, ref),
              firstMessae: "Faile to load permission settings?",
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
            final cachedetting = ref.read(permissionStatusProvider).value;
            if (cachedetting != null) {
              return Column(
                children: [
                  PermissionContent(
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
                      .read(permissionStatusProvider.notifier)
                      .refreshPermissionstatus(context, ref),
              firstMessae: "Faile to load gate permission settings?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(permissionStatusProvider.notifier)
                      .refreshPermissionstatus(context, ref),
              firstMessae: "Faile to load permission settings?",
            );
          }
        },
      ),
    );
  }
}
