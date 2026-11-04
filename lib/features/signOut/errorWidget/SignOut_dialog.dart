import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<bool?> showSignOutDialog(BuildContext context) async {
  return showGeneralDialog<bool>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Sign Out',
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
        child: FadeTransition(opacity: animation, child: child),
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.all(24),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Detect if screen is small (available dialog height is limited)
            final bool isSmallScreen = constraints.maxHeight < 500;
            final double screenWidth = MediaQuery.of(context).size.width;
            final bool isTablet = screenWidth >= 600;
            return Container(
              width: isTablet ? 500 : screenWidth * 0.9,
              constraints: const BoxConstraints(maxWidth: 500, minWidth: 300),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Colors.white.withOpacity(0.9)],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: isSmallScreen ? 16 : 24, // Less vertical on small
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon — smaller on small screens
                    Icon(
                      Icons.logout_rounded,
                      size: isSmallScreen ? 48 : 64,
                      color: AppColors.instance.black500,
                    ),
                    SizedBox(height: isSmallScreen ? 12 : 20),

                    // Title — adaptive font
                    Text(
                      'Sign Out?',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 24 : 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black500,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 8 : 12),

                    // Subtitle
                    Text(
                      'Are you sure you want to sign out?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 16,
                        color: AppColors.instance.black300,
                        fontFamily: FontFamilies.interDisplay,
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 20 : 32),

                    // Buttons — tighter on small screens
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.instance.black400,
                              side: BorderSide(
                                color: AppColors.instance.black400,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: isSmallScreen ? 24 : 32,
                                vertical: isSmallScreen ? 10 : 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              HapticFeedback.lightImpact();
                              Navigator.of(context).pop(false);
                            },
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.instance.teal300,
                              foregroundColor: AppColors.instance.teal400,
                              elevation: 4,
                              padding: EdgeInsets.symmetric(
                                horizontal: isSmallScreen ? 24 : 32,
                                vertical: isSmallScreen ? 10 : 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              HapticFeedback.mediumImpact();
                              Navigator.of(context).pop(true);
                            },
                            child: const Text('Sign Out'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
