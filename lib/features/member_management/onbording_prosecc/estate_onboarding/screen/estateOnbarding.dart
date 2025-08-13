// ignore_for_file: deprecated_member_use

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/onboard_button.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/onboadWidget/logo.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/onboadWidget/startcontent.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EstateOnboardingScreen extends StatelessWidget {
  EstateOnboardingScreen({super.key});
  final color = AppColors.instance;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetPaths.onboardingBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Gradient Overlay (Positioned at bottom)
          Positioned(
            bottom: 0,
            child: Container(
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    // ignore: duplicate_ignore
                    // ignore: deprecated_member_use
                    color.black600.withOpacity(0.95),
                    color.black600.withOpacity(0.73),
                    color.black600.withOpacity(0.2),
                    color.black600.withOpacity(0.1),
                    Colors.transparent,
                  ],
                  stops: [0.0, 0.3, 0.6, 0.8, 1.0],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const appLogo(),
                  const SizedBox(height: 80),
                  BiuldStartText(
                    text: "Get Started",
                    subtext: "Confirm your estate information to continue",
                  ),
                  const SizedBox(height: 30),
                  OnBoardButton(
                    bodycolor: color.black100,
                    textcolor: color.black600,
                    label: "Get Started",
                    onPressed: () {
                      // domming navigator
                      context.goNamed(AppRoutes.addHoused_CoOnwner);
                     
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
