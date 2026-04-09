import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/permit_model/active_otp_item.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

// class WorkpermitCard extends ConsumerWidget {
//   final ActiveOtpItem generated;
//   const WorkpermitCard(this.generated, {super.key});

//   String _formatDate(String dateString) {
//     try {
//       // Try to parse the string into a DateTime
//       final parsedDate = DateTime.tryParse(dateString);
//       if (parsedDate == null) {
//         throw FormatException('Invalid date string');
//       }

//       // Format as 'd, MMM' (e.g., "21, Oct")
//       return DateFormat('d, MMM').format(parsedDate.toLocal());
//     } catch (e) {
//       debugPrint('Error formatting date: $e');
//       return 'Invalid date';
//     }
//   }

//   String formatRemainingTime(String timeValue) {
//     try {
//       final totalSeconds = double.parse(timeValue);
//       final hours = (totalSeconds / 3600).floor();
//       final minutes = ((totalSeconds % 3600) / 60).floor();
//       final seconds = (totalSeconds % 60).floor();

//       return '${hours}h ${minutes}m ${seconds}s';
//     } catch (e) {
//       return 'Invalid time format';
//     }
//   }

//   // Usage: formatRemainingTime("63628.20003") → "17h 40m 28s"

//   String formatToTime(String dateTimeString) {
//     try {
//       // Try to parse the string into a DateTime
//       final parsedDate = DateTime.tryParse(dateTimeString);
//       if (parsedDate == null) {
//         throw FormatException('Invalid date string');
//       }

//       // Convert to local timezone if it's not already
//       final localTime = parsedDate.toLocal();

//       // Format using DateFormat.jm() for 12-hour time with AM/PM
//       return DateFormat.jm().format(localTime); // e.g., 4:21 AM
//     } catch (e) {
//       debugPrint('Error formatting time: $e');
//       return 'Invalid time';
//     }
//   }

//   String formatTimeOfDay(TimeOfDay time) {
//     final now = DateTime.now();
//     final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
//     return DateFormat.jm().format(dt); // e.g. 2:00 PM
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final size = MediaQuery.sizeOf(context);
//     return Container(
//       margin: EdgeInsets.only(top: 20),

//       width: size.width,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: AppColors.instance.grey200,
//       ),
//       child: SingleChildScrollView(
//         padding: EdgeInsets.all(15),
//         child: Column(
//           spacing: 10,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildvendorcardHead(ref, context, generated),

//             _buildreUsableListTile(
//               context: context,
//               isEndDate: false,
//               title: "Type",
//               trailing: generated.purpose ?? "",
//               isCode: false,
//               status: generated.status ?? "",
//             ),
//             _buildreUsableListTile(
//               context: context,
//               time: formatToTime(generated.validUntil ?? ""),
//               isEndDate: true,
//               title: "End",
//               trailing: _formatDate(generated.validUntil ?? ""),
//               isCode: false,
//               status: generated.status ?? "",
//             ),

//             _buildreUsableListTile(
//               context: context,
//               isEndDate: false,
//               title: "Code",
//               trailing: generated.otpCode ?? "",
//               isCode: true,

