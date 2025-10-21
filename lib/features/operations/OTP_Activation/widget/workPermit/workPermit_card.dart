import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/Work_permit/permit.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class WorkpermitCard extends ConsumerWidget {
  final Permit generated;
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
              trailing: generated.visitorOtp?.purpose ?? "",
              isCode: false,
              status: generated.visitorOtp?.status ?? "",
            ),
            _buildreUsableListTile(
              context: context,
              time: formatToTime(generated.visitorOtp?.validUntil ?? ""),
              isEndDate: true,
              title: "End",
              trailing: _formatDate(generated.visitorOtp?.validUntil ?? ""),
              isCode: false,
              status: generated.visitorOtp?.status ?? "",
            ),

            _buildreUsableListTile(
              context: context,
              isEndDate: false,
              title: "Code",
              trailing: generated.visitorOtp?.otpCode ?? "",
              isCode: true,
              expired: generated.visitorOtp?.countdownDisplay ?? "",
              status: generated.visitorOtp?.status ?? "",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildheaderText(String userName) {
    return Text(
      userName,
      style: TextStyle(
        fontFamily: FontFamilies.interDisplay,
        fontWeight: FontFamilies.bold,
        color: AppColors.instance.black600,
        fontSize: 20,
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

    switch (status.toLowerCase()) {
      case "active":
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

      default:
        return Text("");
    }
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 13,
            color: AppColors.instance.black300,
          ),
        ),
        Row(
          spacing: isCode ? 7 : 0,
          children: [
            if (isCode)
              Text(
                expired!.isNotEmpty
                    ? "Expired in $expired"
                    : statusCheck(status ?? ""),
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: color(status ?? ""),
                  fontSize: 10,
                  fontWeight: FontFamilies.bold,
                ),
              ),
            if (isEndDate) ...[
              Text(
                "$trailing - $time",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 13,
                  color: AppColors.instance.black600,
                ),
              ),
            ] else
              Text(
                trailing,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 13,
                  color: AppColors.instance.black600,
                ),
              ),
            isCode
                ? InkWell(
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
                    height: 15,
                    width: 15,
                  ),
                )
                : SizedBox(),
          ],
        ),
      ],
    );
  }

  Widget _buildvendorcardHead(
    WidgetRef ref,
    BuildContext context,
    Permit generated,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 5,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.instance.teal300,
              child: Center(
                child: Text(
                  getInitialsFromFullName(generated.guestName ?? ""),
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                    fontWeight: FontFamilies.bold,
                  ),
                ),
              ),
            ),
            _buildheaderText(generated.guestName ?? ""),
          ],
        ),
        changeButton(
          otp: generated.visitorOtp?.id.toString() ?? "",
          context: context,
          ref: ref,
          activeOtpID: generated.id ?? 0,
          status: generated.visitorOtp?.status ?? "",
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
