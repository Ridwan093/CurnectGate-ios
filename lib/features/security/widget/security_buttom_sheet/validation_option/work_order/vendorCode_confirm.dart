import 'dart:convert';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../member_management/tabState/permission_tab_state.dart';

/// WorkOrderConfirmWidget
/// Expects `response` that matches the JSON under "data" in your API response.
/// Example usage:
/// WorkOrderConfirmWidget(extractedData: jsonResponseMap);
class WorkOrderConfirmWidget extends ConsumerWidget {
  final String jsonData; // full response map containing data

  const WorkOrderConfirmWidget({super.key, required this.jsonData});

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

  // copy text to clipboard
  Future<void> _copyToClipboard(BuildContext context, String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    final snack = SnackBar(
      content: const Text('Copied to clipboard'),
      duration: const Duration(milliseconds: 900),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  // share text using share_plus
  Future<void> _shareText(String text) async {
    await Share.share(text);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final Map<String, dynamic> extractedData = json.decode(jsonData);
    final data = extractedData['data'] ?? {};
    final workorder = data['workorder'] ?? {};
    final location = data['location'] ?? {};
    final workers = data['workers'] as List? ?? [];

    final vendorName = workorder['vendor_name']?.toString() ?? 'N/A';
    final vendorPhone = workorder['vendor_phone']?.toString() ?? 'N/A';
    final category = workorder['category']?.toString() ?? 'N/A';
    final description = workorder['description']?.toString() ?? '';

    final startDate = _formatDate(workorder['start_date']?.toString());
    final endDate = _formatDate(workorder['end_date']?.toString());
    final timeWindow = workorder['daily_time_window']?.toString() ?? 'N/A';
    final numberOfWorkers =
        workorder['number_of_workers']?.toString() ?? '${workers.length}';
    final id = workorder['id'] ?? 0;

    // Build header text for sharing quickly
    final shareAllText =
        StringBuffer()
          ..writeln('Here are your work order details:')
          ..writeln('Vendor: $vendorName')
          ..writeln('Phone: $vendorPhone')
          ..writeln('Work: $category')
          ..writeln(
            'Location: ${location['property'] ?? location['address'] ?? 'N/A'}',
          )
          ..writeln('When: $startDate — $endDate  |  $timeWindow')
          ..writeln('Workers: $numberOfWorkers')
          ..writeln('')
          ..writeln('Worker access codes:');
    for (final w in workers) {
      final name = w['name'] ?? 'N/A';
      final code = w['access_code'] ?? 'N/A';
      shareAllText.writeln('$name — Code: $code');
    }

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
            'Info:',
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
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.instance.grey200,
                  child: Center(
                    child: Icon(
                      Icons.work_history,
                      color: AppColors.instance.teal400,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Vendor name
                      Text(
                        vendorName,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontWeight: FontFamilies.bold,
                          fontSize: 14,
                          color: AppColors.instance.black600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Vendor phone (show only phone)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.instance.grey200,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.instance.teal300),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 12,
                            color: AppColors.instance.teal400,
                            fontWeight: FontFamilies.bold,
                          ),
                        ),
                      ),
                    ],
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
                  location['address']?.toString() ??
                      location['full_address']?.toString() ??
                      'N/A',
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
          Row(
            children: [
              Expanded(
                child: _infoTile(
                  title: '$startDate — $endDate',
                  subtitle: 'Dates',
                  size: size,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _infoTile(
                  title: timeWindow,
                  subtitle: 'Time window',
                  size: size,
                ),
              ),
              // const SizedBox(width: 10),
              // Expanded(
              //   child: _infoTile(
              //     title: '$numberOfWorkers Workers',
              //     subtitle: 'Workforce',
              //     size: size,
              //   ),
              // ),
            ],
          ),

          const SizedBox(height: 16),

          // Description
          if (description.isNotEmpty) ...[
            Text(
              'Description',
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                fontSize: 13,
                color: AppColors.instance.black600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 12,
                color: AppColors.instance.black400,
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Workers header
          Text(
            '$numberOfWorkers Workers', // B style (e.g. "5 Workers")
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              fontSize: 14,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 10),

          // Workers list
          Column(
            children:
                workers.map<Widget>((w) {
                  final name = w['name']?.toString() ?? 'N/A';
                  final phone =
                      w['phone']?.toString(); // show only phone (if any)
                  final isLeader = (w['is_vendor_leader'] == true);
                  final code = w['access_code']?.toString() ?? 'N/A';
                  final wStatus = w['status']?.toString() ?? 'N/A';

                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.instance.grey300,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.instance.grey200),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Leader star badge
                        if (isLeader)
                          Padding(
                            padding: const EdgeInsets.only(right: 8, top: 2),
                            child: Text('⭐', style: TextStyle(fontSize: 18)),
                          )
                        else
                          const SizedBox(width: 8),
                        // Name & phone column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontFamily: FontFamilies.interDisplay,
                                  fontWeight: FontFamilies.bold,
                                  fontSize: 13,
                                  color: AppColors.instance.black600,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                phone ?? 'N/A',
                                style: TextStyle(
                                  fontFamily: FontFamilies.interDisplay,
                                  fontSize: 12,
                                  color: AppColors.instance.black400,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  // Access code badge
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.instance.grey200,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: AppColors.instance.teal300,
                                      ),
                                    ),
                                    child: Text(
                                      code,
                                      style: TextStyle(
                                        fontFamily: FontFamilies.interDisplay,
                                        fontSize: 12,
                                        color: AppColors.instance.black600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  // Status
                                  Text(
                                    wStatus,
                                    style: TextStyle(
                                      fontFamily: FontFamilies.interDisplay,
                                      fontSize: 12,
                                      color: AppColors.instance.black400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Actions: copy code, share worker
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () => _copyToClipboard(context, code),
                              child: Icon(
                                Icons.copy,
                                size: 18,
                                color: AppColors.instance.teal400,
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap:
                                  () =>
                                      _shareText('$name — Access code: $code'),
                              child: Icon(
                                Icons.share,
                                size: 18,
                                color: AppColors.instance.teal400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
          SizedBox(height: 30),
          _buildsupportButton(context: context, id: id, ref: ref),
        ],
      ),
    );
  }

  Widget _buildsupportButton({
    required BuildContext context,
    required int id,
    required WidgetRef ref,
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
                headertitle: "",
                headersubtitle: "",
                ref: ref,
                bottom: BottomSheetView.vendorCodeDeny,
              );
            },
            title: "Deny Access",
            color: AppColors.instance.grey500,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _buildFeatureButton(
            onTap: () {
              context.pop();
              showUserBottomSheet(
                id: id,
                context: context,
                headertitle: "",

                headersubtitle: "",
                ref: ref,
                bottom: BottomSheetView.vendorCodeApproved,
              );
            },
            title: "Grant Access",
            color: AppColors.instance.black600,
          ),
        ),
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
