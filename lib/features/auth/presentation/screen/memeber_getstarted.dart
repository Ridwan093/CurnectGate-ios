// ignore_for_file: deprecated_member_use

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/navigation/back_manageent/back_widget/back_navigator.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthOnboardingScreen extends StatefulWidget {
  const AuthOnboardingScreen({super.key});

  @override
  State<AuthOnboardingScreen> createState() => _AuthOnboardingScreenState();
}

class _AuthOnboardingScreenState extends State<AuthOnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  AssetPaths assetimage = AssetPaths();

  final List<Map<String, String>> onboardingData = [
    {'image': AssetPaths.slide1},
    {'image': AssetPaths.slide2},
    {'image': AssetPaths.slide3},
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackButtonHandler(
      child: Scaffold(
        body: Stack(
          children: [
            // Full Screen PageView with Images
            PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(onboardingData[index]['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),

            // Black Gradient Overlay at Bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Logo and Description
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5 + 50,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // Logo
                  Image.asset(
                    AssetPaths.appLogo,
                    width: 200,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(height: 15),
                  Text(
                    "Estate manangement made simple",
                    style: TextStyle(
                      color: AppColors.instance.black100,
                      fontSize: 15,
                      fontWeight: FontFamilies.medium,
                    ),
                  ),

                  // Description
                ],
              ),
            ),

            // Page Indicator (3 dots)
            Positioned(
              bottom: 200,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentPage == index
                              ? AppColors.instance.yellow500
                              : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),

            // Bottom Buttons
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  // Create Account Button

                  // Sign In Button
                  _containerButton(
                    onPressed: () {
                      context.pushNamed(AppRoutes.estateCodeVerificationScreen);
                    },
                    buttontitle: 'Create a new account',
                    iscreate: false,
                  ),
                  const SizedBox(height: 15),
                  _containerButton(
                    onPressed: () {
                      context.pushNamed(AppRoutes.signIN);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => SignIn()),
                      // );
                    },
                    buttontitle: "Sign in to continue",
                    iscreate: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _containerButton({
    required VoidCallback onPressed,
    required String buttontitle,
    required bool iscreate,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border:
              iscreate
                  ? null
                  : Border.fromBorderSide(
                    const BorderSide(color: Colors.white),
                  ),
          color: iscreate ? AppColors.instance.grey200 : null,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            buttontitle,
            style: TextStyle(
              fontSize: 14,
              fontFamily: FontFamilies.interDisplay,
              color:
                  iscreate
                      ? AppColors.instance.black600
                      : AppColors.instance.grey200,
              fontWeight: FontFamilies.medium,
            ),
          ),
        ),
      ),
    );
  }
}
