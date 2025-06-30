import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/model/generate_model.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/provider/active_provider.dart';
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
    return DateFormat('d, MMM').format(date);
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(dt); // e.g. 2:00 PM
  }

  final String accessCode = "3456GAT";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(ref,context),
      body: _buildBody(size, ref, context),
    );
  }

  PreferredSizeWidget _buildAppBar(WidgetRef ref, BuildContext context) {
   

    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: const Icon(Icons.arrow_back_ios_new),
      actions: [
        IconButton(
          onPressed: () {
            showUserBottomSheet(
              context: context,
              headertitle: "OTP Usage History",
              headersubtitle: "Track who accessed your property and when.",
              ref: ref,
              bottom: BottomSheetView.activeOTPHistory,
            );
          },
          icon: Icon(Icons.history_edu),
        ),
      ],
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
    final generatedList = ref.watch(
      generateNotifierProvider.select((s) => s.generatedList),
    );
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
                generatedList.isNotEmpty
                    ? _buildMemberList(ref, size)
                    : _buildEmtyBody(),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberList(WidgetRef ref, Size size) {
    final generatedList = ref.watch(
      generateNotifierProvider.select((s) => s.generatedList),
    );
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: generatedList.length,
      itemBuilder: (BuildContext context, int index) {
        final generatedLists = generatedList[index];
        return _buildListContent(generatedLists, context, ref, size);
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
              isEndDate: false,
              title: "Type",
              trailing: generated.purposeofVisit,
              isCode: false,
            ),
            _buildreUsableListTile(
              time:
                  generated.selectedTime == null
                      ? ""
                      : formatTimeOfDay(generated.selectedTime!),
              isEndDate: true,
              title: "End",
              trailing:
                  generated.selectedDate == null
                      ? ""
                      : _formatDate(generated.selectedDate!),
              isCode: false,
            ),

            _buildreUsableListTile(
              isEndDate: false,
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
        fontWeight: FontFamilies.bold,
        color: AppColors.instance.black600,
        fontSize: 20,
      ),
    );
  }

  Widget _buildreUsableListTile({
    required String title,
    required String trailing,
    required bool isCode,
    required bool isEndDate,
    String? time,
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
            if (isEndDate) ...[
              Text(
                "$trailing - $time",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 13,
                  color: AppColors.instance.black600,
                ),
              ),
            ] else
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
                    fontWeight: FontFamilies.bold
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
                headertitle: "Manage Active OTPs",
                headersubtitle: "Manage ${generated.purposeofVisit} Service",
                ref: ref,
                bottom: BottomSheetView.revorkActiveOtp,
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
              "Your Active Otp detailes appears here",
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
