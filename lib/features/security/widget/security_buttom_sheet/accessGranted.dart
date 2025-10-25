import 'dart:convert';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class AccessGranted extends StatelessWidget {
  final String jsonData;
  final bool isGranted;

  const AccessGranted({
    super.key,
    required this.jsonData,
    required this.isGranted,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> extractedData = jsonDecode(jsonData);
    final validation = extractedData['data']?['validation'] ?? {};

    // Extract key details from "security_notes" (for manual validation logs)
    final String securityNotes = validation['security_notes'] ?? '';
    final visitorName = _extractValue(securityNotes, '👤 Visitor:');
    final purpose = _extractValue(securityNotes, '🎯 Purpose:');
    final phone = _extractValue(securityNotes, '📞 Phone:');
    final destination = _extractValue(securityNotes, '🏠 Destination:');
    final address = _extractValue(securityNotes, '📍 Address:');
    final validPeriod = _extractValue(securityNotes, '⏱️ Valid Period:');

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: AppColors.instance.black600),
              ),
            ),
            const SizedBox(height: 20),

            // Header Icon
            Icon(
              isGranted ? Icons.check_circle : Icons.cancel_rounded,
              size: 80,
              color:
                  isGranted
                      ? AppColors.instance.teal500
                      : AppColors.instance.error500,
            ),
            const SizedBox(height: 20),

            Text(
              isGranted ? "Access Granted" : "Access Denied",
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
                  ? "You granted access to $visitorName"
                  : "You denied access to $visitorName",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 14,
                color: AppColors.instance.black400,
              ),
            ),
            const SizedBox(height: 30),

            // Info Card
            _buildInfoCard(
              title: "Visitor Details",
              details: {
                "👤 Visitor": visitorName,
                "🎯 Purpose": purpose,
                "📞 Phone": phone,
                "🏠 Destination": destination,
                "📍 Address": address,
                "⏱️ Valid Period": validPeriod,
              },
            ),

            if (!isGranted &&
                (validation['denial_reason'] != null ||
                    validation['security_notes'] != null)) ...[
              const SizedBox(height: 30),
              _buildInfoCard(
                title: "Security Notes",
                details: {
                  "Reason": validation['denial_reason'] ?? 'N/A',
                  "Notes": validation['security_notes'] ?? 'N/A',
                },
              ),
            ],

            const SizedBox(height: 40),
            _buildPrimaryButton(
              label: "Got it!",
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  /// Extracts text following a specific emoji/label from multiline notes.
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

  Widget _buildInfoCard({
    required String title,
    required Map<String, String> details,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.instance.grey200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              fontSize: 16,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 10),
          ...details.entries.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${e.key}: ",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.medium,
                      fontSize: 13,
                      color: AppColors.instance.black500,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      e.value,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 13,
                        color: AppColors.instance.black600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.instance.black600,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
