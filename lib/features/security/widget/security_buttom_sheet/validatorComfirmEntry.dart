import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValidateConfirmEntry extends ConsumerWidget {
  const ValidateConfirmEntry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close, color: AppColors.instance.black600),
            ),
          ),
          SizedBox(height: 25),
          Text(
            "Confirm Entry",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontSize: 14,
              fontWeight: FontFamilies.bold,
            ),
          ),
          SizedBox(height: 30),
          _buildUserInfoBox(size: size),
          SizedBox(height: 30),
          _buildFeatureButton(
            onTap: () {
                 Navigator.pop(context);
              showUserBottomSheet(
                context: context,
                headertitle: "",
                headersubtitle: '',

                ref: ref,
                bottom: BottomSheetView.accesGranted,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoBox({required Size size}) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      width: size.width,

      decoration: BoxDecoration(
        color: AppColors.instance.grey300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          _buildText(title: "Name", subtitle: "Speed Darlington"),
          SizedBox(height: 20),
          _buildText(title: "Workers", subtitle: "5"),
          SizedBox(height: 20),
          _buildText(title: "Type", subtitle: "Work Order"),
          SizedBox(height: 20),
          _buildText(
            title: "House Address",
            subtitle: "Greeville Estate Block C",
          ),
        ],
      ),
    );
  }

  Widget _buildText({required String title, required String subtitle}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 12,
            color: AppColors.instance.black300,
          ),
        ),
        SizedBox(height: 5),
        Text(
          subtitle,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,

            color: AppColors.instance.black600,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureButton({required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.instance.black600,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Grant Access",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.grey200,
            ),
          ),
        ),
      ),
    );
  }
}
