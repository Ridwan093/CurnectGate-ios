import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/widgets/GetYourCode.dart';
import 'package:curnectgate/features/ResidentDirectory/Screen/ResidentTab.dart';
import 'package:curnectgate/features/auth/data/auth_model/OnboardingProgressManager.dart';
import 'package:curnectgate/features/auth/data/auth_model/onbording_enum.dart';
import 'package:curnectgate/features/auth/presentation/screen/changeTemporaryPassword.dart';
import 'package:curnectgate/features/auth/presentation/screen/creatnewpassword.dart';
import 'package:curnectgate/features/auth/presentation/screen/forgot_password.dart';
import 'package:curnectgate/features/auth/presentation/screen/memeber_getstarted.dart';
import 'package:curnectgate/features/auth/presentation/screen/rest_pass_otp_screen.dart';
import 'package:curnectgate/features/auth/presentation/screen/sign_in.dart';
import 'package:curnectgate/features/auth/presentation/screen/splac_screen.dart';
import 'package:curnectgate/features/estate_management/elections/screens/election_dashboard.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_screen/vendor_log.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/screen/Dashborad.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/screen/add_member.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/screen/allmemberScreen.dart';
import 'package:curnectgate/features/member_management/membership_ID/mainScreen/continue_to_Digital.dart';
import 'package:curnectgate/features/member_management/membership_ID/mainScreen/memberIDScreen.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/screen/estateconfirmation_screen.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/screen/onboard_code_confirm.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/screen/memberIdchecker.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/screen/setuprofilledInfo.dart';
import 'package:curnectgate/features/member_management/screen/main_navigation_screen.dart';
import 'package:curnectgate/features/member_management/screen/otp_screen.dart';
import 'package:curnectgate/features/member_management/screen/password_screen.dart';
import 'package:curnectgate/features/operations/OTP_Activation/screen/Activate_Otp_screen.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/activites_log.dart';
import 'package:curnectgate/features/operations/violation/screens/reportViolation.dart';
import 'package:curnectgate/features/payment/screen/Activites.dart';
import 'package:curnectgate/features/payment/screen/ReviewPayment.dart';
import 'package:curnectgate/features/payment/screen/payment_method_screen.dart';
import 'package:curnectgate/features/payment/screen/success_error_scren/success_error.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/due_model/outstanding_due.dart';
import 'package:curnectgate/features/payment/widget/payment_data/due_payement_data.dart';
import 'package:curnectgate/features/payment/widget/payment_data/select_due_payment_data.dart';
import 'package:curnectgate/features/security/screen/sccurityTap_Screen.dart';
import 'package:curnectgate/features/security/screen/security_notifier/notification.dart';
import 'package:curnectgate/features/security/screen/violation_details.dart';
import 'package:curnectgate/features/userProfile/Login_setting/manage_loging.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/screen/SetPreference.dart';
import 'package:curnectgate/features/userProfile/Privacy_setting/screen/privacy_screen.dart';
import 'package:curnectgate/features/userProfile/notification_setting/screen/notificationSetting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.splasScreen,
    routes: [
      GoRoute(
        name: '/Splac_screen', // Unique name for navigation
        path: AppRoutes.splasScreen,
        builder: (context, state) => SplashScreen(),
      ),
      // Define routes with BOTH path and name
      GoRoute(
        name: AppRoutes.estatateOnbording,
        path: '/',
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
          // All spread data is here

          return NewPassword(token: token, localEmail: email);
        },
      ),
      GoRoute(
        path: '/vendor_code',
        name: AppRoutes.vendorAccessCode,
        builder: (context, state) {
          // Safely cast the extra data

          final extra = state.extra as Map<String, dynamic>? ?? {};

          // Extract values with null checks
          final title = extra['title'] as String? ?? '';
          final share = extra['share'] as String? ?? '';
          final accessCode = extra['code'] as String? ?? '';
          // All spread data is here

          return GetYourCodeScreen(
            title: title,
            accessCode: accessCode,
            share: share,
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
      GoRoute(
        path: '/notification_settings',
        name: AppRoutes.userNotificationSetting,
        builder: (context, state) => UserNotificationSettings(),
      ),
      GoRoute(
        path: '/set_preference',
        name: AppRoutes.setPreferences,
        builder: (context, state) => PreferencesScreen(),
      ),
      GoRoute(
        path: '/member_screen',
        name: AppRoutes.getMemberInfo,
        builder: (context, state) => AllMemberListScreen(),
      ),
      GoRoute(
        path: '/set_privacy',
        name: AppRoutes.setPrivacy,
        builder: (context, state) => UserPrivacySettings(),
      ),
      GoRoute(
        path: '/app_notification',
        name: AppRoutes.notification,
        builder: (context, state) => ActivityPage(),
      ),

      GoRoute(
        path: '/violation_screen',
        name: AppRoutes.violation,
        builder: (context, state) => ReportViolation(),
      ),
      GoRoute(
        path: '/visitor_screen',
        name: AppRoutes.vendorLog,
        builder: (context, state) => Otpactivation(),
      ),

      GoRoute(
        path: '/security-dashboard',
        name: AppRoutes.securityguide,
        builder: (context, state) {
          return SecurityTapScreen();
        },
      ),

      GoRoute(
        path: '/tempt_pass',
        name: AppRoutes.changeTemporarypass,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};

          // Extract values with null checks
          final token = extra['token'] as String? ?? '';

          return ChangeTemporaryPassword(token: token);
        },
      ),
      GoRoute(
        path: '/Digital_starter',
        name: AppRoutes.digitalIDStarter,
        builder: (context, state) {
          // final extra = state.extra as Map<String, dynamic>? ?? {};

          // Extract values with null checks
          return MemberGetStart();
        },
      ),

      GoRoute(
        path: '/Digital_member_screen',
        name: AppRoutes.digitalIDMember,
        builder: (context, state) {
          // final extra = state.extra as Map<String, dynamic>? ?? {};

          // Extract values with null checks
          return DigitalCardScreen();
        },
      ),

      GoRoute(
        path: '/sec_violations',
        name: AppRoutes.securityViolationDeatails,
        builder: (context, state) {
          // final extra = state.extra as Violation;

          // Extract values with null checks
          return ViolationDetailScreen(violationId: "2");
        },
      ),

      GoRoute(
        path: '/directory_address',
        name: AppRoutes.residentDirectory,
        builder: (context, state) {
          // final extra = state.extra as Violation;

          // Extract values with null checks
          return ResidentTab();
        },
      ),

      GoRoute(
        path: '/security_notifier',
        name: AppRoutes.securitynotification,
        builder: (context, state) {
          // final extra = state.extra as Violation;

          // Extract values with null checks
          return SecurityNotifications();
        },
      ),

      GoRoute(
        path: '/work_order',
        name: AppRoutes.workOrder,
        builder: (context, state) {
          // final extra = state.extra as Violation;

          // Extract values with null checks
          return VendorLog();
        },
      ),
      GoRoute(
        path: '/election_dash',
        name: AppRoutes.electionDasbord,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          // Extract values with null checks
          return ElectionPage(id: extra["id"]);
        },
      ),

      GoRoute(
        path: '/manage_login',
        name: AppRoutes.manageLoging,
        builder: (context, state) {
          // final extra = state.extra as Violation;

          // Extract values with null checks
          return ManageLoging();
        },
      ),
      // ReviewPayment
      GoRoute(
        path: '/pay_all',
        name: AppRoutes.payallduePayment,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          final totalDue = extra["totalDue"] as String;
          final wallletBalance = extra["walletBalance"] as String;

          // Extract values with null checks
          return DuePaymentData(
            totalDue: totalDue,
            walletBalance: wallletBalance,
          );
        },
      ),

      GoRoute(
        path: '/review_pay_due',
        name: AppRoutes.paymentReview,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final walletBalce = extra["wallet"] as String;

          final lists =
              (extra["list"] as Iterable?)
                  ?.whereType<OutstandingDue>()
                  .toList() ??
              [];

          // Extract values with null checks
          return ReviewPayment(list: lists, wallet: walletBalce);
        },
      ),

      GoRoute(
        path: '/sletct_due',
        name: AppRoutes.selectedDueTopay,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          final totalDue = extra["totalDue"] as String;
          final wallletBalance = extra["walletBalance"] as String;

          // final lists =
          //     (extra["list"] as Iterable?)
          //         ?.whereType<OutstandingDue>()
          //         .toList() ??
          //     [];

          // Extract values with null checks
          return SelectDuePaymentData(
            totalDue: totalDue,
            walletBalance: wallletBalance,
          );
        },
      ),
      GoRoute(
        path: '/succes_file_screen',
        name: AppRoutes.paymentSuccess,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          final isFail = extra["fails_succs"] as bool;
          final errorBody = extra["ErrorMessage"] as String;

          // final lists =
          //     (extra["list"] as Iterable?)
          //         ?.whereType<OutstandingDue>()
          //         .toList() ??
          //     [];

          // Extract values with null checks
          return PaymentSuccessScreen(isFaile: isFail, error: errorBody);
        },
      ),

      GoRoute(
        path: '/payment_m',
        name: AppRoutes.paymentMethod,
        builder: (context, state) {
          // final lists =
          //     (extra["list"] as Iterable?)
          //         ?.whereType<OutstandingDue>()
          //         .toList() ??
          //     [];

          // Extract values with null checks
          return PaymentMethodScreen();
        },
      ),

      GoRoute(
        path: '/payment_History',
        name: AppRoutes.paymentHistory,
        builder: (context, state) {
          // final lists =
          //     (extra["list"] as Iterable?)
          //         ?.whereType<OutstandingDue>()
          //         .toList() ??
          //     [];

          // Extract values with null checks
          return Activites();
        },
      ),
    ],

    redirect: (BuildContext context, GoRouterState state) async {
      final currentPath = state.matchedLocation;
      debugPrint('Current path: $currentPath');
      final lastStep = await OnboardingProgressManager.getStep();
      if (state.matchedLocation == AppRoutes.splasScreen) {
        return null;
      }

      if (state.matchedLocation == "/Splac_screen") {
        return null;
      }
      // If user is mid-onboarding and not yet authenticated
      if (currentPath == "/" && lastStep != null) {
        switch (lastStep) {
          case OnboardingStep.estateCode:
            return '/code-verify';
          case OnboardingStep.memberCode:
            return '/member_IdCheck';
          case OnboardingStep.infoCheck:
            return '/Onbord_info';
          case OnboardingStep.password:
            return '/member_pass';
          case OnboardingStep.otp:
            return '/Otp';
          case OnboardingStep.completed:
            await OnboardingProgressManager.clearProgress();
            break;
        }
      }
      // Define public paths (unchanged from your original)
      const publicPaths = [
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
        "/tempt_pass",
        "/security-dashboard",
      ];

      // Skip redirect for error pages
      if (currentPath.startsWith('/error')) return null;

      // Get auth data from local storage
      final authData = await SharedPrefsService().getAuthData();
      final isAuthenticated = authData != null && authData.isNotEmpty;
      debugPrint('User authenticated: $isAuthenticated');

      if (!isAuthenticated) {
        // If not authenticated and trying to access protected path
        return !publicPaths.contains(currentPath) ? '/' : null;
      }

      // Parse user role from saved auth data
      final userRole = _parseUserRole(authData);
      debugPrint('User role: $userRole');

      // Role-specific dashboard paths
      const roleDashboards = {
        'landlord': '/dash_board',
        'admin': '/dash_board',
        'resident': '/dash_board',
        'security_personnel': '/security-dashboard',
      };

      // If authenticated but trying to access public path
      if (publicPaths.contains(currentPath)) {
        return roleDashboards[userRole] ?? '/dash_board';
      }

      // Role-based route protection
      if (currentPath.startsWith('/admin') && userRole != 'admin') {
        return '/';
      }

      if (currentPath.startsWith('/landlord') && userRole != 'landlord') {
        return '/';
      }

      if (currentPath.startsWith('/security') &&
          userRole != 'security_personnel') {
        return '/';
      }

      // Add other role-specific checks as needed...

      return null;
    },
  );

  // Helper function to parse user role from auth data
});
String _parseUserRole(Map<String, dynamic> authData) {
  try {
    return authData['user']['role']?.toString().toLowerCase() ?? 'unknown';
  } catch (e) {
    debugPrint('Error parsing user role: $e');
    return 'unknown';
  }
}
