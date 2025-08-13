import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/getpermissionStatic_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/community_forum_content.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Community_Forum extends ConsumerWidget {
  final int id;
  const Community_Forum({super.key, required this.id});

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
              return CommunityForumContent(
                permission: user.permissions,
                id: id,
              );
            } else {
              return EmptyBodys(message: "No commnuity forum data?");
            }
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(statisticProvider.notifier)
                      .refreshPermission(context, ref),
              firstMessae: "Faile to load commnuity forum setting?",
            );
          }
        },
        loading: () {
          try {
            final cachedsetting = ref.read(statisticProvider).value;
            return cachedsetting != null
                ? CommunityForumContent(
                  permission: cachedsetting.data?.permissions,
                  id: id,
                )
                : Container(height: 300, child: Loadingstates());
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(statisticProvider.notifier)
                      .refreshPermission(context, ref),
              firstMessae: "Faile to load commnuity forum setting?",
            );
          }
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

            // Try to show cached data
            final cachedetting = ref.read(statisticProvider).value;
            if (cachedetting != null) {
              return Column(
                children: [
                  CommunityForumContent(
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
              firstMessae: "Faile to load commnuity forum settings?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(statisticProvider.notifier)
                      .refreshPermission(context, ref),
              firstMessae: "Faile to load commnuity forum setting?",
            );
          }
        },
      ),
    );
  }
}
