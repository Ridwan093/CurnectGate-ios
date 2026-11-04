import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/permit_model/active_otp_item.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
                    (generated.status ?? "").toLowerCase().contains(
                      "checked_in",
                    ))
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
