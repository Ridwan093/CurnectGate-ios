import 'dart:convert';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// WorkOrderConfirmWidget
/// Expects `response` that matches the JSON under "data" in your API response.
/// Example usage:
/// WorkOrderConfirmWidget(extractedData: jsonResponseMap);
class VendorAccessCodeConfirm extends ConsumerWidget {
  final String jsonData; // full response map containing data
  final String otpCode;
  const VendorAccessCodeConfirm({
    super.key,
    required this.jsonData,
    required this.otpCode,
  });

  // helper: format date-only YYYY-MM-DDT... to readable date (you can adjust)
  String _formatDate(String? dt) {
    if (dt == null) return 'N/A';
    try {
      final d = DateTime.parse(dt).toLocal();
      return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
    } catch (_) {
      return dt;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final Map<String, dynamic> extractedData = json.decode(jsonData);
    final data = extractedData['data'] ?? {};
    final workorder = data['worker'] ?? {};
    final location = data['workorder'] ?? {};

    final vendorName = workorder['name']?.toString() ?? 'N/A';
    final isCheckIn = workorder['is_checked_in'] ?? false;
    final locations = location['location']?.toString() ?? 'N/A';
    final timeWindow = location['daily_time_window']?.toString() ?? 'N/A';

    final id = workorder['id'] ?? 0;

    // Build header text for sharing quickly

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: vendor + actions
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
              Text(
                "Work Infomation",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 20,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Verify the workers info and data befor grant access.",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  color: AppColors.instance.black300,
                ),
              ),
              Divider(color: AppColors.instance.grey300),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'Work Info:',
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              fontSize: 13,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.instance.grey300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar / PentagonContainer (keeps your design)
                Text(
                  vendorName,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    fontSize: 14,
                    color: AppColors.instance.black600,
                  ),
                ),

                // Share all button
                // IconButton(
                //   onPressed: () => _shareText(shareAllText.toString()),
                //   icon: Icon(Icons.share, color: AppColors.instance.teal400),
                //   tooltip: 'Share all',
                // ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Location block
          Container(
            width: size.width,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.instance.grey300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location['property']?.toString() ?? 'N/A',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    fontSize: 14,
                    color: AppColors.instance.black600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  locations,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 12,
                    color: AppColors.instance.black400,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  location['directions']?.toString() ?? '',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 12,
                    color: AppColors.instance.black400,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // Date & time window + worker count row
          _infoTile(title: timeWindow, subtitle: 'Time window', size: size),

          const SizedBox(height: 16),

          // Description

          // Workers list
          SizedBox(height: 30),
          _buildsupportButton(
            context: context,
            id: id,
            ref: ref,
            isCeckIn: isCheckIn,
            otpCode: otpCode,
          ),
        ],
      ),
    );
  }

  Widget _buildsupportButton({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
    required bool isCeckIn,
    required String otpCode,
  }) {
    return Row(
      children: [
        Expanded(
          child: _buildFeatureButton(
            onTap: () {
              context.pop();
              showUserBottomSheet(
                id: id,
                context: context,
                headertitle: otpCode,
                headersubtitle: "",
                ref: ref,
                bottom: BottomSheetView.vendoraccesCodeDeny,
              );
            },
            title: "Deny Access",
            color: AppColors.instance.grey500,
          ),
        ),
        SizedBox(width: 10),
        if (!isCeckIn) ...[
          Expanded(
            child: _buildFeatureButton(
              onTap: () {
                context.pop();
                showUserBottomSheet(
                  id: id,
                  context: context,
                  headertitle: otpCode,

                  headersubtitle: "",
                  ref: ref,
                  bottom: BottomSheetView.vendorCheckIn,
                );
              },
              title: "Check In",
              color: AppColors.instance.black600,
            ),
          ),
        ] else ...[
          Expanded(
            child: _buildFeatureButton(
              onTap: () {
                context.pop();
                showUserBottomSheet(
                  id: id,
                  context: context,
                  headertitle: otpCode,

                  headersubtitle: "",
                  ref: ref,
                  bottom: BottomSheetView.vendorCheckOut,
                );
              },
              title: "Check Out",
              color: AppColors.instance.black600,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildFeatureButton({
    required VoidCallback onTap,
    required String title,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.grey200,
            ),
          ),
        ),
      ),
    );
  }

  // small info tile used in row above
  Widget _infoTile({
    required String title,
    required String subtitle,
    required Size size,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.instance.grey300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              fontSize: 13,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              color: AppColors.instance.black400,
            ),
          ),
        ],
      ),
    );
  }
}
