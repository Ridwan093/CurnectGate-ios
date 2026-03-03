import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SelectpermitBottomsheet extends ConsumerWidget {
  final int id;
  final String otp;
  final String username;
  final String phoneNumber;
  const SelectpermitBottomsheet({
    super.key,
    required this.otp,
    required this.id,
    required this.username,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        key: const ValueKey('userDetails'),
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header section
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
              Text(
                "Grant Access Permit",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 20,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Authorize guests or family to bring in listed items.",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  color: AppColors.instance.black300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          _buildButton(
            title: "Create Clearance Permit",
            onTap: () {
              context.pop();
              showUserBottomSheet(
                context: context,
                headertitle: otp,
                headersubtitle: username,
                location: phoneNumber,
                ref: ref,
                bottom: BottomSheetView.permitAccces,
                id: id,
              );
            },
            icon: AssetPaths.generateOtpwithperiod,
          ),

          const SizedBox(height: 5),
          // _buildButton(
          //   title: "Create Scheduled Permit",
          //   onTap: () {
          //     showUserBottomSheet(
          //       context: context,
          //       headertitle: otp,
          //       headersubtitle: "Revoked  OTP",
          //       ref: ref,
          //       bottom: BottomSheetView.shedulPermit,
          //       id: id,
          //     );
          //   },
          //   icon: AssetPaths.scheduleOtp,
          // ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String title,
    required VoidCallback onTap,
    required String icon,
  }) {
    return Container(
      height: 100,
      color: AppColors.instance.grey300,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: onTap,
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.instance.grey400,
          ),
          child: Center(child: Image.asset(icon, width: 25, height: 25)),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
