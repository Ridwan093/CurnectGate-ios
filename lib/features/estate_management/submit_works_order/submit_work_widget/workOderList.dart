import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/get_workOder/work_order.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/get_workOder/work_order_data.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class Workoderlist extends ConsumerWidget {
  final WorkOrderData? data;
  const Workoderlist({super.key, required this.data});

  String _formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('MMM d, yyyy').format(date);
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: data?.workorders.data.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final vendorLog = data?.workorders.data[index];
        return WorkOrderCard(
          onChange: () {
            showUserBottomSheet(
              context: context,
              headertitle: "Manage Vendor Log",
              headersubtitle: "Manage  ${vendorLog?.category?.name ?? ""}",
              ref: ref,
              bottom: BottomSheetView.vendorLog,
              id: vendorLog?.id ?? 0,
              vendor: vendorLog,
            );
          },
          data: WorkOrderCardData(
            vendor: vendorLog,

            title: vendorLog?.category?.name ?? "",
            location:
                "${vendorLog?.estateAddress?.blockNumber ?? ""} . ${vendorLog?.estateAddress?.flatNumber ?? ""}",
            code: vendorLog?.vendorAccessCode ?? "",
            startDate: _formatDate(vendorLog?.startDate ?? ""),
            endDate: _formatDate(vendorLog?.endDate ?? ""),
            workers: vendorLog?.numberOfWorkers ?? 0,
            status: _buildStatusProgress(vendorLog?.status ?? ""),
            etaText: _statuscheck(vendorLog?.status ?? ""),
          ),
        );
      },
    );
  }

  String _statuscheck(String status) {
    switch (status.toLowerCase()) {
      case "pending":
        return "PENDING";
      case "in_progress":
        return "IN PROGRESS";
      case "approved":
        return "APPROVED";

      case "cancelled":
        return "CANCELLED";

      case "completed":
        return "COMPLETED";

      default:
        return "PENDING";
    }
  }

  WorkOrderStatus _buildStatusProgress(String status) {
    switch (status.toLowerCase()) {
      case "cancelled":
        return WorkOrderStatus.cancelled;
      case "pending":
        return WorkOrderStatus.pending;

      case "in_progress":
        return WorkOrderStatus.inProgress;
      case "completed":
        return WorkOrderStatus.completed;
      case "approved":
        return WorkOrderStatus.started;
      default:
        return WorkOrderStatus.pending;
    }
  }
}

class WorkOrderCardData {
  final String title;
  final String location;
  final String code;
  final String startDate;
  final String endDate;
  final int workers;

  final WorkOrderStatus status;
  final String? etaText;
  final WorkOrder? vendor;
  const WorkOrderCardData({
    required this.title,
    required this.location,
    required this.code,
    required this.startDate,
    required this.endDate,
    required this.workers,
    required this.status,
    required this.vendor,
    this.etaText,
  });
}

class WorkOrderCard extends StatelessWidget {
  final WorkOrderCardData data;
  final VoidCallback? onChange;

  const WorkOrderCard({super.key, required this.data, this.onChange});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.only(top: 12, bottom: 10),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: size.width,

          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.instance.grey300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(data: data, onChange: onChange),

              const SizedBox(height: 16),

              _DateRow(data: data),

              const SizedBox(height: 12),

              _WorkersRow(count: data.workers),

              const SizedBox(height: 16),

              _StatusBanner(data: data),

              const SizedBox(height: 16),

              _ProgressStepper(status: data.status),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  final WorkOrderCardData data;
  final VoidCallback? onChange;

  const _Header({required this.data, required this.onChange});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.instance.teal300,
          child: Icon(Icons.water_drop, color: Colors.white, size: 20),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.instance.black600,
                ),
              ),
              Text(
                data.location,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 13,
                  color: AppColors.instance.black400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (data.status == WorkOrderStatus.inProgress ||
                data.status == WorkOrderStatus.started) ...[
              _builduplodButton(ref, context, data.vendor),
            ] else if (data.status == WorkOrderStatus.pending) ...[
              OutlinedButton(
                onPressed: onChange,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.instance.teal300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Change",
                  style: TextStyle(
                    color: AppColors.instance.teal300,
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],

            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  data.code,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 18,
                    color: AppColors.instance.black400,
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: data.code));
                  },
                  child: Image.asset(
                    AssetPaths.clipboard,
                    height: 15,
                    width: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _builduplodButton(
    WidgetRef ref,
    BuildContext context,
    WorkOrder? vendor,
  ) {
    return IconButton(
      onPressed: () {
        showUserBottomSheet(
          context: context,
          headertitle: "Uploade After Photo",
          headersubtitle:
              "Upload after photo for  ${vendor?.category?.name ?? ""}",
          ref: ref,
          bottom: BottomSheetView.afterphoto,
          id: vendor?.id ?? 0,
        );
      },
      icon: Icon(
        Icons.upload_file,
        color: AppColors.instance.teal300,
        size: 30,
      ),
    );
  }
}

class _DateRow extends StatelessWidget {
  final WorkOrderCardData data;

  const _DateRow({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: AppColors.instance.grey400),
        SizedBox(height: 5),
        Row(
          children: [
            Expanded(child: _DateItem(label: "Start", value: data.startDate)),
            Container(
              alignment: Alignment.bottomCenter,
              width: 1,
              height: 45,
              color: AppColors.instance.grey400,
            ),
            SizedBox(width: 10),
            Expanded(child: _DateItem(label: "End", value: data.endDate)),
          ],
        ),
        SizedBox(height: 5),
        Divider(color: AppColors.instance.grey400),
      ],
    );
  }
}

class _DateItem extends StatelessWidget {
  final String label;
  final String value;

