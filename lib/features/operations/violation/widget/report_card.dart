import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/violation/model/report_models/violation.dart';
import 'package:curnectgate/features/operations/violation/report_provider/report_provider.dart';
import 'package:curnectgate/features/operations/violation/screens/ViolationDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportCard extends ConsumerWidget {
  final Violation violation;
  const ReportCard({super.key, required this.violation});
  String truncateWithEllipsis(String text, {int maxLength = 50}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength).trim()}...';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: ViolationDetailPage(
                  violation: violation,
                  images: violation.evidence?.mediaUrls ?? [],
                ),
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Material(
          borderRadius: BorderRadius.circular(5),
          elevation: 1,
          child: Container(
            width: size.width,

            decoration: BoxDecoration(
              color: AppColors.instance.grey300,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderRow(
                    truncateWithEllipsis(
                      violation.locationDetails?.additionalLocation ?? "",
                      maxLength: 20,
                    ),

                    violation.status,
                    context,
                    ref,
                    violation.id,
                    violation.locationDetails?.additionalLocation ?? "",
                  ),
                  _buildReportdiscription(
                    truncateWithEllipsis(violation.description, maxLength: 20),
                  ),
                  _buildAnonymouswidget(
                    violation.isAnonymous,
                    violation.reporter?.name ?? "",
                  ),
                  SizedBox(height: 15),
                  if (violation.evidence?.mediaUrls != null &&
                      violation.evidence!.mediaUrls.isNotEmpty) ...[
                    SizedBox(
                      height: 100,
                      child: PageView(
                        children:
                            violation.evidence!.mediaUrls.map((e) {
                              return _buildCarReportImage(size, e);
                            }).toList(),
                      ),
                    ),
                  ],

                  SizedBox(height: 10),

                  if (violation.status.contains("resolved")) ...[
                    _resolvedMark(size, false),
                  ],

                  if (violation.status.contains("dismissed")) ...[
                    _resolvedMark(size, true),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarReportImage(Size size, String mediaUrl) {
    return Hero(
      tag: 'violation_image_$mediaUrl',
      child: Container(
        height: 100,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(mediaUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildReportdiscription(String description) {
    return Text(
      description,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: AppColors.instance.black300,
        fontFamily: FontFamilies.interDisplay,
      ),
    );
  }

  Widget _buildAnonymouswidget(bool isAnonymous, String reporterName) {
    return Row(
      children: [
        Image.asset(
          isAnonymous ? AssetPaths.anonymous : AssetPaths.navProfileActive,
          height: 30,
          width: 20,
          color: AppColors.instance.teal300,
        ),
        SizedBox(width: 5),
        Text(
          isAnonymous ? "Anonymous" : reporterName,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black500,
          ),
        ),
      ],
    );
  }

  Widget _resolvedMark(Size size, bool isResove) {
    return Container(
      height: 40,
      width: size.width,

      decoration: BoxDecoration(
        color:
            isResove ? AppColors.instance.error200 : AppColors.instance.teal200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isResove ? "Report  dismissed" : "Mark as resolved",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black500,
              fontWeight: FontFamilies.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 8),
          Icon(
            isResove ? Icons.close : Icons.done,
            color:
                isResove
                    ? AppColors.instance.error600
                    : AppColors.instance.black500,
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow(
    String title,
    String statues,
    BuildContext context,
    WidgetRef ref,
    int id,
    String timeline,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
            fontWeight: FontFamilies.bold,
          ),
        ),
        InkWell(
          onTap: () {
            ref.read(reportProvider.notifier).setId(id);
            showUserBottomSheet(
              context: context,
              headertitle: title,
              headersubtitle: "",
              ref: ref,
              bottom: BottomSheetView.resolutionTime,
              id: id,
            );
          },

          child: _buildPendingIcon(statues),
        ),
      ],
    );
  }

  Widget _buildPendingIcon(String status) {
    IconData icon;
    Color iconColor;

    switch (status.toLowerCase()) {
      case 'pending':
        icon = Icons.error_outline;
        iconColor = AppColors.instance.yellow500;
        break;
      case 'investigating':
        icon = Icons.remove_red_eye;
        iconColor = AppColors.instance.grey400;
        break;
      case 'resolved':
        icon = Icons.check_circle_outline;
        iconColor = AppColors.instance.teal500;
        break;
      case 'dismissed':
        icon = Icons.cancel_outlined;
        iconColor = AppColors.instance.error500;
        break;
      case 'expected':
      case 'arrived':
        icon = Icons.location_on_outlined;
        iconColor = AppColors.instance.teal400;
        break;
      case 'checked_in':
        icon = Icons.login;
        iconColor = AppColors.instance.blue400;
        break;
      case 'checked_out':
        icon = Icons.logout;
        iconColor = AppColors.instance.grey300;
        break;
      case 'denied':
        icon = Icons.block;
        iconColor = AppColors.instance.error600;
        break;
      case 'approved':
      case 'validated':
        icon = Icons.verified_user_outlined;
        iconColor = Colors.green;
        break;
      case 'expired':
      case 'revoked':
        icon = Icons.timer_off;
        iconColor = AppColors.instance.error400;
        break;
      case 'no_show':
        icon = Icons.event_busy;
        iconColor = AppColors.instance.yellow300;
        break;
      case 'created':
      case 'updated':
        icon = Icons.edit_note;
        iconColor = AppColors.instance.black500;
        break;
      case 'assigned':
        icon = Icons.assignment_ind_outlined;
        iconColor = AppColors.instance.teal500;
        break;
      case 'commented':
        icon = Icons.chat_bubble_outline;
        iconColor = AppColors.instance.grey500;
        break;
      default:
        icon = Icons.info_outline;
        iconColor = Colors.grey;
    }

    final hasDot = [
      "pending",
      'investigating',
      'resolved',
      'dismissed',
    ].contains(status.toLowerCase());

    return Stack(
      children: [
        Icon(icon, color: AppColors.instance.black600, size: 24),
        if (hasDot)
          Positioned(
            right: 0,
            top: 3,
            child: CircleAvatar(radius: 4, backgroundColor: iconColor),
          ),
      ],
    );
  }
}
