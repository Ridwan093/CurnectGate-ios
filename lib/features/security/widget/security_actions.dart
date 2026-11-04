// lib/widgets/security_actions.dart
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import your assets, colors, bottom sheet helpers, etc.

class SecurityActions extends ConsumerWidget {
  const SecurityActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700;

    return Column(
      children: [
        const SizedBox(height: 32),

        // Central circular button + surrounding tiles
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // Central fingerprint / validate button
            GestureDetector(
              onTap: () {
                // Your validate entry logic here
                showUserBottomSheet(
                  context: context,
                  headertitle: "Validate Entry",
                  headersubtitle: "",
                  ref: ref,
                  bottom: BottomSheetView.validatedOTP, // adjust as needed
                );
              },
              child: Container(
                width: isSmallScreen ? 100 : 120,
                height: isSmallScreen ? 100 : 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AppColors.instance.teal400, AppColors.instance.teal500],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.fingerprint,
                  size: isSmallScreen ? 50 : 60,
                  color: Colors.white,
                ),
              ),
            ),

            // Surrounding tiles (positioned)
            Positioned(
              top: -30,
              child: _buildActionTile(
                "Validate Entry",
                Icons.check_circle_outline,
                () {
                  // same as central tap or different logic
                },
              ),
            ),
            Positioned(
              left: -90,
              top: 30,
              child: _buildActionTile("Violations", Icons.warning_amber, () {}),
            ),
            Positioned(
              right: -90,
              top: 30,
              child: _buildActionTile("Maintain Logs", Icons.book_outlined, () {}),
            ),
            Positioned(
              bottom: -30,
              left: -50,
              child: _buildActionTile("Emergencies", Icons.emergency_share, () {}),
            ),
            Positioned(
              bottom: -30,
              right: -50,
              child: _buildActionTile("Visitor Activity", Icons.people_alt, () {}),
            ),
          ],
        ),

        const SizedBox(height: 60),

        // Visitor Activity Card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "VISITOR ACTIVITY",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildVisitorStat("Today", "1", Colors.blue),
                      _buildVisitorStat("Active", "5", Colors.green),
                      _buildVisitorStat("Expired", "0", Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 100), // space before bottom nav
      ],
    );
  }

  Widget _buildActionTile(String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.instance.teal400.withOpacity(0.85),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 32),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style:  TextStyle(fontSize: 11, color: AppColors.instance.black600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildVisitorStat(String label, String count, Color color) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color),
        ),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}