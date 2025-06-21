import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/violation/widget/report_card.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/venodrLod_model.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/vendor_fileter.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportViolation extends ConsumerWidget {
  ReportViolation({super.key});

  final List<String> _statusOptions = [
    'All',
    'Pending',
    'Active',
    'In Progress',
    'Completed',
    'Cancelled',
  ];

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
        _buildAddMemberButton(size, context, ref),
        const SizedBox(height: 30),
        Expanded(child: _buildContent(size, context, ref)),
      ],
    );
  }

  Widget _buildAddMemberButton(Size size, BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        showUserBottomSheet(
          context: context,
          headertitle: "Report violation",
          headersubtitle: "Report issues like noise, parking, or misconduct",
          ref: ref,
          bottom: BottomSheetView.reportviolation,
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
            "Report violation +",
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
                "Report violation",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 25,
                  fontWeight: FontFamilies.bold,
                  color: AppColors.instance.black600,
                ),
              ),
              CustomStatusDropdown(
                statusOptions: _statusOptions,
                initialStatus: 'Category',
                onStatusChanged: (newStatus) {
                  log('Selected status: $newStatus');
                  // Handle status change
                },
              ),
            ],
          ),

          const SizedBox(height: 25),

          ReportCard(),
          // Expanded(
          //   child:
          //       report.isNotEmpty
          //           ? ReportCard()
          //           : _buildEmtyBody(),
          // ),
        ],
      ),
    );
  }

  Widget _buildMemberList(WidgetRef ref, Size size) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        final report = vendorList[index];
        return _buildListContent(report, context, ref, size);
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
          children: [],
        ),
      ),
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
