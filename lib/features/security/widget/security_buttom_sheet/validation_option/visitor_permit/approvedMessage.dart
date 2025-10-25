import 'dart:convert';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class AccessGrantedPermit extends StatelessWidget {
  final String jsonData;

  const AccessGrantedPermit({super.key, required this.jsonData});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> extractedData = jsonDecode(jsonData);
    final validation = extractedData['data']?['permit'] ?? {};

    final visitorName = validation["guest_name"];

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

        // Header Icon
        Icon(Icons.check_circle, size: 80, color: AppColors.instance.teal500),
        const SizedBox(height: 20),

        Text(
          "Permit Granted",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 22,
            color: AppColors.instance.black600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "You granted Permit to $visitorName",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 14,
            color: AppColors.instance.black400,
          ),
        ),
        const SizedBox(height: 30),

        // const SizedBox(height: 30),
        // _buildInfoCard(
        //   title: "Security Notes",
        //   details: {
        //     "Reason": validation['denial_reason'] ?? 'N/A',
        //     "Notes": validation['security_notes'] ?? 'N/A',
        //   },
        // ),
        _buildPrimaryButton(
          label: "Got it!",
          onTap: () => Navigator.pop(context),
        ),
      ],
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
