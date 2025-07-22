import 'dart:developer';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/violation/model/GetReport_history_model.dart';
import 'package:curnectgate/features/%20operations/violation/report_provider/getReport_history_provider.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                final sortedData = [...data!]..sort(
                  (a, b) =>
                      _getStatusPriority(a.status) -
                      _getStatusPriority(b.status),
                );

                return Column(children: [buildStatusTimeline(data)]);
              } else {
                return Text("");
              }

              // If data is valid
            },
            loading: () {
              final cachedOtp = ref.read(reportHisoryProvider).value;

              if (cachedOtp != null && cachedOtp.status) {
                return Column(
                  children: [
                    // _buildTimelineStep(
                    //   time: '20:40 PM',
                    //   title: 'Report sent has been confirmed',
                    //   subtitle: 'We are currently looking this up',
                    //   isFirst: true,
                    //   isCompleted: true,
                    // ),
                    // _buildTimelineStep(
                    //   time: '15:30 PM',
                    //   title: 'Report has been assigned to authorities involved',
                    //   subtitle: '',
                    //   isCompleted: true,
                    // ),
                    // _buildTimelineStep(
                    //   time: '4:20 PM',
                    //   title: 'marked as Done',
                    //   subtitle: '',
                    //   isCompleted: true,
                    //   isLast: true,
                    // ),
                  ],
                );
              }

              return const Loadingstates();
            },
            error: (error, stack) {
              if (error.toString().contains("Unauthenticated")) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ref.read(authProvider.notifier).seassionExpire(context, ref);
                });
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

              final cachedOtp = ref.read(reportHisoryProvider).value;

              if (cachedOtp != null && cachedOtp.status) {
                return Column(
                  children: [
                    // _buildTimelineStep(
                    //   time: '20:40 PM',
                    //   title: 'Report sent has been confirmed',
                    //   subtitle: 'We are currently looking this up',
                    //   isFirst: true,
                    //   isCompleted: true,
                    // ),
                    // _buildTimelineStep(
                    //   time: '15:30 PM',
                    //   title: 'Report has been assigned to authorities involved',
                    //   subtitle: '',
                    //   isCompleted: true,
                    // ),
                    // _buildTimelineStep(
                    //   time: '4:20 PM',
                    //   title: 'marked as Done',
                    //   subtitle: '',
                    //   isCompleted: true,
                    //   isLast: true,
                    // ),
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
          // Column(
          //   children: [
          //     _buildTimelineStep(
          //       time: '20:40 PM',
          //       title: 'Report sent has been confirmed',
          //       subtitle: 'We are currently looking this up',
          //       isFirst: true,
          //       isCompleted: true,
          //     ),
          //     _buildTimelineStep(
          //       time: '15:30 PM',
          //       title: 'Report has been assigned to authorities involved',
          //       subtitle: '',
          //       isCompleted: true,
          //     ),
          //     _buildTimelineStep(
          //       time: '4:20 PM',
          //       title: 'marked as Done',
          //       subtitle: '',
          //       isCompleted: true,
          //       isLast: true,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  int _getStatusPriority(String status) {
    switch (status) {
      case 'Pending':
        return 1;
      case 'investigating':
        return 2;
      case 'resolved':
        return 3;
      default:
        return 0;
    }
  }

  // Widget reportCheck(String status, HistoryItem e) {
  //   switch (status) {
  //     case "pending":
  //       return _buildTimelineStep(
  //         time: formatToTime(e.changedAt),
  //         title: 'Report sent has been confirmed',
  //         subtitle: 'We are currently looking this up',
  //         isFirst: true,
  //         isCompleted: true,
  //       );
  //     case "investigating":
  //       return _buildTimelineStep(
  //         time: formatToTime(e.changedAt),
  //         title: 'Report has been ${e.notes}',
  //         subtitle: '',
  //         isFirst: true,
  //         isCompleted: true,
  //       );
  //     case "dismissed":
  //       return _buildTimelineStep(
  //         time: formatToTime(e.changedAt),
  //         title: e.notes,
  //         subtitle: '',
  //         isFirst: true,
  //         isCompleted: true,
  //         isLast: true,
  //       );
  //     case "resolved":
  //       return _buildTimelineStep(
  //         time: formatToTime(e.changedAt),
  //         title: "marked as Done",
  //         subtitle: '',
  //         isFirst: true,
  //         isCompleted: true,
  //         isLast: true,
  //       );

  //     default:
  //       return _buildTimelineStep(
  //         time: formatToTime(e.changedAt),
  //         title: "marked as Done",
  //         subtitle: '',
  //         isFirst: true,
  //         isCompleted: true,
  //         isLast: true,
  //       );
  //   }
  // }
  Widget buildStatusTimeline(List<HistoryItem> history) {
    // Sort history by date (oldest first)
    final sortedHistory = [...history]
      ..sort((a, b) => a.changedAt.compareTo(b.changedAt));

    // Get current status (last item in sorted list)
    final currentStatus = sortedHistory.last.status;

    return Column(
      children: [
        // Completed steps
        for (int i = 0; i < sortedHistory.length; i++)
          _buildTimelineStep(
            time: formatToTime(sortedHistory[i].changedAt),
            title: _getStatusTitle(sortedHistory[i]),
            subtitle: sortedHistory[i].notes,
            isFirst: i == 0,
            isLast: i == sortedHistory.length - 1,
            isCompleted: true,
            isCurrent: sortedHistory[i].status == currentStatus,
            status: sortedHistory[i].status,
          ),

        // Waiting step (only if not resolved/dismissed)
        if (currentStatus != "resolved" && currentStatus != "dismissed")
          _buildTimelineStep(
            time: "",
            title: _getNextStatusTitle(currentStatus),
            subtitle: "Waiting for resolution",
            isLast: true,
            isCompleted: false,
            isWaiting: true, // Mark as waiting step
            status: _getNextStatus(currentStatus),
          ),
      ],
    );
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
                              .black400 // Orange for pending
                          : isCurrent
                          ? AppColors
                              .instance
                              .teal500 // Dark teal for current
                          : isCompleted
                          ? AppColors
                              .instance
                              .teal300 // Light teal for completed
                          : AppColors.instance.grey200, // Grey for future
                ),
                child:
                    isWaiting
                        ? Icon(
                          // Clock icon for waiting steps
                          Icons.radio_outlined,
                          size: 14,
                          color: Colors.white,
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

  String _getStatusTitle(HistoryItem item) {
    switch (item.status) {
      case "pending":
        return 'Report submitted';
      case "investigating":
        return item.notes.isNotEmpty
            ? 'Report has been  ${item.notes}'
            : 'Under investigation';
      case "dismissed":
        return 'Case dismissed';
      case "resolved":
        return 'Marked as Done';
      default:
        return 'Status updated';
    }
  }

  String _getStatussubtitle(HistoryItem item) {
    switch (item.status) {
      case "pending":
        return item.notes.isNotEmpty ? item.notes : 'Under investigation';
      case "investigating":
        return "";

      case "dismissed":
        return '';
      case "resolved":
        return 'Case resolved';
      default:
        return 'Status updated';
    }
  }

  String _getNextStatusTitle(String currentStatus) {
    switch (currentStatus) {
      case "pending":
        return "Waiting for investigation";
      case "investigating":
        return "Waiting for resolution";
      default:
        return "Next step";
    }
  }

  String _getNextStatus(String currentStatus) {
    switch (currentStatus) {
      case "pending":
        return "investigating";
      case "investigating":
        return "resolved";
      default:
        return "";
    }
  }

  Widget _buildTimelineSte({
    required String time,
    required String title,
    required String subtitle,
    bool isFirst = false,
    bool isLast = false,
    bool isCompleted = false,
    bool isDissmis = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Time column
        isCompleted
            ? SizedBox(
              width: 60,
              child: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.instance.black400,
                    fontWeight: FontFamilies.medium,
                    fontFamily: FontFamilies.interDisplay,
                  ),
                ),
              ),
            )
            : SizedBox(),

        // Timeline line + circle
        Container(
          width: 24,
          child: Column(
            children: [
              // Short top line
              if (!isFirst)
                Container(
                  height: 8, // Shorter top line
                  width: 3,
                  color: AppColors.instance.teal300,
                ),

              // Step circle
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isCompleted
                          ? isDissmis
                              ? AppColors.instance.error500
                              : AppColors.instance.teal300
                          : AppColors.instance.grey300,
                ),
                child:
                    isCompleted
                        ? Icon(
                          isDissmis ? Icons.close : Icons.check,
                          size: 14,
                          color: AppColors.instance.grey200,
                        )
                        : Center(
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.instance.grey200,
                            ),
                          ),
                        ),
              ),

              // Long bottom line
              if (!isLast)
                Container(
                  height: 40, // Longer bottom line
                  width: 3,
                  color: AppColors.instance.teal300,
                ),
            ],
          ),
        ),

        const SizedBox(width: 12),

        // Step content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontWeight.w500,
                    color:
                        isCompleted
                            ? AppColors.instance.black600
                            : AppColors.instance.grey500,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
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
