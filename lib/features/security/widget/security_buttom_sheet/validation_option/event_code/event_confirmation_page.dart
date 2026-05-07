import 'dart:convert';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../member_management/tabState/permission_tab_state.dart';

class EventCodeConfirmationCode extends ConsumerWidget {
  final String rawMap;

  const EventCodeConfirmationCode({super.key, required this.rawMap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final extractedData = json.decode(rawMap);
    final data = extractedData["data"] ?? {};
    final eventDetails = data["event_details"] ?? {};
    final eventCode = data["event_code"] ?? {};
    final int eventId = eventCode["id"] ?? 0;

    String _formatTime(String? timeStr) {
      if (timeStr == null || timeStr.isEmpty || timeStr == "N/A") return "N/A";
      try {
        DateTime dt;
        try {
          dt = DateTime.parse(timeStr);
        } catch (e) {
          dt = DateFormat("MMM dd, yyyy HH:mm").parse(timeStr);
        }
        return DateFormat("dd MMM yyyy, hh:mm a").format(dt);
      } catch (e) {
        return timeStr;
      }
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Event Validation",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 18,
                  color: AppColors.instance.black600,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: AppColors.instance.black400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.instance.grey200,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.instance.grey300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.instance.teal400.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.event,
                        color: AppColors.instance.teal400,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            eventDetails["title"] ?? "Untitled Event",
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              fontWeight: FontFamilies.bold,
                              fontSize: 16,
                              color: AppColors.instance.black600,
                            ),
                          ),
                          Text(
                            eventDetails["type"] ?? "Event",
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              fontSize: 12,
                              color: AppColors.instance.black300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildDetailItem(
                  icon: Icons.person_outline,
                  label: "Host",
                  value: eventDetails["host"] ?? "N/A",
                ),
                const Divider(height: 24),
                _buildDetailItem(
                  icon: Icons.location_on_outlined,
                  label: "Address",
                  value: eventDetails["address"] ?? "N/A",
                ),
                if (eventCode["event_location"] != null &&
                    eventCode["event_location"].toString().isNotEmpty) ...[
                  const Divider(height: 24),
                  _buildDetailItem(
                    icon: Icons.map_outlined,
                    label: "Event Location",
                    value: eventCode["event_location"].toString(),
                  ),
                ],
                if (eventCode["event_description"] != null &&
                    eventCode["event_description"].toString().isNotEmpty) ...[
                  const Divider(height: 24),
                  _buildDetailItem(
                    icon: Icons.description_outlined,
                    label: "Description",
                    value: eventCode["event_description"].toString(),
                  ),
                ],
                const Divider(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: _buildDetailItem(
                        icon: Icons.access_time,
                        label: "Start Time",
                        value: _formatTime(
                          eventDetails["start_time"]?.toString(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: _buildDetailItem(
                        icon: Icons.access_time_filled,
                        label: "End Time",
                        value: _formatTime(
                          eventDetails["end_time"]?.toString(),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatItem(
                      "Expected",
                      eventDetails["expected_guests"].toString(),
                    ),
                    _buildStatItem(
                      "Entries",
                      eventDetails["current_entries"].toString(),
                    ),
                    _buildStatItem(
                      "Remaining",
                      eventDetails["remaining_guests"].toString(),
                      isHighlight: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    showUserBottomSheet(
                      context: context,
                      headertitle: rawMap,
                      headersubtitle: '',
                      ref: ref,
                      bottom: BottomSheetView.denyEventcode,
                      id: eventId,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: AppColors.instance.error400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Deny Entry",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      color: AppColors.instance.error400,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    showUserBottomSheet(
                      context: context,
                      headertitle: rawMap,
                      headersubtitle: '',
                      ref: ref,
                      bottom: BottomSheetView.grantEventCode,
                      id: eventId,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppColors.instance.teal400,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Grant Entry",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: AppColors.instance.black300),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 10,
                  color: AppColors.instance.black300,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.medium,
                  fontSize: 13,
                  color: AppColors.instance.black600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(
    String label,
    String value, {
    bool isHighlight = false,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 10,
            color: AppColors.instance.black300,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 16,
            color:
                isHighlight
                    ? AppColors.instance.teal400
                    : AppColors.instance.black600,
          ),
        ),
      ],
    );
  }
}
