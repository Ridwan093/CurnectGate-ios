import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/customPath.dart';
import 'package:flutter/material.dart';

class Confirmentry extends StatelessWidget {
  
  const Confirmentry({super.key});

  @override
  Widget build(BuildContext context) {
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
          _buildFeatureButton(onTap: () {}),
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
          PentagonContainer(
            width: 80,
            height: 80,
            color: AppColors.instance.teal400,

            child: Center(
              child: Image.asset(AssetPaths.userAvatar2, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 20),
          _buildText(title: "Name", subtitle: "Mr. John Benjamin"),
          SizedBox(height: 20),
          _buildText(title: "Type", subtitle: "Co-Owner"),
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
