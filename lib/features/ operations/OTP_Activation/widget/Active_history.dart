import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/provider/history_provider.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/widget/history_data.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/vendor_fileter.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ActiveHistory extends ConsumerWidget {
  ActiveHistory({super.key});

  final List<String> _statusOptions = ['Expired', "Used", 'Revoked'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50,
        child: _buildAddMemberButton(size, context, ref),
      ),
      backgroundColor: Colors.white,

      body: _buildBody(size, ref, context),
    );
  }

  Widget _buildBody(Size size, WidgetRef ref, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              context.pop();
            },
            child: Text(
              "Close",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 14,
                color: AppColors.instance.teal400,
              ),
            ),
          ),
        ),
        SizedBox(height: 40),
        Text(
          "OTP Usage History",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 18,
            color: AppColors.instance.black600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Track who accessed your property and when.",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 13,
            color: AppColors.instance.black300,
          ),
        ),

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
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColors.instance.black600,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Generate OTP",
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
    final filterPovider = ref.read(generateNotifierProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            CustomStatusDropdown(
              statusOptions: _statusOptions,
              initialStatus: 'All',
              onStatusChanged: (newStatus) {
                log('Selected status: $newStatus');
                filterPovider.setHistoryFilter(
                  newStatus.isNotEmpty ? newStatus.toLowerCase() : "expire",
                );
                ref
                    .read(getActiveOtpHistoryProvider.notifier)
                    .refreshActive(context, ref);
                // Handle status change
              },
            ),
          ],
        ),

        const SizedBox(height: 23),

        Expanded(child: ActiveHistoryDataWidget()),
      ],
    );
  }
}
