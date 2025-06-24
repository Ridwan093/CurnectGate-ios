import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/model/generate_model.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/vendor_fileter.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class Otpactivation extends ConsumerWidget {
  Otpactivation({super.key});

  final List<String> _statusOptions = ['All', 'Expired', 'Active', 'Scheduled'];

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
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.history_edu))],
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
          headertitle: "Select option",
          headersubtitle: "Manage OTPs for Visitor Access",
          ref: ref,
          bottom: BottomSheetView.manageOTPforvisitor,
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
            "Add new OTP +",
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
                "Active OTPs",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 25,
                  fontWeight: FontFamilies.bold,
                  color: AppColors.instance.black600,
                ),
              ),
              CustomStatusDropdown(
                statusOptions: _statusOptions,
                initialStatus: 'All',
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
                generated.isNotEmpty
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
      itemCount: generated.length,
      itemBuilder: (BuildContext context, int index) {
        final generatedList = generated[index];
        return _buildListContent(generatedList, context, ref, size);
      },
    );
  }

  Widget _buildListContent(
    GenerateState generated,
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
            _buildvendorcardHead(ref, context, generated),

            _buildreUsableListTile(
              title: "Type",
              trailing: generated.purposeofVisit,
              isCode: false,
            ),
            _buildreUsableListTile(
              title: "End",
              trailing: _formatDate(generated.selectedDate!),
              isCode: false,
            ),

            _buildreUsableListTile(
              title: "Code",
              trailing: accessCode,
              isCode: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildheaderText(String userName) {
    return Text(
      userName,
      style: TextStyle(
        fontFamily: FontFamilies.interDisplay,
        fontWeight: FontFamilies.medium,
        color: AppColors.instance.black600,
        fontSize: 20,
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
          spacing: isCode ? 7 : 0,
          children: [
            if (isCode)
              Text(
                "Expired in 30 days",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.error500,
                  fontSize: 10,
                ),
              ),
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

  Widget _buildvendorcardHead(
    WidgetRef ref,
    BuildContext context,
    GenerateState generated,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 5,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.instance.teal300,
              child: Center(
                child: Text(
                  getInitialsFromFullName(generated.vistorName),
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                  ),
                ),
              ),
            ),
            _buildheaderText(generated.vistorName),
          ],
        ),
        InkWell(
          onTap:
              () => showUserBottomSheet(
                context: context,
                headertitle: "Manage Vendor Log",
                headersubtitle: "Manag ${generated.purposeofVisit} Service",
                ref: ref,
                bottom: BottomSheetView.vendorLog,
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

  String getInitialsFromFullName(String fullName) {
    if (fullName.trim().isEmpty) return '';

    final parts = fullName.trim().split(RegExp(r'\s+')); // Split by spaces

    final first = parts.first[0].toUpperCase();
    final last = parts.length > 1 ? parts.last[0].toUpperCase() : '';

    return '$first$last';
  }

  Widget _buildEmtyBody() {
    return Center(
      child: SingleChildScrollView(
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
      ),
    );
  }
}
