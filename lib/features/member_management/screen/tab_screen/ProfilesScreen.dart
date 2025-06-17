import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Profile Screen!",
          style: TextStyle(
            fontFamily: FontFamilies.lato,
            fontSize: 25,
            color: AppColors.instance.error600,
          ),
        ),
      ),
    );
  }
}
