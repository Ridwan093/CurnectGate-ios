// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/navigation/back_manageent/back_widget/back_navigator.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/auth/data/provider/slder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

///flutter_screenutil: ^5.9.0
class AuthOnboardingScreen extends ConsumerStatefulWidget {
  const AuthOnboardingScreen({super.key});

  @override
  ConsumerState<AuthOnboardingScreen> createState() =>
      _AuthOnboardingScreenState();
}

class _AuthOnboardingScreenState extends ConsumerState<AuthOnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  Timer? _autoTimer;


  @override
  void dispose() {
    _autoTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sliderState = ref.watch(getSliderprovider);


    return BackButtonHandler(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: sliderState.when(
          loading: () => const Loadingstates(),
          error: (e, _) => _buildMainUI([]),
          data: (response) {
            final sliders = response?.data?.sliders ?? [];

            if (sliders.isEmpty) {
              return _buildMainUI([]);
            }

            return _buildMainUI(sliders);
          },
        ),
      ),
    );
  }

  Widget _buildMainUI(List<dynamic> sliders) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool isSmallScreen = screenHeight < 700;

    return Stack(
      children: [
        /// ⭐ SLIDER or Placeholder
        if (sliders.isNotEmpty)
          PageView.builder(
            controller: _pageController,
            itemCount: sliders.length,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final item = sliders[index];

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: CachedNetworkImage(
                  key: ValueKey(item.imageUrl),
                  imageUrl: item.imageUrl ?? "",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: (_, __) => Container(color: Colors.black),
                  errorWidget: (_, __, ___) => Container(color: Colors.black),
                ),
              );
            },
          )
        else
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
            child: Image.asset(
              AssetPaths
                  .appLogo, // You might want a background image here instead
              fit: BoxFit.contain,
              color: Colors.white.withOpacity(0.05),
            ),
          ),

        /// ⭐ Gradient
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: screenHeight * 0.45,
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

        /// ⭐ CONTENT
        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: isSmallScreen ? 20 : 40,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.09),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Image.asset(
                      //   AssetPaths.appLogo,
                      //   width: isSmallScreen ? 160 : 200,
                      // ),

                      const SizedBox(height: 15),

                      /// ⭐ dynamic title or fallback
                      Text(
                        sliders.isNotEmpty && _currentPage < sliders.length
                            ? (sliders[_currentPage].description ??
                                "Estate management made simple")
                            : "Estate management made simple",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isSmallScreen ? 15 : 15,
                          fontWeight: FontFamilies.medium,
                          fontFamily: FontFamilies.interDisplay,
                        ),
                      ),

                      const SizedBox(height: 40),

                      /// ⭐ indicator (only if multiple sliders)
                      if (sliders.length > 1)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            sliders.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              width: _currentPage == index ? 18 : 10,
                              height: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    _currentPage == index
                                        ? AppColors.instance.yellow500
                                        : Colors.white.withOpacity(0.6),
                              ),
                            ),
                          ),
                        )
                      else
                        const SizedBox(height: 10),

                      const SizedBox(height: 30),

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
          ),
        ),
      ],
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
        height: 52,
        decoration: BoxDecoration(
          color: iscreate ? AppColors.instance.grey200 : Colors.transparent,
          border: iscreate ? null : Border.all(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            buttontitle,
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
