import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/models/slected_eletion_type_model.dart';
import 'package:curnectgate/features/estate_management/elections/provider/poll_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/votingSettingCheck.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/get_workOder/work_order.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/getWorkOdder_provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/expired_used_count_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/count_data.dart';
import 'package:curnectgate/features/operations/notifications/provider/getevent_provider.dart';
import 'package:curnectgate/features/operations/violation/model/report_models/violation_response.dart';
import 'package:curnectgate/features/operations/violation/report_provider/getReport_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StatisitcData {
  final String title;
  final String subtitle;
  final String icon;
  final String count;

  StatisitcData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.count,
  });
}

class Statistics extends ConsumerWidget {
  Statistics({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(userRoleProvider);
    return ConstrainedBox(
      // ← safer than fixed height
      constraints: const BoxConstraints(
        minHeight: 180, // enough for ~4 items
        maxHeight: 200, // prevents growing forever
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(
                0.18,
              ), // ← adjust opacity 0.15–0.30
              blurRadius: 16, // bigger blur = softer/larger shadow
              spreadRadius: 4, // spreads shadow outward
              offset: const Offset(0, 6), // downward offset for natural drop
            ),
            // Optional: add a second subtle shadow for depth
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildActiveOtPCount(context),
              const Divider(height: 1),

              role.when(
                data: (data) {
                  if (data.isNotEmpty) {
                    if (data.toLowerCase().contains("staff") ||
                        data.toLowerCase().contains("family_member")) {
                      return SizedBox();
                    } else {
                      return Column(children:[
                        _buildWprkOrderCount(ref, context),
                        const Divider(height: 1),
                      ]);
                    }
                  } else {
                    return SizedBox();
                  }
                },
                error: (e, s) {
                  return SizedBox();
                },
                loading: () {
                  return SizedBox();
                },
              ),
              _buildViolationCount(context, ref),
              const Divider(height: 1),
              _buildEventCount(context, ref),
              const Divider(height: 1),
              _buildPoll(ref, context),
            ],
          ),
        ),
        // child: ListView.separated(
        //   shrinkWrap: true, // ← very important if not full screen
        //   physics:
        //       const ClampingScrollPhysics(), // disable scroll if inside scrollable parent
        //   itemCount: statList.length,
        //   separatorBuilder: (context, index) => const Divider(height: 1),
        //   itemBuilder: (context, index) {
        //     final e = statList[index];
        //     return _buildStatContent(
        //       icon: e.icon,
        //       title: e.title,
        //       subtitle: e.subtitle,
        //       trailing: e.count,
        //       onTap: () {
        //         if (e.title.contains("Visitors")) {
        //           context.pushNamed(AppRoutes.activeOtpHistory);
        //         }
        //       }, // ← add navigation later
        //     );
        //   },
        // ),
      ),
    );
  }

  Widget _buildEventCount(BuildContext context, WidgetRef ref) {
    final getListEventCount = ref.watch(getEventProvider);
    return getListEventCount.when(
      data: (data) {
        if (data?.data != null) {
          final count = data?.data?.count ?? 0;
          return _buildStatContent(
            trailing: count,

            title: "Event",
            subtitle: "All availabe events",
            icon: AssetPaths.dashboardEvents,
            onTap: () {
              showUserBottomSheet(
                context: context,
                headertitle: "",
                headersubtitle: "Revoked  OTP",
                ref: ref,
                bottom: BottomSheetView.events,
                id: 0,
              );
            },
          );
        } else {
          return _buildStatContent(
            trailing: 0,

            title: "Event",
            subtitle: "All availabe events",
            icon: AssetPaths.dashboardEvents,
            onTap: () {
              showUserBottomSheet(
                context: context,
                headertitle: "",
                headersubtitle: "Revoked  OTP",
                ref: ref,
                bottom: BottomSheetView.events,
                id: 0,
              );
            },
          );
        }
      },
      error: (e, s) {
        return _buildStatContent(
          trailing: 0,

          title: "Event",
          subtitle: "All availabe events",
          icon: AssetPaths.dashboardEvents,
          onTap: () {
            showUserBottomSheet(
              context: context,
              headertitle: "",
              headersubtitle: "Revoked  OTP",
              ref: ref,
              bottom: BottomSheetView.events,
              id: 0,
            );
          },
        );
      },
      loading: () {
        return _buildStatContent(
          trailing: 0,

          title: "Event",
          subtitle: "All availabe events",
          icon: AssetPaths.dashboardEvents,
          onTap: () {
            showUserBottomSheet(
              context: context,
              headertitle: "",
              headersubtitle: "Revoked  OTP",
              ref: ref,
              bottom: BottomSheetView.events,
              id: 0,
            );
          },
        );
      },
    );
  }

  int _calculateViolationCount(ViolationResponse? report) {
    if (report?.data?.summary != null) {
      final summary = report!.data?.summary;
      return summary!.pending + summary.investigating;
    }

    // Fallback to manual count if summary is missing (e.g. older cached data)
    final violations = report?.data?.violations ?? [];
    return violations
        .where(
          (v) =>
              (v.status).toLowerCase() == 'investigating' ||
              (v.status).toLowerCase() == 'pending',
        )
        .length;
  }

  Widget _buildViolationCount(BuildContext context, WidgetRef ref) {
    final async = ref.watch(userReportProvider);

    return async.when(
      data: (report) {
        final count = _calculateViolationCount(report);

        return _buildStatContent(
          trailing: count,
          title: "Violation",
          subtitle: "Pending/Investigating Report",
          icon: AssetPaths.vaolationIcon,
          onTap: () => context.pushNamed(AppRoutes.violation),
        );
      },

      loading: () {
        final cached = ref.read(userReportProvider).value;
        final count = _calculateViolationCount(cached);

        return _buildStatContent(
          trailing: count,
          title: "Violation",
          subtitle: "Pending/Investigating Report",
          icon: AssetPaths.vaolationIcon,
          onTap: () => context.pushNamed(AppRoutes.violation),
        );
      },

      error: (error, stack) {
        final cached = ref.read(userReportProvider).value;
        final count = _calculateViolationCount(cached);

        return _buildStatContent(
          trailing: count,
          title: "Violation",
          subtitle: "Pending/Investigating Report",
          icon: AssetPaths.vaolationIcon,
          onTap: () => context.pushNamed(AppRoutes.violation),
        );
      },
    );
  }

  Widget _buildActiveOtPCount(BuildContext context) {
    return CountDataForAll<int>(
      provider: combinedVisitorCountProvider,
      emptyBody: _buildStatContent(
        trailing: 0,
        title: "Visitors",
        subtitle: "Used/Expired Otp",
        icon: AssetPaths.visitorivite,
        onTap: () {
          context.pushNamed(AppRoutes.activeOtpHistory);
        },
      ),
      builder:
          (data) => _buildStatContent(
            trailing: data,
            title: "Visitors",
            subtitle: "Used/Expired Otp",
            icon: AssetPaths.visitorivite,
            onTap: () {
              context.pushNamed(AppRoutes.activeOtpHistory);
            },
          ),
    );
  }

  Widget _buildPoll(WidgetRef ref, BuildContext context) {
    final pollAsync = ref.watch(pollProvider);
    return Votingsettingcheck(
      child: pollAsync.when(
        data: (data) {
          final polls = data?.data?.polls ?? [];
          final activePolls =
              polls
                  .where(
                    (p) =>
                        (p.status ?? "").toLowerCase().contains('active') ||
                        (p.status ?? "").toLowerCase().contains('live'),
                  )
                  .toList();

          if (activePolls.isEmpty) {
            return const SizedBox.shrink();
          }

          return _buildStatContent(
            title: "Elections/Polls",
            subtitle: "Latest Poll/Elections in your community",
            icon: AssetPaths.newPoll,
            trailing: activePolls.length,
            onTap: () {
              final activePolls =
                  polls
                      .where(
                        (p) =>
                            p.status?.toLowerCase().contains('active') ==
                                true ||
                            p.status?.toLowerCase().contains('live') == true,
                      )
                      .toList();

              if (activePolls.isNotEmpty) {
                showSelectElectionBottomSheet(
                  context: context,
                  ref: ref,
                  activePolls: activePolls,
                );
              }
            }, // ← add navigation later
          );
        },
        loading: () => const SizedBox.shrink(),
        error: (_, __) => const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildWprkOrderCount(WidgetRef ref, BuildContext context) {
    final async = ref.watch(workOrderProvider);

    int resolveCount(List<WorkOrder>? list) {
      final safeList = list ?? [];
      return safeList
          .where(
            (e) =>
                (e.status ?? '').toLowerCase() == 'in_progress' ||
                (e.status ?? '').toLowerCase() == 'approved',
          )
          .length;
    }

    return async.when(
      data: (data) {
        final list = data?.data.workorders.data;
        final count = resolveCount(list);

        return _buildStatContent(
          title: "Work Order",
          subtitle: "Start/in progress",
          icon: AssetPaths.dashboardWorkOrder,
          trailing: count,
          onTap: () => context.pushNamed(AppRoutes.workOrder),
        );
      },

      error: (e, st) {
        final cached = ref.read(workOrderProvider).value;
        final count = resolveCount(cached?.data.workorders.data);

        return _buildStatContent(
          title: "Work Order",
          subtitle: "Start/in progress",
          icon: AssetPaths.dashboardWorkOrder,
          trailing: count,
          onTap: () => context.pushNamed(AppRoutes.workOrder),
        );
      },

      loading: () {
        final cached = ref.read(workOrderProvider).value;
        final count = resolveCount(cached?.data.workorders.data);

        return _buildStatContent(
          title: "Work Order",
          subtitle: "Start/in progress",
          icon: AssetPaths.dashboardWorkOrder,
          trailing: count,
          onTap: () => context.pushNamed(AppRoutes.workOrder),
        );
      },
    );
  }

  Widget _buildStatContent({
    required String icon,
    required String title,
    required String subtitle,
    required int trailing,
    required VoidCallback onTap,
  }) {
    return InkWell(
      // makes whole row tappable
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.instance.teal100,
          child:
              title.toLowerCase().contains("event")
                  ? Icon(Icons.event, color: AppColors.instance.teal400)
                  : title.toLowerCase().contains("election")
                  ? Icon(Icons.how_to_vote, color: AppColors.instance.teal400)
                  : Image.asset(icon, width: 28, height: 28),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight:
                FontWeight
                    .bold, // FontFamilies.bold → assuming it's FontWeight.bold
            color: AppColors.instance.black600,
            fontSize: 15,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontWeight.w500, // medium
            color: AppColors.instance.black300,
            fontSize: 13,
          ),
        ),
        trailing: SizedBox(
          width: 60, // ← fixed width prevents overflow & layout issues
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                trailing.toString(),
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontWeight.bold,
                  color: AppColors.instance.black600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
