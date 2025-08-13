import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/security/provider/scanProvider.dart';
import 'package:curnectgate/features/security/widget/Scan_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecurityDashboard extends ConsumerStatefulWidget {
  @override
  _SecurityDashboardState createState() => _SecurityDashboardState();
}

class _SecurityDashboardState extends ConsumerState<SecurityDashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

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

  @override
  Widget build(BuildContext context) {
    // final selectedTab = ref.watch(selectedTabProvider);
    final isScanning = ref.watch(qrScanProvider);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          isScanning
              ? null
              : InkWell(
                onTap: () => ref.read(qrScanProvider.notifier).state = true,
                child: Container(
                  height: 35,
                  width: 120,
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.instance.black600,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        const Text(
                          "Validate entry",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: const Icon(
                            Icons.qr_code_scanner,
                            size: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      body: Stack(
        children: [
          if (!isScanning) _buildBody(size),
          if (isScanning) ScanWidget(),
        ],
      ),
    );
  }

  Widget _buildBody(Size size) {
    return SizedBox(
      height: size.height,
      child: Stack(
        children: [
          // Background containers
          Column(
            children: [
              // Top teal container
              Container(
                height: size.height * .2,
                color: AppColors.instance.teal400,
                padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: _buildHeader(),
                ),
              ),
              // Bottom amber container
              Expanded(child: Container()),
            ],
          ),

          // Scrollable content
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top:
                    size.height * .2 -
                    60, // Position welcome card between containers
                bottom: 20,
                left: 10,
                right: 10,
              ),
              child: Column(
                children: [
                  _buildWelcomeCard(size),
                  SizedBox(height: 20),
                  _buildViolationsCard(),
                  SizedBox(height: 15),
                  _buildQuickActions(ref),
                  SizedBox(height: 20), // Extra space at bottom
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Security',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.instance.grey200,
            fontFamily: FontFamilies.interDisplay,
          ),
        ),
        Row(
          children: [
            Image.asset(
              AssetPaths.dashboardNotification,
              color: Colors.white,
              width: 25,
            ),
            SizedBox(width: 10),
            Image.asset(
              AssetPaths.navProfileInactive,
              color: Colors.white,
              width: 25,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWelcomeCard(Size size) {
    return SizedBox(
      width: size.width,
      child: Card(
        color: Colors.white,

        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome, Johny',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  _securityID(),
                ],
              ),

              Text(
                'Thur, May 15',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black500,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              SizedBox(height: 8),
              Divider(color: AppColors.instance.grey400),
              SizedBox(height: 8),
              _violationTrack(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _violationTrack() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "Track Violations",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.teal400,
                fontWeight: FontFamilies.bold,
              ),
            ),
            SizedBox(width: 10),
            _countContainer(),
          ],
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 13,
          color: AppColors.instance.black300,
        ),
      ],
    );
  }

  Widget _countContainer() {
    return Card(
      color: AppColors.instance.teal300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: Center(
          child: Text(
            "2",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.teal400,
              fontWeight: FontFamilies.bold,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }

  Widget _securityID() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          width: 1,
          color: AppColors.instance.black600,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Text(
          "#34758",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 11,
            color: AppColors.instance.black600,
            fontWeight: FontFamilies.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildViolationsCard() {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Updates',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.instance.black300,
                fontWeight: FontFamilies.bold,
                fontFamily: FontFamilies.interDisplay,
              ),
            ),
            SizedBox(height: 16),
            _buildViolationItem(
              () {
                showUserBottomSheet(
                  context: context,
                  headertitle: "Violations",
                  headersubtitle: "Track violation residents",
                  ref: ref,
                  bottom: BottomSheetView.securityViolationTrack,
                );
              },
              'You have new updates',
              '2 Violations to attend to',
              AssetPaths.vaolationIcon,
              "2",
            ),
            SizedBox(height: 6),
            Divider(color: AppColors.instance.grey400),
            SizedBox(height: 6),
            _buildViolationItem(
              () {},
              'You have new updates',
              'New message from your estate',
              AssetPaths.discussion,
              "2",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViolationItem(
    VoidCallback ontap,
    String title,
    String description,
    String icon,
    String count,
  ) {
    return InkWell(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(icon, width: 25),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.black400,
                          fontWeight: FontFamilies.bold,
                          fontSize: 12,
                        ),
                      ),
                      _countContainer(),
                    ],
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,
                      fontWeight: FontFamilies.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 10,
            color: AppColors.instance.black600,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick actions',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black300,
            fontFamily: FontFamilies.interDisplay,
          ),
        ),

        _buildOTPAccessCard(context, ref),
      ],
    );
  }

  Widget _buildOTPAccessCard(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _buildFeatureButton(
                AssetPaths.verifiedCard,
                "Check IDs",
                () {
                  showUserBottomSheet(
                    context: context,
                    headertitle: "",
                    headersubtitle: "",
                    ref: ref,
                    bottom: BottomSheetView.validatedOTP,
                  );
                },
              ),
            ),
            const SizedBox(width: 10),
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
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            const SizedBox(width: 10),
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
                    bottom: BottomSheetView.workEmgencyContacts,
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
      ],
    );
  }

  Widget _buildFeatureButton(String icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        elevation: 1,
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon, width: 30, height: 30, cacheWidth: 40),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontFamilies.bold,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
