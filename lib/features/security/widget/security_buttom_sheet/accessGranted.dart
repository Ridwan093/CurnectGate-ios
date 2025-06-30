import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class Accessgranted extends StatelessWidget {
  const Accessgranted({super.key});

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

          SizedBox(height: 30),
          _buildUserInfoBox(size: size),
          SizedBox(height: 30),
          _buildFeatureButton(
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoBox({required Size size}) {
    return Column(
      children: [
        Icon(Icons.check_circle, size: 60, color: AppColors.instance.teal500),

        SizedBox(height: 30),
        _buildText(
          title: "Access granted",
          subtitle: "You granted access to ",
          userName: "Speed Derlington",
        ),
      ],
    );
  }

  Widget _buildText({
    required String title,
    required String subtitle,
    required String userName,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 18,
            color: AppColors.instance.black600,
          ),
        ),
        SizedBox(height: 5),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 12,
                  color: AppColors.instance.black300,
                ),

                text: subtitle,
              ),
              TextSpan(
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 12,
                  color: AppColors.instance.black600,
                ),

                text: userName,
              ),
            ],
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
            "Got it!",
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
