import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/features/auth/presentation/screen/sign_in.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/screen/estateOnbarding.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/screen/estateconfirmation_screen.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/screen/onboard_code_confirm.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/screen/Dashborad.dart';
import 'package:curnectgate/features/member_management/screen/main_navigation_screen.dart';
import 'package:curnectgate/features/member_management/screen/memberIdchecker.dart';
import 'package:curnectgate/features/member_management/screen/password_screen.dart';
import 'package:curnectgate/features/member_management/screen/setuprofilledInfo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    routes: [
      // Define routes with BOTH path and name
      GoRoute(
        name: '/', // Unique name for navigation
        path: AppRoutes.estatateOnbording,
        builder: (context, state) => EstateOnboardingScreen(),
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
        path: '/sign_In',
        name: AppRoutes.signIN,
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        path: 'dash_board',
        name: AppRoutes.dashbord,
        builder:
            (context, state) => MainNavigationScreen(mainPage: Dashborad()),
      ),
    ],
    redirect: (context, state) => null,
  );
});
