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

  void _startAutoSlide(int length) {
    _autoTimer?.cancel();

    _autoTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!_pageController.hasClients) return;

      int next = _currentPage + 1;
      if (next >= length) next = 0;

      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _autoTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sliderState = ref.watch(getSliderprovider);

    final double screenHeight = MediaQuery.of(context).size.height;
    final bool isSmallScreen = screenHeight < 700;

    return BackButtonHandler(
      child: Scaffold(
        body: sliderState.when(
          loading: () => const Loadingstates(),
          error: (e, _) => const SizedBox(),
          data: (response) {
            final sliders = response?.data?.sliders ?? [];

            if (sliders.isEmpty) {
              return const SizedBox();
            }

            _startAutoSlide(sliders.length);

            return Stack(
              children: [
                /// ⭐ SLIDER
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
                        imageUrl:
                            item.imageUrl ??
                            "https://res.cloudinary.com/drguh0jed/image/upload/v1773403380/app_welcome_sliders/app_welcome_sliders/slider_1_1773403380.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: (_, __) => Container(color: Colors.black),
                        errorWidget:
                            (_, __, ___) => Container(color: Colors.black),
                      ),
                    );
                  },
                ),

                /// ⭐ Gradient (UNCHANGED)
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

                /// ⭐ CONTENT (UNCHANGED STRUCTURE)
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
                          Image.asset(
                            AssetPaths.appLogo,
                            width: isSmallScreen ? 160 : 200,
                          ),

                          const SizedBox(height: 15),

                          /// ⭐ dynamic title from API
                          Text(
                            sliders[_currentPage].description ??
                                "Estate management made simple",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmallScreen ? 15 : 15,
                              fontWeight: FontFamilies.medium,
                              fontFamily: FontFamilies.interDisplay,
                            ),
                          ),

                          const SizedBox(height: 40),

                          /// ⭐ indicator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              sliders.length,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
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
                          ),

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
              ],
            );
          },
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
