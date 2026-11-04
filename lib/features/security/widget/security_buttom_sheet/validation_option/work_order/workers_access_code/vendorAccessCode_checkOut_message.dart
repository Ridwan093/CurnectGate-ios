import 'dart:convert';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VendorCheckOutMessage extends StatelessWidget {
  final String jsonData;
  const VendorCheckOutMessage({super.key, required this.jsonData});

  String formatDateTime(String dateTimeString) {
    try {
      final dateTime = DateTime.parse(dateTimeString).toLocal();
      return DateFormat("MMM d, yyyy 'at' hh:mm a").format(dateTime);
    } catch (e) {
      return 'Invalid date';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> extractedData = jsonDecode(jsonData);
    final size = MediaQuery.sizeOf(context);
    final visitor = extractedData['data']['check_in'] ?? {};

    final name = extractedData["data"]["worker"] ?? "N/A";
    final day = extractedData["data"]["duration_minutes"] ?? 0.0;

    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close, color: AppColors.instance.black600),
            ),
          ),
          SizedBox(height: 30),
          _buildUserInfoBox(
            size: size,
            userName: name,
            checkInTime: formatDateTime(visitor['checked_in_at'] ?? "N/A"),
            checkOutTime: formatDateTime(visitor['checked_out_at'] ?? "N/A"),
            duration: day.toString(),
          ),
          SizedBox(height: 30),
          _buildFeatureButton(
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoBox({
    required Size size,
    required String userName,
    required String checkInTime,
    required String checkOutTime,
    required String duration,
  }) {
    return Column(
      children: [
        Icon(Icons.check_circle, size: 60, color: AppColors.instance.teal500),
        SizedBox(height: 30),
        _buildText(
          title: "Checkout Completed",
          subtitle: "Worker ",
          userName: userName,
          details: [
            "Check-in: $checkInTime",
            "Check-out: $checkOutTime",
            "Duration: $duration minutes",
          ],
        ),
      ],
    );
  }

  Widget _buildText({
    required String title,
    required String subtitle,
    required String userName,
    required List<String> details,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 18,
            color: AppColors.instance.black600,
          ),
        ),
        SizedBox(height: 5),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 12,
                  color: AppColors.instance.black300,
                ),
                text: subtitle,
              ),
              TextSpan(
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 12,
                  color: AppColors.instance.black600,
                ),
                text: userName,
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        ...details.map(
          (detail) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              detail,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 12,
                color: AppColors.instance.black300,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureButton({required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.instance.black600,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Got it!",
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
}
