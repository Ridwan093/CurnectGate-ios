import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/permit_model/active_otp_item.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class WorkpermitCard extends ConsumerWidget {
  final ActiveOtpItem generated;
  const WorkpermitCard(this.generated, {super.key});

  String _formatDate(String dateString) {
    try {
      // Try to parse the string into a DateTime
      final parsedDate = DateTime.tryParse(dateString);
      if (parsedDate == null) {
        throw FormatException('Invalid date string');
      }

      // Format as 'd, MMM' (e.g., "21, Oct")
      return DateFormat('d, MMM').format(parsedDate.toLocal());
    } catch (e) {
      debugPrint('Error formatting date: $e');
      return 'Invalid date';
    }
  }

  String formatRemainingTime(String timeValue) {
    try {
      final totalSeconds = double.parse(timeValue);
      final hours = (totalSeconds / 3600).floor();
      final minutes = ((totalSeconds % 3600) / 60).floor();
      final seconds = (totalSeconds % 60).floor();

      return '${hours}h ${minutes}m ${seconds}s';
    } catch (e) {
      return 'Invalid time format';
    }
  }

  // Usage: formatRemainingTime("63628.20003") → "17h 40m 28s"

  String formatToTime(String dateTimeString) {
    try {
      // Try to parse the string into a DateTime
      final parsedDate = DateTime.tryParse(dateTimeString);
      if (parsedDate == null) {
        throw FormatException('Invalid date string');
      }

      // Convert to local timezone if it's not already
      final localTime = parsedDate.toLocal();

      // Format using DateFormat.jm() for 12-hour time with AM/PM
      return DateFormat.jm().format(localTime); // e.g., 4:21 AM
    } catch (e) {
      debugPrint('Error formatting time: $e');
      return 'Invalid time';
    }
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(dt); // e.g. 2:00 PM
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.only(top: 20),

      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.instance.grey300,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildvendorcardHead(ref, context, generated),

            _buildreUsableListTile(
              context: context,
              isEndDate: false,
              title: "Type",
              trailing: generated.purpose ?? "",
              isCode: false,
              status: generated.status ?? "",
            ),
            _buildreUsableListTile(
              context: context,
              time: formatToTime(generated.validUntil ?? ""),
              isEndDate: true,
              title: "End",
              trailing: _formatDate(generated.validUntil ?? ""),
              isCode: false,
              status: generated.status ?? "",
            ),

            _buildreUsableListTile(
              context: context,
              isEndDate: false,
              title: "Code",
              trailing: generated.otpCode ?? "",
              isCode: true,

              status: generated.status ?? "",
            ),
          ],
        ),
      ),
    );
  }

  String statusCheck(String status) {
    switch (status) {
      case "revoked":
        return "Revoked";
      case "expired":
        return "Expired";

      case "used":
        return "Used";
      default:
        return "";
    }
  }

  Widget changeButton({
    required String status,
    required BuildContext context,
    required WidgetRef ref,
    required int activeOtpID,
    required String otp,
  }) {
    final notifier = ref.read(reminderProvider.notifier);

    return InkWell(
      onTap: () async {
        // final authData = await SharedPrefsService().getAuthData();
        // final data = authData?['user']?['digital_id_code'] ?? "";
        // log(data.toString());
        // log(token.toString());

        notifier.updateLoading(false);

        showUserBottomSheet(
          context: context,
          headertitle: otp,
          headersubtitle: "Revoked  OTP",
          ref: ref,
          bottom: BottomSheetView.seletPermit,
          id: activeOtpID,
        );
      },
      child: Text(
        "Add Permit",
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontWeight: FontFamilies.bold,
          color: AppColors.instance.teal300,
        ),
      ),
    );
  }

  Color color(String status) {
    switch (status) {
      case "revoked":
        return AppColors.instance.error500;
      case "expired":
        return AppColors.instance.black300;

      default:
        return AppColors.instance.error500;
    }
  }

  Widget _buildreUsableListTile({
    required String title,
    required String trailing,
    required bool isCode,
    required bool isEndDate,
    required BuildContext context,
    String? time,
    String? expired,
    String? status,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Title — fixed width to prevent pushing
        SizedBox(
          width: 80, // Keeps "Type", "End", "Code" aligned
          child: Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 13,
              color: AppColors.instance.black300,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(width: 12),

        // Trailing content — takes remaining space safely
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (isCode && expired?.isNotEmpty == true)
                Flexible(
                  child: Text(
                    "Expired in $expired",
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 11,
                      color: color(status ?? ""),
                      fontWeight: FontFamilies.bold,
                    ),
                  ),
                )
              else if (isCode)
                Text(
                  statusCheck(status ?? ""),
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 11,
                    color: color(status ?? ""),
                    fontWeight: FontFamilies.bold,
                  ),
                ),

              if (isCode) const SizedBox(width: 8),

              // Main trailing text
              Expanded(
                child: Text(
                  isEndDate ? "$trailing - $time" : trailing,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 14,
                    color: AppColors.instance.black600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              if (isCode) ...[
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: trailing));
                    showCustomSuccessToast(
                      context: context,
                      message: "Copied",
                      color: AppColors.instance.teal300,
                      icon: Icons.check_circle,
                      iconColors: AppColors.instance.black600,
                      positionNumber: 70,
                    );
                  },
                  child: Image.asset(
                    AssetPaths.clipboard,
                    height: 18,
                    width: 18,
                    color: AppColors.instance.teal400,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildvendorcardHead(
    WidgetRef ref,
    BuildContext context,
    ActiveOtpItem generated,
  ) {
    return Row(
      children: [
        // Left: Avatar + Name — takes available space safely
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.instance.teal300,
                child: Text(
                  getInitialsFromFullName(generated.guestName ?? ""),
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                // ← Critical: name takes remaining space
                child: Text(
                  generated.guestName ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontWeight.bold,
                    color: AppColors.instance.black600,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Right: Change button — fixed size, never pushed off
        if (generated.hasPermit == false &&
            generated.status!.contains("active"))
          changeButton(
            otp: generated.otpCode.toString(),
            context: context,
            ref: ref,
            activeOtpID: generated.otpId ?? 0,
            status: generated.status ?? "",
          ),
      ],
    );
  }

  String getInitialsFromFullName(String fullName) {
    if (fullName.trim().isEmpty) return '';

    final parts = fullName.trim().split(RegExp(r'\s+')); // Split by spaces

    final first = parts.first[0].toUpperCase();
    final last = parts.length > 1 ? parts.last[0].toUpperCase() : '';

    return '$first$last';
  }
}
