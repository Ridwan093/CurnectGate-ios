import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/enum/status_num.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/get_workOder/work_order.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/get_workOder/work_order_data.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/status_progress_widget.dart';
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
      return DateFormat('M/d').format(date);
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: data?.workorders.data.length,
      itemBuilder: (BuildContext context, int index) {
        final vendorLog = data?.workorders.data[index];
        return _buildListContent(vendorLog, context, ref, size);
      },
    );
  }

  Widget _buildListContent(
    WorkOrder? vendor,
    BuildContext context,
    WidgetRef ref,
    Size size,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 20),

      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.instance.grey300,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildvendorcardHead(ref, context, vendor),
            _buildheaderText(vendor?.category?.name ?? ""),
            _buildreUsableListTile(
              title: "Start",
              trailing: _formatDate(vendor?.startDate ?? ""),
              isCode: false,
            ),
            _buildreUsableListTile(
              title: "End",
              trailing: _formatDate(vendor?.endDate ?? ""),
              isCode: false,
            ),
            _buildreUsableListTile(
              title: "No of Workers",
              trailing: vendor?.numberOfWorkers.toString() ?? "",
              isCode: false,
            ),
            _buildreUsableListTile(
              title: "Code",
              trailing: vendor?.vendorAccessCode ?? "",
              isCode: true,
            ),
            _buildreUsableListTile(
              title: "States",
              trailing: _statuscheck(vendor?.status ?? ""),
              isCode: false,
            ),
            _buildStatusProgress(vendor?.status ?? ""),
          ],
        ),
      ),
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

  Widget _buildheaderText(String workType) {
    return Text(
      "$workType",
      style: TextStyle(
        fontFamily: FontFamilies.interDisplay,
        fontWeight: FontFamilies.bold,
        color: AppColors.instance.black600,
      ),
    );
  }

  Widget _buildreUsableListTile({
    required String title,
    required String trailing,
    required bool isCode,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 13,
            color: AppColors.instance.black300,
          ),
        ),
        Row(
          children: [
            Text(
              trailing,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 13,
                color: AppColors.instance.black600,
              ),
            ),
            isCode
                ? InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: trailing));
                  },
                  child: Image.asset(
                    AssetPaths.clipboard,
                    height: 15,
                    width: 15,
                  ),
                )
                : SizedBox(),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusProgress(String status) {
    switch (status.toLowerCase()) {
      case "cancelled":
        return _buildStatusWidget(status, TaskStatus.complete);
      case "pending":
        return _buildStatusWidget(status, TaskStatus.pending);

      case "in_progress":
        return _buildStatusWidget(status, TaskStatus.inProgress);
      case "completed":
        return _buildStatusWidget(status, TaskStatus.complete);
      case "approved":
        return _buildStatusWidget(status, TaskStatus.start);
      default:
        return _buildStatusWidget(status, TaskStatus.pending);
    }
  }

  Widget _buildStatusWidget(String status, TaskStatus state) {
    // Color getLabelColor(TaskStatus current, TaskStatus target) {
    //   if (current.index >= target.index) {
    //     return AppColors.instance.black600; // highlighted (or use custom color)
    //   }
    //   return AppColors.instance.black300; // dimmed
    // }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProgressLine(
          status: state,
          height: 5,
          progressColor: AppColors.instance.yellow500,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildStatusLabel("Pending", state, TaskStatus.pending),
            _buildStatusLabel("Start", state, TaskStatus.start),
            _buildStatusLabel("In Progress", state, TaskStatus.inProgress),
            _buildStatusLabel("Completed", state, TaskStatus.complete),
          ],
        ),
      ],
    );
  }

  Color _checkColor(String status) {
    switch (status.toLowerCase()) {
      case "pending":
        return AppColors.instance.blue500; // Blue 600 - professional, calm
      case "start":
        return AppColors.instance.yellow500; // Amber 400 - noticeable, warm
      case "in progress":
        return const Color(
          0xFF64748B,
        ); // Blue Grey 500 - neutral, in-progress feel
      case "completed":
        return AppColors.instance.teal500; // Green 600 - success/completed
      default:
        return const Color(0xFF374151); // Grey 700 - default/unknown
    }
  }

  Widget _buildStatusLabel(
    String label,
    TaskStatus currentState,
    TaskStatus targetState,
  ) {
    final bool isActive = currentState.index >= targetState.index;
    final Color textColor =
        isActive ? _checkColor(label) : AppColors.instance.black300;

    return Flexible(
      // ← Key: allows shrinking + clipping
      child: Text(
        label,
        overflow: TextOverflow.ellipsis, // ← Clips long text safely
        maxLines: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontWeight: FontFamilies.bold,
          fontFamily: FontFamilies.interDisplay,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildvendorcardHead(
    WidgetRef ref,
    BuildContext context,
    WorkOrder? vendor,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.instance.teal300,
          child: Center(
            child: Image.asset(AssetPaths.waterDrop, height: 20, width: 20),
          ),
        ),
        if (vendor!.status!.contains("approved")) ...[
          _builduplodButton(ref, context, vendor),
        ] else
          InkWell(
            onTap:
                () => showUserBottomSheet(
                  context: context,
                  headertitle: "Manage Vendor Log",
                  headersubtitle: "Manage  ${vendor.category?.name ?? ""}",
                  ref: ref,
                  bottom: BottomSheetView.vendorLog,
                  id: vendor.id ?? 0,
                  vendor:  vendor,
                ),
            child: Text(
              "Change",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.teal300,
              ),
            ),
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
