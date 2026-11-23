import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _logoDrop;
  late Animation<double> _textFade;
  late Animation<Offset> _textSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    // LOGO: Drop smoothly from top (-1.2) -> center (0.0) with elastic bounce
    _logoDrop = Tween<double>(
      begin: -1.2,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    // TEXT: Fade in AFTER logo lands
    _textFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.65, 1.0, curve: Curves.easeIn),
    );

    // TEXT: Slide up softly
    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.35),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.65, 1.0, curve: Curves.easeOut),
      ),
    );

    // Wait for the full 4-second animation to complete before navigating
    _controller.forward().then((_) async {
      if (!mounted) return;

      final authData = await SharedPrefsService().getAuthData();
      final isAuthenticated = authData != null && authData.isNotEmpty;

      if (!mounted) return;

      if (isAuthenticated) {
        final role =
            authData['user']?['role']?.toString().toLowerCase() ?? '';
        switch (role) {
          case 'landlord':
          case 'resident':
            context.goNamed(AppRoutes.dashbord);
            break;
          case 'security_personnel':
            context.goNamed(AppRoutes.securityguide);
            break;
          default:
            context.goNamed(AppRoutes.dashbord);
            break;
        }
      } else {
        final hasSeenGetStarted =
            await SharedPrefsService().getHasSeenGetStarted();
        if (!mounted) return;
        if (hasSeenGetStarted) {
          context.goNamed(AppRoutes.signIN);
        } else {
          context.goNamed(AppRoutes.estatateOnbording);
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Align(
            alignment: Alignment(0, _logoDrop.value), // Bounce drop
            child: child,
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // LOGO
            Image.asset(AssetPaths.appLogos, width: 100, height: 100),

            const SizedBox(height: 25),

            // TITLE - fade + slide up
            FadeTransition(
              opacity: _textFade,
              child: SlideTransition(
                position: _textSlide,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Curnect",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              fontFamily: FontFamilies.interDisplay,
                              letterSpacing: -0.5,
                              color: AppColors.instance.black600,
                            ),
                          ),
                          TextSpan(
                            text: "Gate",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              fontFamily: FontFamilies.interDisplay,
                              letterSpacing: -0.5,
                              color: AppColors.instance.yellow500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Estate Management Simplified",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamilies.interDisplay,
                        letterSpacing: 0.8,
                        color: AppColors.instance.black400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
