import 'dart:convert';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class EventAccessMessage extends StatelessWidget {
  final String jsonData;
  final bool isGranted;

  const EventAccessMessage({
    super.key,
    required this.jsonData,
    required this.isGranted,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> extractedData = jsonDecode(jsonData);
    final validation = extractedData['data']["log"] ?? ['validation'] ?? {};
    final guestName = validation['guest_name'] ?? 'Guest';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close, color: AppColors.instance.black600),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color:
                isGranted
                    ? AppColors.instance.teal400.withOpacity(0.1)
                    : AppColors.instance.error400.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            isGranted ? Icons.check_circle_rounded : Icons.cancel_rounded,
            size: 80,
            color:
                isGranted
                    ? AppColors.instance.teal400
                    : AppColors.instance.error400,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          isGranted ? "Entry Granted" : "Entry Denied",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 22,
            color: AppColors.instance.black600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          isGranted
              ? "Access has been successfully granted to $guestName."
              : "Access for $guestName has been denied.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 14,
            color: AppColors.instance.black400,
          ),
        ),
        const SizedBox(height: 32),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.instance.grey200,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.instance.grey300),
          ),
          child: Column(
            children: [
              _buildInfoRow("Guest", guestName),
              const Divider(height: 20),
              _buildInfoRow("Phone", validation['guest_phone'] ?? 'N/A'),
              const Divider(height: 20),
              _buildInfoRow(
                "Vehicle",
                validation['vehicle_plate_number'] ?? 'N/A',
              ),
              if (!isGranted) ...[
                const Divider(height: 20),
                _buildInfoRow(
                  "Reason",
                  validation['denial_reason'] ?? 'N/A',
                  isError: true,
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.instance.black600,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: const Text(
            "Done",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isError = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 13,
            color: AppColors.instance.black300,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 13,
            color:
                isError
                    ? AppColors.instance.error400
                    : AppColors.instance.black600,
          ),
        ),
      ],
    );
  }
}
