import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/CurfewProvider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/curfew_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurfewSettingsScreen extends ConsumerWidget {
  final int id;

  const CurfewSettingsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissionAsync = ref.watch(getCurfewSettingProvider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(getCurfewSettingProvider.notifier)
              .refreshPermission(context, ref),
      child: permissionAsync.when(
        data: (profile) {
          try {
            final user = profile?.data;
            return user != null
                ? CurfewContent(permission: user.curfewSettings!, id: id)
                : EmptyBodys(message: "No curfew settings?");
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(getCurfewSettingProvider.notifier)
                      .refreshPermission(context, ref),
              firstMessae: "Faile to load curfew?",
            );
          }
        },
        loading: () {
          try {
            final cachedsetting = ref.read(getCurfewSettingProvider).value;
            return cachedsetting != null
                ? CurfewContent(
                  permission: cachedsetting.data!.curfewSettings!,
                  id: id,
                )
                : Loadingstates();
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(getCurfewSettingProvider.notifier)
                      .refreshPermission(context, ref),
              firstMessae: "Faile to load profile?",
            );
          }
        },
        error: (error, stack) {
          try {
            // Handle session expiration
            if (error.toString().contains("Unauthorized")) {
              return const Expiresessionbody();
            }

            // Try to show cached getCurfewSettingProvider
            final cachedetting = ref.read(getCurfewSettingProvider).value;
            if (cachedetting != null) {
              return Column(
                children: [
                  CurfewContent(
                    permission: cachedetting.data!.curfewSettings!,
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
                      .read(getCurfewSettingProvider.notifier)
                      .refreshPermission(context, ref),
              firstMessae: "Faile to load curfew settings?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(getCurfewSettingProvider.notifier)
                      .refreshPermission(context, ref),
              firstMessae: "Faile to load curfew?",
            );
          }
        },
      ),
    );
  }
}
