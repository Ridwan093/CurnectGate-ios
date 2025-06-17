import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/screen/setuprofilledInfo.dart';
import 'package:flutter/material.dart';

Widget buildSuccessContent(String address, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    padding: EdgeInsets.all(24),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Icon(Icons.check_circle, color: AppColors.instance.teal400),
        SizedBox(height: 20),

        // Title and subtitle
        Text(
          'Member ID confirmed',
          style: TextStyle(
            fontSize: 20,
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black500,
          ),
        ),
        SizedBox(height: 8),

        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.medium,
                  color: AppColors.instance.black400,
                ),
                text: "This ID is addociated with",
              ),
              TextSpan(
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  color: AppColors.instance.black600,
                ),
                text: "  Adamu Benjamin ",
              ),
              TextSpan(
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.medium,
                  color: AppColors.instance.black400,
                ),
                text: "of Greenwood Estate",
              ),
            ],
          ),
        ),

        SizedBox(height: 20),
        _buildAddressCard(
          address: address,
          housename: "Greenwood Estate",
          locationmark: AssetPaths.memberIdConfirmed,
          context: context,
        ),

        // Validation button with loading indicator
        SizedBox(height: 50),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.instance.black600,
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SetUppRofiled()),
              );
            },
            child: Center(
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black100,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
      ],
    ),
  );
}

Widget _buildAddressCard({
  required String address,
  required String housename,
  required String locationmark,
  required BuildContext context,
}) {
  return Container(
    padding: EdgeInsets.all(10),
    height: 100,
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          // ignore: deprecated_member_use
          color: AppColors.instance.grey300,
          spreadRadius: 1,
          blurRadius: 9,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      borderRadius: BorderRadius.circular(25),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(locationmark, width: 50),
        const SizedBox(width: 13.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              address,
              style: TextStyle(
                fontSize: 13,
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black500,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              housename,
              style: TextStyle(
                fontSize: 13,
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.medium,
                color: AppColors.instance.black400,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
