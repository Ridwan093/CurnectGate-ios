import 'dart:ui';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/eletionData/poll_data.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/votingSettingCheck.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/general_notification_count_widget.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:curnectgate/features/security/provider/permmission_handler.dart';
import 'package:curnectgate/features/security/provider/scanProvider.dart';
import 'package:curnectgate/features/security/widget/Scan_widget.dart';
import 'package:curnectgate/features/security/widget/security_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class SecurityDashboard extends ConsumerStatefulWidget {
  @override
  _SecurityDashboardState createState() => _SecurityDashboardState();
}

class _SecurityDashboardState extends ConsumerState<SecurityDashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  static const double _floatingHeaderHeight = 84;
  static const double _headerOverlap = 90;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String getFormattedDate() {
    final now = DateTime.now();
    final formatter = DateFormat('E, MMM, d');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.read(oTpformProvider.notifier);
    final isScanning = ref.watch(qrScanProvider);

    final size = MediaQuery.sizeOf(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) {
        if (isScanning) {
          state.resetForm();
          ref.read(qrScanProvider.notifier).state = false;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],

        body: Stack(
          children: [
            if (!isScanning) _buildBody(size, ref),
            if (isScanning) ScanWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(Size size, WidgetRef ref) {
    final t = ((size.height - 600) / (1000 - 600)).clamp(0.0, 1.0);
    final height = lerpDouble(170.0, 260.0, t)!;

    final safeTop = MediaQuery.of(context).padding.top;

    return SizedBox(
      height: size.height,
      child: Stack(
        children: [
          /// ✅ BACKGROUND (pure paint — never used for layout math)
          Column(
            children: [
              Container(
                width: size.width,
                height: height,
                color: AppColors.instance.teal400,
              ),
              Expanded(child: Container(color: Colors.grey[100])),
            ],
          ),

          /// ✅ FLOATING PROFILE HEADER (LOCKED & STABLE)

          /// ✅ SCROLL CONTENT (PROFESSIONAL OFFSET)
          Positioned.fill(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                top: height - _headerOverlap,
                left: 10,
                right: 10,
                bottom: 16,
              ),
              child: Column(
                children: [
                  PremiumSecurityHeader(),
                  const SizedBox(height: 15),
                  _buildCheckOutbutto(),
                  const SizedBox(height: 15),
                  Votingsettingcheck(child: PollDatas(canRoute: true)),
                  const SizedBox(height: 15),
                  _buildQuickActions(ref),
                ],
              ),
            ),
          ),
          Positioned(
            top: safeTop + 12,
            left: 10,
            right: 10,
            child: SizedBox(
              height: _floatingHeaderHeight,
              child: Container(
                color: AppColors.instance.teal400,
                child: _buildHeader(ref),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;
    final fullname = authState.fullname ?? "User";
    final role = user?["role"] ?? "Security Officer";

    final profilePhoto = user?['profile_photo'] ?? null;

    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700 || size.width < 380;

    final fontScale = isSmallScreen ? 0.9 : 1.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: isSmallScreen ? 26 : 32,
              backgroundImage:
                  profilePhoto != null ? AssetImage(profilePhoto) : null,
              backgroundColor: Colors.white,
              child: Center(
                child:
                    profilePhoto != null
                        ? null
                        : Image.asset(
                          AssetPaths.navProfileActive,
                          width: 25,

                          color: AppColors.instance.teal400,
                        ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  fullname,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 18 * fontScale,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Flexible(
                  child: Text(
                    role,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14 * fontScale,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        NotificationCount(
          color: AppColors.instance.grey200,
          onTap: () {
            context.pushNamed(AppRoutes.securitynotification);
          },
          width: 10,
        ),
      ],
    );
  }

  Widget _buildActionButton(
    String label,
    Color color,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.instance.grey200, size: 20),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.instance.grey200,
                  fontWeight: FontFamilies.bold,
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckOutbutto() {
    final notifier = ref.read(oTpformProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _buildActionButton(
            "Check In",
            AppColors.instance.yellow600,
            Icons.login,
            () {
              notifier.updateValidationType("");

              showUserBottomSheet(
                context: context,
                headertitle: "checkin",
                headersubtitle: "",
                ref: ref,
                bottom: BottomSheetView.visitorValidation,
              );
            }, // add your check-in handler
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildActionButton(
            "Check Out",
            AppColors.instance.teal400,
            Icons.logout,
            () {
              notifier.updateValidationType("");

              showUserBottomSheet(
                context: context,
                headertitle: "checkout",
                headersubtitle: "",
                ref: ref,
                bottom: BottomSheetView.visitorValidation,
              );
            }, // add your check-out handler
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildOTPAccessCard(context, ref)],
    );
  }

  Widget _buildOTPAccessCard(BuildContext context, WidgetRef ref) {
    final state = ref.read(oTpformProvider.notifier);

    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildFeatureButton(
                    AssetPaths.maintenanceLog,
                    "Validate Entry",
                    () {
                      state.resetForm();
                      showUserBottomSheet(
                        context: context,
                        headertitle: "",
                        headersubtitle: "",
                        ref: ref,
                        bottom: BottomSheetView.optionForIdAndCode,
                      );
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _buildFeatureButton(
                    AssetPaths.vaolationIcon,
                    "Violations",
                    () {
                      showUserBottomSheet(
                        context: context,
                        headertitle: "Violations",
                        headersubtitle: "Track violation residents",
                        ref: ref,
                        bottom: BottomSheetView.securityViolationTrack,
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildFeatureButton(
                    AssetPaths.visitorLo,
                    "Maintain Logs",
                    () {
                      showUserBottomSheet(
                        context: context,
                        headertitle: "Access Logs",
                        headersubtitle: "Track access logs residents",
                        ref: ref,
                        bottom: BottomSheetView.mentainLog,
                      );
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _buildFeatureButton(
                    AssetPaths.emgencySecurity,
                    "Emergencies",
                    () {
                      showUserBottomSheet(
                        context: context,
                        headertitle: "",
                        headersubtitle: "",
                        ref: ref,
                        bottom: BottomSheetView.residentEmgencyContacts,
                      );
                      // showUserBottomSheet(
                      //   context: context,
                      //   headertitle: "",
                      //   headersubtitle: "",
                      //   ref: ref,
                      //   bottom: BottomSheetView.workEmgencyContacts,
                      // );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 10,

          child: _buildCenterClickButton(
            onTap: () async {
              final hasPermission = await checkCameraPermission(context);
              if (!hasPermission) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Camera permission required")),
                );
                return;
              }
              state.resetForm();
              ref.read(qrScanProvider.notifier).state = true;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCenterClickButton({required VoidCallback onTap}) {
    final size = MediaQuery.sizeOf(context);
    final isSmallScreen = size.height < 700 || size.width < 380;
    return Container(
      alignment: Alignment.center,
      height: isSmallScreen ? 110 : 130,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.instance.teal400,
        boxShadow: [
          BoxShadow(
            spreadRadius: 5.0,
            blurRadius: 2.0,

            offset: Offset.fromDirection(1.0),
            color: Colors.white,
          ),
        ],
      ),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.instance.grey200,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 5.0,
                  blurRadius: 2.0,

                  offset: Offset.fromDirection(1.0),
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.ads_click_outlined,
                color: AppColors.instance.teal400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureButton(String icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 30, height: 30),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                label,
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontFamilies.bold,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
                // maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
