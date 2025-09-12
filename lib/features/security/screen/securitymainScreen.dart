import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/general_notification_count_widget.dart';
import 'package:curnectgate/features/security/provider/scanProvider.dart';
import 'package:curnectgate/features/security/widget/Scan_widget.dart';
import 'package:curnectgate/features/security/widget/tap_screen/CheckIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Securitymainscreen extends ConsumerWidget {
  const Securitymainscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(selectedTabProvider);
    final isScanning = ref.watch(qrScanProvider);

    return Scaffold(
      appBar: isScanning ? null : _buildAppBar(context),
      body: Stack(
        children: [
          if (!isScanning) _buildMainContent(context, ref, selectedTab),
          if (isScanning) ScanWidget(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          isScanning
              ? null
              : InkWell(
                onTap: () => ref.read(qrScanProvider.notifier).state = true,
                child: Container(
                  height: 30,
                  width: 100,
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.instance.black600,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        const Text(
                          "Scan QR",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        Expanded(
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
    );
  }

  // App Bar Widget
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,

      leading: Container(
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: AppColors.instance.teal200,
          image: DecorationImage(image: AssetImage(AssetPaths.userAvatar1)),
          shape: BoxShape.circle,
        ),
      ),

      leadingWidth: 35,
      titleSpacing: 6,
      title: Row(
        children: [
          Text(
            "Badge No: ",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              fontWeight: FontFamilies.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(width: 5),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: AppColors.instance.teal100,

              border: Border.all(
                style: BorderStyle.solid,
                width: 1,
                color: AppColors.instance.teal200,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "#34758",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 11,
                  color: AppColors.instance.teal400,
                  fontWeight: FontFamilies.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [ NotificationCount(onTap: (){
          context.pushNamed(AppRoutes.notification);
       },),],
    );
  }

  // Main Content Widget
  Widget _buildMainContent(
    BuildContext context,
    WidgetRef ref,
    int selectedTab,
  ) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          _buildOTPAccessCard(context, ref),
          _buildAccessLogSection(context, ref, selectedTab),
        ],
      ),
    );
  }


  Widget _buildAccessLogSection(
    BuildContext context,
    WidgetRef ref,
    int selectedTab,
  ) {
    return Column(
      children: [
        // Section Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "ACCESS LOGS",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black300,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Tabs
        Row(
          children: [
            Expanded(child: _buildLogTab("Guest", 0, selectedTab, ref)),
            Expanded(child: _buildLogTab("Vendor", 1, selectedTab, ref)),
            Expanded(child: _buildLogTab("Household", 2, selectedTab, ref)),
          ],
        ),

        // Log Content
        SizedBox(height: 200, child: _getLogContent(selectedTab)),
      ],
    );
  }

  // Helper Methods
  Widget _getLogContent(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return Guset();
      case 1:
        return Text("Vendor");
      case 2:
        return Text("Household");
      default:
        return Text("No data available");
    }
  }

  // OTP Access Card Widget
  Widget _buildOTPAccessCard(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _buildFeatureButton(
                AssetPaths.otpValidation,
                "Validate OTP",
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
            const SizedBox(width: 20),
            Expanded(
              child: _buildFeatureButton(
                AssetPaths.maintenanceLog,
                "Maintain Logs",
                () {
                  showUserBottomSheet(
                    context: context,
                    headertitle: "",
                    headersubtitle: "",
                    ref: ref,
                    bottom: BottomSheetView.specifyNumberofGust,
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _buildFeatureButton(
                AssetPaths.checkId,
                "Check IDs",
                () {},
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildFeatureButton(
                AssetPaths.emergency,
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

  // Feature Button Widget
  Widget _buildFeatureButton(String icon, String label, VoidCallback onTap) {
    return Column(
      children: [
        InkWell(
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
              child: Image.asset(icon, width: 10, height: 10, cacheWidth: 40),
            ),
          ),
        ),
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
    );
  }

  Widget _buildLogTab(String text, int index, int selectedTab, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(selectedTabProvider.notifier).state = index,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.instance.grey300,
          border: Border.all(
            color:
                selectedTab == index
                    ? AppColors.instance.black600
                    : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.instance.black600,
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // ... [Keep all your other existing methods (_buildOTPAccessCard, _buildFeatureButton,
  // _buildAccessLogSection, _buildLogTab, _getLogContent, _showScanResult)]
}
