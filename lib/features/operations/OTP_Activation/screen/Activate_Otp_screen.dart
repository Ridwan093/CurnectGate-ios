import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/vendor_fileter.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/getActiveOtpByfilter_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/ActiveData_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Otpactivation extends ConsumerWidget {
  Otpactivation({super.key});
  final List<String> _statusOptions = [
    'All',
    'Expired',
    'Active',
    'Scheduled',
    'Used',
    'revoked',
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(ref, context),
      body: _buildBody(size, ref, context),
    );
  }

  PreferredSizeWidget _buildAppBar(WidgetRef ref, BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: InkWell(
        onTap: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }

  Widget _buildBody(Size size, WidgetRef ref, BuildContext context) {
    final filterPovider = ref.read(generateNotifierProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildAddMemberButton(
                  size,
                  context,
                  ref,
                  textColor: AppColors.instance.grey200,
                  buttonText: "Add new OTP +",
                  onTap: () {
                    showUserBottomSheet(
                      context: context,
                      headertitle: "Select option",
                      headersubtitle: "Manage OTPs for Visitor Access",
                      ref: ref,
                      bottom: BottomSheetView.manageOTPforvisitor,
                    );
                  },
                  buttonColor: AppColors.instance.black600,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: _buildAddMemberButton(
                  size,
                  context,
                  ref,
                  buttonText: "My Permits",
                  onTap: () {
                    showUserBottomSheet(
                      context: context,
                      headertitle: "Select option",
                      headersubtitle: "Manage OTPs for Visitor Access",
                      ref: ref,
                      bottom: BottomSheetView.activeOTPHistory,
                    );
                  },
                  buttonColor: AppColors.instance.teal300,
                  textColor: AppColors.instance.black600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              // Title — takes available space safely
              Expanded(
                child: Text(
                  "Active OTPs",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.instance.black600,
                  ),
                ),
              ),

              const SizedBox(width: 16),

              CustomStatusDropdown(
                statusOptions: _statusOptions,
                initialStatus: 'All',
                onStatusChanged: (newStatus) {
                  log('Selected status: $newStatus');
                  filterPovider.setFilter(
                    newStatus == "All" ? "" : newStatus.toLowerCase(),
                  );
                  ref
                      .read(getActiveOtpProvider.notifier)
                      .refreshActive(context, ref);
                },
              ),
            ],
          ),
          const SizedBox(height: 23),
          Expanded(child: const ActivedataWidget()),
        ],
      ),
    );
  }

  Widget _buildAddMemberButton(
    Size size,
    BuildContext context,
    WidgetRef ref, {
    required String buttonText,
    required Color buttonColor,
    required VoidCallback onTap,
    required Color textColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        // width: size.width,
        decoration: BoxDecoration(
          color: buttonColor,
          border:
              buttonText.contains("My")
                  ? Border.all(
                    color: AppColors.instance.black500,
                    style: BorderStyle.solid,
                  )
                  : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: textColor,
              fontSize: 13,
              fontWeight: FontFamilies.bold,
            ),
          ),
        ),
      ),
    );
  }
}
