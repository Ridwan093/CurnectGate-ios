import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/enum/status_num.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/venodrLod_model.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_screen/work_requst_screen.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/status_progress_widget.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/vendor_fileter.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class VendorLog extends ConsumerWidget {
   VendorLog({super.key});



  final List<String> _statusOptions = [
    'All',
    'Pending',
    'Active',
    'In Progress',
    'Completed',
    'Cancelled',
  ];

  String _formatDate(DateTime date) {
    return DateFormat('M/d').format(date);
  }

  final String accessCode = "3456GAT";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(size, ref, context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: const Icon(Icons.arrow_back_ios_new),
    );
  }

  Widget _buildBody(Size size, WidgetRef ref, BuildContext context) {
    return Column(
      children: [
        _buildAddMemberButton(size, context),
        const SizedBox(height: 30),
        Expanded(child: _buildContent(size, context, ref)),
      ],
    );
  }

  Widget _buildAddMemberButton(Size size, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SubmitWorkOrderPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColors.instance.black600,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Submite Work Order +",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.grey200,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(Size size, BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Vendor Log",
                style: TextStyle(

                  
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 20,
                  fontWeight: FontFamilies.bold,
                  color: AppColors.instance.black600,
                ),
              ),
              CustomStatusDropdown(

                statusOptions: _statusOptions,
                initialStatus: 'Pending',
                onStatusChanged: (newStatus) {
                  log('Selected status: $newStatus');
                  // Handle status change
                },
              ),
            ],
          ),

          const SizedBox(height: 23),

          Expanded(
            child:
                vendorList.isNotEmpty
                    ? _buildMemberList(ref, size)
                    : _buildEmtyBody(),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberList(WidgetRef ref, Size size) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: vendorList.length,
      itemBuilder: (BuildContext context, int index) {
        final vendorLog = vendorList[index];
        return _buildListContent(vendorLog, context, ref, size);
      },
    );
  }

  Widget _buildListContent(
    VendorLogModel vendor,
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
            _buildheaderText(vendor.worktype),
            _buildreUsableListTile(
              title: "Start",
              trailing: _formatDate(vendor.startDay),
              isCode: false,
            ),
            _buildreUsableListTile(
              title: "End",
              trailing: _formatDate(vendor.endDay),
              isCode: false,
            ),
            _buildreUsableListTile(
              title: "No, of Workers",
              trailing: vendor.workNumbers,
              isCode: false,
            ),
            _buildreUsableListTile(
              title: "Code",
              trailing: accessCode,
              isCode: true,
            ),
            _buildreUsableListTile(
              title: "States",
              trailing: vendor.taskStatus,
              isCode: false,
            ),
            _buildStatusProgress(vendor.taskStatus),
          ],
        ),
      ),
    );
  }

  Widget _buildheaderText(String workType) {
    return Text(
      "$workType service",
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
    switch (status) {
      case "Scheduled":
        return SizedBox();
      case "Acive":
        return _buildStatusWidget(status, TaskStatus.start);

      case "In Progress":
        return _buildStatusWidget(status, TaskStatus.inProgress);
      case "Completed":
        return _buildStatusWidget(status, TaskStatus.complete);
      default:
        return _buildStatusWidget(status, TaskStatus.start);
    }
  }

  Widget _buildStatusWidget(String status, TaskStatus state) {
    Color getLabelColor(TaskStatus current, TaskStatus target) {
      if (current.index >= target.index) {
        return AppColors.instance.black600; // highlighted (or use custom color)
      }
      return AppColors.instance.black300; // dimmed
    }

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
            Text(
              "Start",
              style: TextStyle(
                color: getLabelColor(state, TaskStatus.start),
                fontWeight: FontFamilies.bold,
                fontFamily: FontFamilies.interDisplay,
                fontSize: 14,
              ),
            ),
            Text(
              "In Progress",
              style: TextStyle(
                color: getLabelColor(state, TaskStatus.inProgress),
                fontWeight: FontFamilies.bold,
                fontFamily: FontFamilies.interDisplay,
                fontSize: 14,
              ),
            ),
            Text(
              "Completed",
              style: TextStyle(
                color: getLabelColor(state, TaskStatus.complete),
                fontWeight: FontFamilies.bold,
                fontFamily: FontFamilies.interDisplay,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildvendorcardHead(
    WidgetRef ref,
    BuildContext context,
    VendorLogModel vendor,
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
        InkWell(
          onTap:
              () => showUserBottomSheet(
                context: context,
                headertitle: "Manage Vendor Log",
                headersubtitle: "Manag ${vendor.worktype} Service",
                ref: ref,
                bottom: BottomSheetView.vendorLog,
                vendor: vendor,
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

  Widget _buildEmtyBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetPaths.dashboardWorkOrder, height: 100, width: 100),
          SizedBox(height: 10),
          Text(
            "Your work detailes appears here",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black300,
              fontSize: 12,
              fontWeight: FontFamilies.medium,
            ),
          ),
        ],
      ),
    );
  }
}
