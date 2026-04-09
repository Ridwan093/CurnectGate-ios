import 'dart:developer';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/violation/model/GetReport_history_model.dart';
import 'package:curnectgate/features/operations/violation/report_provider/getReport_history_provider.dart';
import 'package:curnectgate/features/operations/violation/report_provider/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ResolutionTimeline extends ConsumerWidget {
  final int id;
  final String title;
  const ResolutionTimeline({super.key, required this.id, required this.title});
  String formatToTime(DateTime dateTime) {
    try {
      // Convert to local timezone if it's not already
      final localTime = dateTime.toLocal();

      // Format using DateFormat.jm() for 12-hour time with AM/PM
      return DateFormat.jm().format(localTime); // e.g., 4:21 AM
    } catch (e) {
      // Handle formatting errors gracefully
      debugPrint('Error formatting time: $e');
      return 'Invalid time';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ids = ref.watch(reportProvider).report.id;
    log("${id.toString()}  ${ids.toString()}");
    final reportAsync = ref.watch(reportHisoryProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Container(
            alignment: Alignment.topCenter,
            height: 4,
            width: 40,
            color: AppColors.instance.grey300,
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                // Navigator.pop(context);
                context.pop();

                log(id.toString());
              },
              child: Text(
                "Close",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.teal400,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Resolution timeline',
            style: TextStyle(
              fontSize: 13,
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            // 'Improper parking (Block 57)',
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 40),
          reportAsync.when(
            data: (history) {
              final historyData = history?.data;
              if (history?.data != null && historyData?.history != null) {
                final data = historyData?.history;
                // final sortedData = [...data!]..sort(
                //   (a, b) =>
                //       _getStatusPriority(a.status) -
                //       _getStatusPriority(b.status),
                // );

                return Column(children: [buildStatusTimeline(data!)]);
              } else {
                return Text("");
              }

              // If data is valid
            },
            loading: () {
              final history = ref.read(reportHisoryProvider).value;

              final historyData = history?.data;
              if (history?.data != null && historyData?.history != null) {
                final data = historyData?.history;
                // final sortedData = [...data!]..sort(
                //   (a, b) =>
                //       _getStatusPriority(a.status) -
                //       _getStatusPriority(b.status),
                // );

                return Column(children: [buildStatusTimeline(data!)]);
              }
              return const Loadingstates();
            },
            error: (error, stack) {
              if (error.toString().contains("Unauthorized")) {
                return const Expiresessionbody();
              }

              if (error.toString().contains("connection")) {
                return Builderroul(
                  error: error.toString(),
                  onTap:
                      () => ref
                          .read(reportHisoryProvider.notifier)
                          .refreshReports(context, ref, id),
                  firstMessae: "Failed to load Active OTPs",
                );
              }

              final history = ref.read(reportHisoryProvider).value;

              final historyData = history?.data;
              if (history?.data != null && historyData?.history != null) {
                final data = historyData?.history;
                // final sortedData = [...data!]..sort(
                //   (a, b) =>
                //       _getStatusPriority(a.status) -
                //       _getStatusPriority(b.status),
                // );

                return Column(
                  children: [
                    buildStatusTimeline(data!),
                    Emmergencybody(error: error.toString()),
                  ],
                );
              }
              return Builderroul(
                error: error.toString(),
                onTap:
                    () => ref
                        .read(reportHisoryProvider.notifier)
                        .refreshReports(context, ref, id),
                firstMessae: "Failed to load Active OTPs",
              );
            },
          ),
        ],
      ),
    );
  }

  String _getNextStatus(String currentStatus) {
    switch (currentStatus) {
      case 'pending':
        return 'investigating';
      case 'investigating':
        return 'resolved'; // or dismissed
      default:
        return currentStatus;
    }
  }

  Widget buildStatusTimeline(List<HistoryItem> history) {
    //Sort history by date (newest first)
    final sortedHistory = [...history]
      ..sort((a, b) => b.changedAt!.compareTo(a.changedAt!));

    // Get current status (first item in sorted list)
    final currentStatus = sortedHistory.first.status;

    return Column(
      children: [
        // Always show "Report submitted" as first step
        _buildTimelineStep(
          time: formatToTime(getAssignmentTime(history)),
          title: 'Report submitted',
          subtitle: "We are currently looking this up",
          isFirst: true,
          isCompleted: true,
          status: 'pending',
        ),

        // // Show "Under investigation" if status is investigating or beyond
        if (['investigating'].contains(currentStatus))
          _buildTimelineStep(
            time: formatToTime(getInvestigationTime(history)!),
            title: "Report has been assigned to authorities involved",
            subtitle: '',
            isCompleted: currentStatus != 'pending',
            status: 'investigating',
          ),

        // Show "Assigned to authorities" if status is resolved/dismissed
        if (['dismissed', 'resolved'].contains(currentStatus))
          _buildTimelineStep(
            time: formatToTime(getAssignmentTime(history)),
            title: 'Report has been assigned to authorities involved',
            subtitle: '',
            isCompleted: true,
            status: 'assigned',
          ),

        // Show current resolution status (if resolved/dismissed)
        if (['dismissed', 'resolved'].contains(currentStatus))
          _buildTimelineStep(
            time: formatToTime(sortedHistory.first.changedAt!),
            title:
                currentStatus == 'resolved'
                    ? 'Marked as Done'
                    : 'Case dismissed',
            subtitle: sortedHistory.first.notes ?? "",
            isLast: true,
            isCompleted: true,
            status: currentStatus ?? "",
          )
        else
          // Show waiting step if still pending/investigating
          _buildTimelineStep(
            time: '',
            title: 'Waiting for resolution',
            subtitle: '',
            isLast: true,
            isCompleted: false,
            isWaiting: true,
            status: _getNextStatus(currentStatus ?? ""),
          ),
      ],
    );
  }

  // Helper functions
  DateTime? getInvestigationTime(List<HistoryItem> history) {
    // Find first investigating status or use a default time
    return history
        .firstWhere(
          (item) => item.status == 'investigating',
          orElse: () => history.first,
        )
        .changedAt;
  }

  DateTime getAssignmentTime(List<HistoryItem> history) {
    // Find when it was assigned or use a default time
    final assigned = history.firstWhere(
      (item) => ['dismissed', 'resolved'].contains(item.status),
      orElse: () => history.last,
    );
    return assigned.changedAt!.subtract(Duration(hours: 1)); // Example offset
  }

  Widget _buildTimelineStep({
    required String time,
    required String title,
    required String subtitle,
    required String status,
    bool isFirst = false,
    bool isLast = false,
    bool isCompleted = false,
    bool isCurrent = false,
    bool isWaiting = false, // New parameter for pending steps
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Time column
        SizedBox(
          width: 60,
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              time,
              style: TextStyle(
                fontSize: 12,
                color:
                    isCompleted ||
                            isWaiting // Show time if waiting
                        ? AppColors.instance.black400
                        : AppColors.instance.grey400,
              ),
            ),
          ),
        ),

        // Timeline line + circle
        Container(
          width: 24,
          child: Column(
            children: [
              // Top line (only if not first step)
              if (!isFirst)
                Container(
                  height: 8,
                  width: 3,
                  color:
                      isCompleted ||
                              isWaiting // Same line color
                          ? AppColors.instance.teal300
                          : AppColors.instance.grey200,
                ),

              // Circle with icon
              Container(
                width: 20,
                height: 20,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isWaiting
                          ? AppColors
                              .instance
                              .teal300 // Orange for pending
                          : isCurrent
                          ? AppColors
                              .instance
                              .teal300 // Dark teal for current
                          : isCompleted
                          ? AppColors
                              .instance
                              .teal300 // Light teal for completed
                          : AppColors.instance.grey200, // Grey for future
                ),
                child:
                    isWaiting
                        ? Container(
                          margin: EdgeInsets.all(6),
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.instance.grey200,
                          ),
                        )
                        : isCompleted
                        ? Icon(
                          status == "dismissed" ? Icons.close : Icons.check,
                          size: 14,
                          color: Colors.white,
                        )
                        : null,
              ),

              // Bottom line (only if not last step)
              if (!isLast)
                Container(
                  height: 40,
                  width: 3,
                  color:
                      isCompleted ||
                              isWaiting // Same line color
                          ? AppColors.instance.teal300
                          : AppColors.instance.grey200,
                ),
            ],
          ),
        ),

        const SizedBox(width: 12),

        // Step content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight:
                        isCurrent || isWaiting
                            ? FontWeight.w600
                            : FontWeight.normal,
                    color:
                        isWaiting
                            ? AppColors
                                .instance
                                .black400 // Orange text for pending
                            : isCurrent
                            ? AppColors.instance.black400
                            : AppColors.instance.black600,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          isWaiting
                              ? AppColors
                                  .instance
                                  .grey500 // Lighter orange for subtitle
                              : AppColors.instance.grey500,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
