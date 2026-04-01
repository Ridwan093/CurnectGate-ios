import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/Work_permit/permit.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/normal_model/permit_dialog.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class WorkpermitCard extends ConsumerWidget {
  final Permit generated;
  const WorkpermitCard(this.generated, {super.key});

  String _formatDate(String dateString) {
    try {
      final parsedDate = DateTime.tryParse(dateString);
      if (parsedDate == null) {
        throw FormatException('Invalid date string');
      }

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
    return PermitCard(
      title: "Item Exit Authorization",
      itemCount: generated.items?.length ?? 0,
      visitorName: generated.guestName ?? "N/A",
      phone: generated.guestPhoneNumber ?? "080XXXXXXX",
      dateLabel:
          "Create On: ${_formatDate(generated.createdAt ?? "")}, ${formatToTime(generated.createdAt ?? "")}",
      status: statusCheck(generated.status ?? ""),
      onAction:
          () => _onPress(
            statusCheck(generated.status ?? ""),
            context,
            generated,
            ref,
          ),
    );
  }

  void _onPress(
    PermitStatus status,
    BuildContext context,
    Permit permit,
    WidgetRef ref,
  ) {
    final notifier = ref.read(reminderProvider.notifier);
    switch (status) {
      case PermitStatus.approved:
        notifier.updateLoading(false);
        showPermitDetailsDialog(context: context, permit: permit);
      case PermitStatus.rejected:
        notifier.updateLoading(false);
        log("Reject Press");

      default:
        notifier.updateLoading(false);
    }
  }


  PermitStatus statusCheck(String status) {
    switch (status) {
      case "revoked":
        return PermitStatus.rejected;
      case "active":
        return PermitStatus.approved;

      default:
        return PermitStatus.pending;
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



}

enum PermitStatus { approved, pending, rejected, draft }

class PermitStatusStyle {
  final Color borderColor;
  final Color badgeColor;
  final Color badgeTextColor;
  final IconData icon;

  const PermitStatusStyle({
    required this.borderColor,
    required this.badgeColor,
    required this.badgeTextColor,
    required this.icon,
  });
}

PermitStatusStyle getPermitStyle(PermitStatus status) {
  switch (status) {
    case PermitStatus.approved:
      return PermitStatusStyle(
        borderColor: AppColors.instance.teal400,
        badgeColor: AppColors.instance.teal400,
        badgeTextColor: Colors.white,
        icon: Icons.check_circle,
      );

    case PermitStatus.pending:
      return PermitStatusStyle(
        borderColor: AppColors.instance.yellow600,
        badgeColor: AppColors.instance.yellow600.withOpacity(.15),
        badgeTextColor: AppColors.instance.yellow600,
        icon: Icons.access_time_filled,
      );

    case PermitStatus.rejected:
      return PermitStatusStyle(
        borderColor: AppColors.instance.error500,
        badgeColor: AppColors.instance.error500,
        badgeTextColor: Colors.white,
        icon: Icons.cancel,
      );

    case PermitStatus.draft:
      return PermitStatusStyle(
        borderColor: Colors.grey.shade400,
        badgeColor: Colors.grey.shade200,
        badgeTextColor: Colors.grey.shade700,
        icon: Icons.description_outlined,
      );
  }
}

class PermitCard extends StatelessWidget {
  final String title;
  final int itemCount;
  final String visitorName;
  final String phone;
  final String dateLabel;
  final String actionText;
  final VoidCallback? onAction;
  final PermitStatus status;

  const PermitCard({
    super.key,
    required this.title,
    required this.itemCount,
    required this.visitorName,
    required this.phone,
    required this.dateLabel,
    required this.status,
    this.actionText = "View Details",
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final style = getPermitStyle(status);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(size.width * .035),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: style.borderColor.withOpacity(.4)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Header Row
            Row(
              children: [
                Icon(style.icon, color: style.borderColor, size: 22),
                const SizedBox(width: 8),

                /// title expands safely
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 14,
                      color: AppColors.instance.black600,
                    ),
                  ),
                ),

                _StatusBadge(status: status),
              ],
            ),

            const SizedBox(height: 6),

            /// 🔹 item count
            Text(
              "$itemCount Items Authorized",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 12,
                color: AppColors.instance.black400,
              ),
            ),

            const SizedBox(height: 12),

            /// 🔹 visitor box
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  const Icon(Icons.person_outline, size: 20),
                  const SizedBox(width: 8),

                  /// visitor info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Visitor: $visitorName",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 12,
                            color: AppColors.instance.black600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Phone: $phone",
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 11,
                            color: AppColors.instance.black400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// 🔹 action button
                  if (onAction != null)
                    _ActionButton(status: status, onTap: onAction!),
                ],
              ),
            ),

            const SizedBox(height: 10),

            /// 🔹 date row
            Row(
              children: [
                const Icon(Icons.calendar_today_outlined, size: 16),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    dateLabel,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 11,
                      color: AppColors.instance.black400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final PermitStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final style = getPermitStyle(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: style.badgeColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.name.toUpperCase(),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: style.badgeTextColor,
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final PermitStatus status;

  const _ActionButton({required this.status, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final style = getPermitStyle(status);
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: style.badgeColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          _buttonName(status),
          style: const TextStyle(
            fontSize: 11,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  String _buttonName(PermitStatus status) {
    switch (status) {
      case PermitStatus.approved:
        return "View Details";
      case PermitStatus.pending:
        return "Awating Approval";
      case PermitStatus.rejected:
        return "View Reason";

      default:
        return "Approved";
    }
  }
}