  const _DateItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 13, color: AppColors.instance.black400),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.instance.black600,
          ),
        ),
      ],
    );
  }
}

class _WorkersRow extends StatelessWidget {
  final int count;

  const _WorkersRow({required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Workers",
          style: TextStyle(fontSize: 13, color: AppColors.instance.black400),
        ),
        const Spacer(),
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.instance.black600,
          ),
        ),
      ],
    );
  }
}

class _StatusBanner extends StatelessWidget {
  final WorkOrderCardData data;

  const _StatusBanner({required this.data});

  Color _getStatusColor(WorkOrderStatus status) {
    switch (status) {
      case WorkOrderStatus.completed:
        return AppColors.instance.teal500;
      case WorkOrderStatus.pending:
        return AppColors.instance.black300;
      case WorkOrderStatus.inProgress:
        return AppColors.instance.blue600;
      case WorkOrderStatus.started:
        return AppColors.instance.yellow500;
      case WorkOrderStatus.cancelled:
        return AppColors.instance.error700;
    }
  }

  Color _getBackgroundColor(WorkOrderStatus status) {
    switch (status) {
      case WorkOrderStatus.completed:
        return AppColors.instance.teal100;
      case WorkOrderStatus.pending:
        return AppColors.instance.grey300;
      case WorkOrderStatus.inProgress:
        return AppColors.instance.blue100;
      case WorkOrderStatus.started:
        return AppColors.instance.yellow100;
      case WorkOrderStatus.cancelled:
        return AppColors.instance.error300;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(data.status);
    final bgColor = _getBackgroundColor(data.status);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(_buildStatusIcon(data.status), color: statusColor, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "${data.etaText ?? ''}",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _buildStatusIcon(WorkOrderStatus status) {
    switch (status) {
      case WorkOrderStatus.completed:
        return Icons.check_circle;
      case WorkOrderStatus.pending:
        return Icons.access_time;
      case WorkOrderStatus.inProgress:
        return Icons.hourglass_empty;
      case WorkOrderStatus.started:
        return Icons.play_circle_fill;
      case WorkOrderStatus.cancelled:
        return Icons.cancel;
    }
  }
}

class _ProgressStepper extends StatelessWidget {
  final WorkOrderStatus status;

  const _ProgressStepper({required this.status});

  bool _isDone(WorkOrderStatus step) => status.index >= step.index;

  IconData _buildStatusIcon(WorkOrderStatus status) {
    switch (status) {
      case WorkOrderStatus.completed:
        return Icons.check_circle;
      case WorkOrderStatus.pending:
        return Icons.access_time;
      case WorkOrderStatus.inProgress:
        return Icons.hourglass_empty;
      case WorkOrderStatus.started:
        return Icons.play_circle_fill;
      case WorkOrderStatus.cancelled:
        return Icons.cancel;
    }
  }

  Color _getStepColor() {
    switch (status) {
      case WorkOrderStatus.completed:
        return AppColors.instance.teal500;
      case WorkOrderStatus.pending:
        return AppColors.instance.black300;
      case WorkOrderStatus.inProgress:
        return AppColors.instance.blue600;
      case WorkOrderStatus.started:
        return AppColors.instance.yellow600;
      case WorkOrderStatus.cancelled:
        return AppColors.instance.error700;
    }
  }

  @override
  Widget build(BuildContext context) {
    final steps =
        WorkOrderStatus.values.where((step) {
          // If cancelled, remove completed
          if (status == WorkOrderStatus.cancelled) {
            return step != WorkOrderStatus.completed;
          }

          // If completed, remove cancelled
          if (status == WorkOrderStatus.completed) {
            return step != WorkOrderStatus.cancelled;
          }

          // Otherwise (pending, started, inProgress), hide both end states
          return step != WorkOrderStatus.completed &&
              step != WorkOrderStatus.cancelled;
        }).toList();
    final textScale = MediaQuery.textScaleFactorOf(context);

    // Clamp scale so accessibility doesn't break layout
    final safeScale = textScale.clamp(0.9, 1.2);
    final activeColor = _getStepColor();

    return Row(
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        final done = _isDone(step);
        final isLast = index == steps.length - 1;

        return Expanded(
          child: Row(
            children: [
              /// STEP NODE + LABEL
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      done
                          ? _buildStatusIcon(status)
                          : Icons.radio_button_unchecked,
                      size: 20,
                      color: done ? activeColor : AppColors.instance.grey400,
                    ),
                    SizedBox(width: 4 * safeScale),

                    /// 🔥 FittedBox prevents overflow on tiny screens
                    Expanded(
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.scaleDown,
                        child: Text(
                          _label(step),
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 20 * safeScale,
                            fontFamily: FontFamilies.interDisplay,
                            fontWeight: FontFamilies.bold,
                            color:
                                done ? activeColor : AppColors.instance.grey400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// CONNECTOR
              if (!isLast)
                Container(
                  width: 16 * safeScale,
                  height: 5,
                  margin: EdgeInsets.symmetric(horizontal: 4 * safeScale),
                  color:
                      status.index > index
                          ? activeColor
                          : AppColors.instance.grey500,
                ),
            ],
          ),
        );
      }),
    );
  }

  String _label(WorkOrderStatus s) {
    switch (s) {
      case WorkOrderStatus.pending:
        return "Pending";
      case WorkOrderStatus.started:
        return "Started";
      case WorkOrderStatus.inProgress:
        return "In Progress";
      case WorkOrderStatus.completed:
        return "Completed";
      case WorkOrderStatus.cancelled:
        return "Cancelled";
    }
  }
}

enum WorkOrderStatus { pending, started, inProgress, completed, cancelled }