//               status: generated.status ?? "",
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String statusCheck(String status) {
//     switch (status) {
//       case "revoked":
//         return "Revoked";
//       case "expired":
//         return "Expired";

//       case "used":
//         return "Used";
//       default:
//         return "";
//     }
//   }

//   Widget changeButton({
//     required String status,
//     required BuildContext context,
//     required WidgetRef ref,
//     required int activeOtpID,
//     required String otp,
//     required String phoneNumber,
//     required String username,
//   }) {
//     final notifier = ref.read(reminderProvider.notifier);

//     return InkWell(
//       onTap: () async {
//         // final authData = await SharedPrefsService().getAuthData();
//         // final data = authData?['user']?['digital_id_code'] ?? "";
//         // log(data.toString());
//         // log(token.toString());

//         notifier.updateLoading(false);

//         showUserBottomSheet(
//           context: context,
//           headertitle: otp,
//           headersubtitle: username,
//           location: phoneNumber,
//           ref: ref,
//           bottom: BottomSheetView.seletPermit,
//           id: activeOtpID,
//         );
//       },
//       child: Text(
//         "Add Permit",
//         style: TextStyle(
//           fontFamily: FontFamilies.interDisplay,
//           fontWeight: FontFamilies.bold,
//           color: AppColors.instance.teal300,
//         ),
//       ),
//     );
//   }

//   Color color(String status) {
//     switch (status) {
//       case "revoked":
//         return AppColors.instance.error500;
//       case "expired":
//         return AppColors.instance.black300;

//       default:
//         return AppColors.instance.error500;
//     }
//   }

//   Widget _buildreUsableListTile({
//     required String title,
//     required String trailing,
//     required bool isCode,
//     required bool isEndDate,
//     required BuildContext context,
//     String? time,
//     String? expired,
//     String? status,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // Title — fixed width to prevent pushing
//         SizedBox(
//           width: 80, // Keeps "Type", "End", "Code" aligned
//           child: Text(
//             title,
//             style: TextStyle(
//               fontFamily: FontFamilies.interDisplay,
//               fontSize: 13,
//               color: AppColors.instance.black300,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),

//         const SizedBox(width: 12),

//         // Trailing content — takes remaining space safely
//         Expanded(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               if (isCode && expired?.isNotEmpty == true)
//                 Flexible(
//                   child: Text(
//                     "Expired in $expired",
//                     textAlign: TextAlign.end,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontFamily: FontFamilies.interDisplay,
//                       fontSize: 11,
//                       color: color(status ?? ""),
//                       fontWeight: FontFamilies.bold,
//                     ),
//                   ),
//                 )
//               else if (isCode)
//                 Text(
//                   statusCheck(status ?? ""),
//                   style: TextStyle(
//                     fontFamily: FontFamilies.interDisplay,
//                     fontSize: 11,
//                     color: color(status ?? ""),
//                     fontWeight: FontFamilies.bold,
//                   ),
//                 ),

//               if (isCode) const SizedBox(width: 8),

//               // Main trailing text
//               Expanded(
//                 child: Text(
//                   isEndDate ? "$trailing - $time" : trailing,
//                   textAlign: TextAlign.end,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontFamily: FontFamilies.interDisplay,
//                     fontSize: 14,
//                     color: AppColors.instance.black600,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),

//               if (isCode) ...[
//                 const SizedBox(width: 8),
//                 InkWell(
//                   onTap: () {
//                     Clipboard.setData(ClipboardData(text: trailing));
//                     showCustomSuccessToast(
//                       context: context,
//                       message: "Copied",
//                       color: AppColors.instance.teal300,
//                       icon: Icons.check_circle,
//                       iconColors: AppColors.instance.black600,
//                       positionNumber: 70,
//                     );
//                   },
//                   child: Image.asset(
//                     AssetPaths.clipboard,
//                     height: 18,
//                     width: 18,
//                     color: AppColors.instance.teal400,
//                   ),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildvendorcardHead(
//     WidgetRef ref,
//     BuildContext context,
//     ActiveOtpItem generated,
//   ) {
//     return Row(
//       children: [
//         // Left: Avatar + Name — takes available space safely
//         Expanded(
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 18,
//                 backgroundColor: AppColors.instance.teal300,
//                 child: Text(
//                   getInitialsFromFullName(generated.guestName ?? ""),
//                   style: TextStyle(
//                     fontFamily: FontFamilies.interDisplay,
//                     color: AppColors.instance.black600,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 // ← Critical: name takes remaining space
//                 child: Text(
//                   generated.guestName ?? '',
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                   style: TextStyle(
//                     fontFamily: FontFamilies.interDisplay,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.instance.black600,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),

//         // Right: Change button — fixed size, never pushed off
//         if (generated.hasPermit == false &&
//             generated.status!.contains("active"))
//           changeButton(
//             phoneNumber: generated.guestPhone ?? "",
//             username: generated.guestName ?? "",
//             otp: generated.otpCode.toString(),
//             context: context,
//             ref: ref,
//             activeOtpID: generated.otpId ?? 0,
//             status: generated.status ?? "",
//           ),
//       ],
//     );
//   }

//   String getInitialsFromFullName(String fullName) {
//     if (fullName.trim().isEmpty) return '';

//     final parts = fullName.trim().split(RegExp(r'\s+')); // Split by spaces

//     final first = parts.first[0].toUpperCase();
//     final last = parts.length > 1 ? parts.last[0].toUpperCase() : '';

//     return '$first$last';
//   }
// }

class WorkpermitCard extends ConsumerWidget {
  final ActiveOtpItem generated;
  const WorkpermitCard(this.generated, {super.key});

  String _formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return 'N/A';
    try {
      final parsed = DateTime.tryParse(dateString);
      if (parsed == null) return 'Invalid date';
      return DateFormat('MMM d, yyyy').format(parsed.toLocal());
    } catch (e) {
      return 'Invalid date';
    }
  }

  String _formatTime(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';
    try {
      final parsed = DateTime.tryParse(dateTimeString);
      if (parsed == null) return '';
      return DateFormat.jm().format(parsed.toLocal());
    } catch (e) {
      return '';
    }
  }

  // Color _statusColor(String? status) {
  //   switch (status?.toLowerCase()) {
  //     case 'approved':
  //       return Colors.green.shade700;
  //     case 'pending':
  //       return Colors.orange.shade700;
  //     case 'rejected':
  //     case 'revoked':
  //       return Colors.red.shade700;
  //     case 'expired':
  //       return Colors.grey.shade700;
  //     default:
  //       return Colors.grey.shade700;
  //   }
  // }

  // IconData _statusIcon(String? status) {
  //   switch (status?.toLowerCase()) {
  //     case 'approved':
  //       return Icons.check_circle;
  //     case 'pending':
  //       return Icons.hourglass_top;
  //     case 'rejected':
  //     case 'revoked':
  //       return Icons.cancel;
  //     case 'expired':
  //       return Icons.timer_off;
  //     default:
  //       return Icons.help_outline;
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(reminderProvider.notifier);

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with status badge
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.instance.teal400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 16,
                        color: AppColors.instance.grey200,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        (generated.status ?? "N/A").toUpperCase().replaceAll(
                          "_",
                          " ",
                        ),
                        style: TextStyle(
                          color: AppColors.instance.grey200,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (generated.hasPermit == false &&
                        (generated.status ?? "").toLowerCase().contains(
                          "active",
                        ) ||
                    (generated.status ?? "").toLowerCase().contains("check_in"))
                  TextButton.icon(
                    onPressed: () {
                      notifier.updateLoading(false);

                      showUserBottomSheet(
                        context: context,
                        headertitle: generated.otpCode ?? "",
                        headersubtitle: generated.guestName ?? "",
                        location: generated.guestPhone,
                        ref: ref,
                        bottom: BottomSheetView.seletPermit,
                        id: generated.otpId,
                      );
                    },
                    icon: const Icon(Icons.add_circle_sharp, size: 16),
                    label: const Text(
                      "Add",
                      style: TextStyle(
                        fontFamily: FontFamilies.lato,
                        fontSize: 15,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.instance.black500,
                    ),
                  ),
              ],
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              generated.purpose ?? "Work Permit Authorization",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.instance.black600,

                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
              ),
            ),
          ),

          // const SizedBox(height: 8),

          // Items authorized
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Property: ${generated.property ?? "N/A"}",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.instance.black400,

                fontFamily: FontFamilies.interDisplay,
              ),
            ),
          ),
          SizedBox(height: 10),
          Divider(color: AppColors.instance.black100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "NOTE: ",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700, // 👈 make NOTE bold
                      color: AppColors.instance.black600,
                      fontFamily: FontFamilies.interDisplay,
                    ),
                  ),
                  TextSpan(
                    text:
                        "Security will verify this permit against the visitor exit code.",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.instance.black500,
                      fontFamily: FontFamilies.interDisplay,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: AppColors.instance.black100),
          const SizedBox(height: 16),
          _userInfo(),
          // Visitor info
        ],
      ),
    );
  }

  Widget _userInfo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(
          style: BorderStyle.solid,
          color: AppColors.instance.black100,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.person_4,
                  color: AppColors.instance.black600,
                  size: 22,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Visitor: ${generated.guestName ?? 'Unknown'}",
                        style: TextStyle(
                          color: AppColors.instance.black400,
                          fontSize: 13,
                          fontFamily: FontFamilies.interDisplay,
                        ),
                      ),
                      Text(
                        "Phone: ${generated.guestPhone ?? 'N/A'}",
                        style: TextStyle(
                          color: AppColors.instance.black400,
                          fontSize: 13,
                          fontFamily: FontFamilies.interDisplay,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Divider(color: AppColors.instance.black100),

          // Footer date
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: AppColors.instance.black400,
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    "Valid Until: ${_formatDate(generated.validUntil)}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
