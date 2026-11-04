import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/Work_permit/permit.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/Work_permit/permit_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PermitDetailsDialog extends StatelessWidget {
  final Permit permit;
  const PermitDetailsDialog({super.key, required this.permit});

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

  String _formatToTime(String dateTimeString) {
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

  @override
  Widget build(BuildContext context) {
    final visitor = permit.visitorOtp;

    final property = permit.property;
    final validtime =
        "${_formatDate(visitor?.validUntil ?? "")} - ${_formatToTime(visitor?.validUntil ?? "")}";
    final creatTime =
        "${_formatDate(visitor?.createdAt ?? "")} - ${_formatToTime(visitor?.createdAt ?? "")}";

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 25),

                _sectionTitle("Permit Summary"),
                _infoRow("Guest", permit.guestName),
                _infoRow("Phone", permit.guestPhoneNumber),
                _infoRow("Status", permit.statusBadge?.text),
                _infoRow("Created", creatTime),

                const SizedBox(height: 18),

                _sectionTitle("Visitor OTP"),
                _infoRow("OTP Code", visitor?.otpCode),
                _infoRow("Purpose", visitor?.purpose),
                _infoRow("Valid Until", validtime),

                const SizedBox(height: 18),

                _sectionTitle("Property"),
                _infoRow("Property", property?.propertyName),
                _infoRow("Code", property?.propertyCode),

                const SizedBox(height: 18),

                _sectionTitle("Items (${permit.items?.length})"),
                const SizedBox(height: 8),
                ..._buildItemsList(permit.items),

                const SizedBox(height: 24),
                _closeButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.verified_user, color: AppColors.instance.teal500, size: 28),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            "Clearance Permit",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: _statusColor(permit.status),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            permit.statusBadge?.text ?? "",
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontFamilies.bold,
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black500,
        ),
      ),
    );
  }

  Widget _infoRow(String label, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: TextStyle(
                color: AppColors.instance.black300,
                fontWeight: FontFamilies.medium,
                fontFamily: FontFamilies.interDisplay,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
                fontFamily: FontFamilies.interDisplay,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildItemsList(List<PermitItem>? items) {
    if (items == null || items.isEmpty) {
      return [const Text("No items attached")];
    }

    return items.map((item) {
      return TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 400),
        tween: Tween(begin: 0, end: 1),
        builder:
            (context, value, child) => Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 10 * (1 - value)),
                child: child,
              ),
            ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.instance.grey300,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.inventory_2_outlined,
                size: 20,
                color: AppColors.instance.teal300,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      item.itemName ?? "",
                      style: TextStyle(
                        fontWeight: FontFamilies.bold,
                        color: AppColors.instance.black600,
                        fontFamily: FontFamilies.interDisplay,
                      ),
                    ),
                    if (item.description != null)
                      Text(
                        item.description!,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.instance.black300,
                          fontFamily: FontFamilies.interDisplay,
                        ),
                      ),
                  ],
                ),
              ),
              Text(
                "x${item.quantity ?? 1}",
                style: TextStyle(
                  fontWeight: FontFamilies.bold,
                  color: AppColors.instance.black500,
                  fontFamily: FontFamilies.interDisplay,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  Color _statusColor(String? status) {
    switch (status?.toLowerCase()) {
      case "active":
        return AppColors.instance.teal500;
      case "used":
        return AppColors.instance.grey500;
      case "revoked":
        return AppColors.instance.error500;
      default:
        return Colors.grey;
    }
  }

  Widget _closeButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.instance.black600,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () => context.pop(),
        child: Text(
          "Close",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.grey200,
          ),
        ),
      ),
    );
  }
}
