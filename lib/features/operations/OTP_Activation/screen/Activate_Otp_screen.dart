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
    final filterPovider = ref.read(generateNotifierProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _buildAddMemberButton(size, context, ref),
          const SizedBox(height: 30),
          Row(
            children: [
              // Title — takes available space safely
              Expanded(
                child: Text(
                  "Active OTPs",
                  overflow:
                      TextOverflow
                          .ellipsis, // ← Safety for very long titles (rare but pro)
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.instance.black600,
                  ),
                ),
              ),

              const SizedBox(width: 16), // Consistent gap
              // Dropdown — fixed compact size
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
          Expanded(child: ActivedataWidget()),
        ],
      ),
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
}
