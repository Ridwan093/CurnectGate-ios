import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/mock_otp_data.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/history_data.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/workPermit/workPermit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ✅ Check-in OTP Tab
class CheckInOtpTab extends ConsumerStatefulWidget {
  const CheckInOtpTab({super.key});

  @override
  ConsumerState<CheckInOtpTab> createState() => _CheckInOtpTabState();
}

class _CheckInOtpTabState extends ConsumerState<CheckInOtpTab> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return _buildBody(size, ref, context);
  }

  Widget _buildBody(Size size, WidgetRef ref, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Align(
        //   alignment: Alignment.topRight,
        //   child: InkWell(
        //     onTap: () {
        //       context.pop();
        //     },
        //     child: Text(
        //       "Close",
        //       style: TextStyle(
        //         fontFamily: FontFamilies.interDisplay,
        //         fontSize: 14,
        //         color: AppColors.instance.teal400,
        //       ),
        //     ),
        //   ),
        // ),
        // SizedBox(height: 40),
        Text(
          "Check-in OTP",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 18,
            color: AppColors.instance.black600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Grant access for guests and family",
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),

        const SizedBox(height: 23),

        Expanded(child: _buildDynamicList()),
      ],
    );
  }

  Widget _buildDynamicList() {
    return ListView.builder(
      itemCount: mockOtpList.length,
      itemBuilder: (context, index) {
        final otp = mockOtpList[index];
        return WorkpermitCard(otp);
      },
    );
  }
}
