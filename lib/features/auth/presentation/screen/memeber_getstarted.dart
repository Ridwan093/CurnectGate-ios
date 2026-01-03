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
    final double screenHeight = MediaQuery.of(context).size.height;

    final bool isSmallScreen = screenHeight < 700; // iPhone SE, small Androids

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
                return Image.asset(
                  onboardingData[index]['image']!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                );
              },
            ),

            // Black Gradient Overlay at Bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight * 0.45, // Adaptive height
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Main Content (Logo, Text, Buttons) - Now in SafeArea Column
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: isSmallScreen ? 20 : 40,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo
                      Image.asset(
                        AssetPaths.appLogo,
                        width: isSmallScreen ? 160 : 200,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 15),

                      // Title
                      Text(
                        "Estate management made simple",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isSmallScreen ? 15 : 15,
                          fontWeight: FontFamilies.medium,
                          fontFamily: FontFamilies.interDisplay,
                        ),
                      ),

                      const SizedBox(height: 40), // Space before buttons
                      // Page Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingData.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  _currentPage == index
                                      ? AppColors.instance.yellow500
                                      : Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Buttons
                      SizedBox(
                        width: double.infinity,
                        child: _containerButton(
                          onPressed: () {
                            context.pushNamed(
                              AppRoutes.estateCodeVerificationScreen,
                            );
                          },
                          buttontitle: 'Create a new account',
                          iscreate: false,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: _containerButton(
                          onPressed: () {
                            context.pushNamed(AppRoutes.signIN);
                          },
                          buttontitle: "Sign in to continue",
                          iscreate: true,
                        ),
                      ),
                    ],
                  ),
                ),
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
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: iscreate ? AppColors.instance.grey200 : Colors.transparent,
          border: iscreate ? null : Border.all(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            buttontitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontWeight.w600,
              color: iscreate ? AppColors.instance.black600 : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
