import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/features/auth/presentation/screen/creatnewpassword.dart';
import 'package:curnectgate/features/auth/presentation/screen/forgot_password.dart';
import 'package:curnectgate/features/auth/presentation/screen/memeber_getstarted.dart';
import 'package:curnectgate/features/auth/presentation/screen/rest_pass_otp_screen.dart';
import 'package:curnectgate/features/auth/presentation/screen/sign_in.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/screen/estateconfirmation_screen.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/screen/onboard_code_confirm.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/screen/Dashborad.dart';
import 'package:curnectgate/features/member_management/screen/add_member.dart';
import 'package:curnectgate/features/member_management/screen/main_navigation_screen.dart';
import 'package:curnectgate/features/member_management/screen/memberIdchecker.dart';
import 'package:curnectgate/features/member_management/screen/otp_screen.dart';
import 'package:curnectgate/features/member_management/screen/password_screen.dart';
import 'package:curnectgate/features/member_management/screen/setuprofilledInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: "/",
    routes: [
      // Define routes with BOTH path and name
      GoRoute(
        name: '/', // Unique name for navigation
        path: AppRoutes.estatateOnbording,
        builder: (context, state) => AuthOnboardingScreen(),
      ),
      GoRoute(
        name: AppRoutes.estateCodeVerificationScreen,
        path: '/code-verify',
        builder: (context, state) => const EstateCodeVerificationScreen(),
      ),
      GoRoute(
        name: AppRoutes.confirmInfomation,
        path: "/Onbord_info",
        builder: (context, state) {
          // Access the extra data passed during navigation
          final estateData = state.extra as Map<String, dynamic>?;
          return ConfirmInfomation(
            estateData: estateData,

            // If you still need the code separately
          );
        },
      ),
      GoRoute(
        path: '/member_IdCheck',
        name: AppRoutes.memberIdCheck,
        builder: (context, state) {
          final estateData = state.extra as Map<String, dynamic>?;
          return MemberIdchecker(estateData: estateData);
        },
      ),

      GoRoute(
        path: '/setup_info',
        name: AppRoutes.filleMemberInfo,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return SetUppRofiled(
            estateCode: args['estatecode'],
            memberCode: args['memberCode'],
            role: args['role'],
            digitalID: args["digitalID"],

            userEmail: args["userEmail"],
            userPhone: args["userPhone"],
            firstName: args["firstName"],
            lastName: args["lastName"],
          );
        },
      ),
      GoRoute(
        path: '/member_pass',
        name: AppRoutes.memberPassCreated,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>? ?? {};

          return PasswordScreen(
            estateCode: args['estateCode'] as String? ?? '', // Match exact case
            memberCode: args['memberCode'] as String? ?? '',
            role: args['role'] as String? ?? '',
            digitalID: args['digitalID'] as String? ?? '',
            userEmail: args['userEmail'] as String? ?? '',
            userPhone: args['userPhone'] as String? ?? '',
            firstName: args['firstName'] as String? ?? '',
            lastName: args['lastName'] as String? ?? '', // Fixed key
            terms: args['terms'] as bool? ?? false,
            gender: args['gender'] as String? ?? '',
          );
        },
      ),

      GoRoute(
        path: '/Otp',
        name: AppRoutes.oTPCode,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>? ?? {};

          return OtpScreen(
            args, // Match exact case
          );
        },
      ),

      GoRoute(
        path: '/pass_reset',
        name: AppRoutes.passForgot,
        builder: (context, state) {
          // final data = state.extra as Map<String, dynamic>? ?? {};

          return PasswordReset();
        },
      ),
      GoRoute(
        path: '/forget_pass_otp',
        name: AppRoutes.passRestOtpVerify,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>? ?? {};
          final email = data['email'] as String;

          return ForgetPassOtpScreen(email);
        },
      ),
   GoRoute(
  path: '/auth_pass_reset',
  name: AppRoutes.passReset,
  builder: (context, state) {
    // Safely cast the extra data
    final extra = state.extra as Map<String, dynamic>? ?? {};

    // Extract values with null checks
    final token = extra['token'] as String? ?? '';
    final email = extra['local_email'] as String? ?? '';
    final originalData = extra; // All spread data is here

    return NewPassword(
      token: token,
      localEmail: email,

    );
  },
),
      GoRoute(
        path: '/addHous_co',
        name: AppRoutes.addHoused_CoOnwner,
        builder: (context, state) => const AddNewMember(),
      ),
      GoRoute(
        path: '/sign_In',
        name: AppRoutes.signIN,
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        path: '/dash_board',
        name: AppRoutes.dashbord,
        builder:
            (context, state) => MainNavigationScreen(mainPage: Dashborad()),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
      final currentPath = state.matchedLocation;
      debugPrint('Current path: $currentPath');

      // Define public paths
      const publicPaths = [
        // - confirmInfomation
        // - member_IdCheck
        // - setup_info
        // - member_pass
        // - Otp
        // - pass_reset
        // - forget_pass_otp
        // - auth_pass_reset
        // - addHous_co
        // - sign_In
        // - dash_board
        '/',
        '/sign_In',
        '/pass_reset',
        '/forget_pass_otp',
        '/auth_pass_reset',
        '/member_IdCheck',
        '/code-verify',
        "/setup_info",
        "/addHous_co",
        "/dash_board",
        "/confirmInfomation",
        "/Otp",
        "/Onbord_info",
        '/member_pass',
      ];

      // Skip redirect for these cases
      if (currentPath.startsWith('/error')) return null;

      // Check auth status
      final authData = await SharedPrefsService().getAuthData();
      final isAuthenticated = authData != null && authData.isNotEmpty;
      debugPrint('User authenticated: $isAuthenticated');

      // Handle redirects
      if (isAuthenticated) {
        // If authenticated but trying to access public path, go to dashboard
        if (publicPaths.contains(currentPath)) {
          return '/dash_board';
        }
      } else {
        // If not authenticated and trying to access protected path, go to onboarding
        if (!publicPaths.contains(currentPath)) {
          return '/';
        }
      }

      // No redirect needed
      return null;
    },
    errorBuilder: (context, state) {
      debugPrint('Route error: ${state.error}');
      return Scaffold(body: Center(child: Text('Route error: ${state.error}')));
    },
  );
});
