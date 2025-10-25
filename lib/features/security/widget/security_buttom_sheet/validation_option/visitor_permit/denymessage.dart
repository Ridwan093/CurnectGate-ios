import 'dart:convert';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class DenyEntryPermitMessage extends StatelessWidget {
  final String jsonData;

  const DenyEntryPermitMessage({super.key, required this.jsonData});
  static String _extractValue(String notes, String label) {
    try {
      final line =
          notes
              .split('\n')
              .firstWhere((l) => l.contains(label), orElse: () => '')
              .replaceAll(label, '')
              .trim();
      return line.isNotEmpty ? line : 'N/A';
    } catch (_) {
      return 'N/A';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> extractedData = json.decode(jsonData);

    final validation = extractedData['data']?['permit'] ?? {};

    // Extract key details from "security_notes" (for manual validation logs)
    final String visitorName = validation['guest_name'] ?? '';
    // final visitorName = ;
    // final purpose = _extractValue(securityNotes, '🎯 Purpose:');
    // final phone = _extractValue(securityNotes, '📞 Phone:');
    // final destination = _extractValue(securityNotes, '🏠 Destination:');
    // final address = _extractValue(securityNotes, '📍 Address:');
    // final validPeriod = _extractValue(securityNotes, '⏱️ Valid Period:');
    final size = MediaQuery.sizeOf(context);
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

          _buildUserInfoBox(size: size, userName: visitorName),
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

  Widget _buildUserInfoBox({required Size size, required String userName}) {
    return Column(
      children: [
        Icon(Icons.cancel, size: 60, color: AppColors.instance.error500),

        SizedBox(height: 30),

        _buildText(
          title: "Permit deny",
          subtitle: "You deny Permit to ",
          userName: userName,
        ),
      ],
    );
  }

  Widget _buildText({
    required String title,
    required String subtitle,
    required String userName,
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
