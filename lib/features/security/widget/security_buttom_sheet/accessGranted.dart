import 'dart:convert';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class Accessgranted extends StatelessWidget {
  final String jsonData;
  final bool isGrated;
  const Accessgranted({
    super.key,
    required this.jsonData,
    required this.isGrated,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> extractedData = jsonDecode(jsonData);
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
          _buildUserInfoBox(
            size: size,
            userName:
                isGrated
                    ? (extractedData['data']['visitor']['name'])
                    : (extractedData['data']['validation']['security_notes']
                            ?.split('\n')
                            ?.firstWhere(
                              (line) => line.contains('👤 Visitor:'),
                              orElse: () => '',
                            )
                            ?.replaceAll('👤 Visitor: ', '') ??
                        "N/A"),
            isgranted: isGrated,
            denialReason:
                isGrated
                    ? null
                    : extractedData['data']['validation']['denial_reason'] ??
                        "N/A",
            securityNotes:
                isGrated
                    ? null
                    : extractedData['data']['validation']['security_notes'] ??
                        "N/A",
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
    required bool isgranted,
    String? denialReason,
    String? securityNotes,
  }) {
    return Column(
      children: [
        Icon(
          isgranted ? Icons.check_circle : Icons.close_rounded,
          size: 60,
          color:
              isgranted
                  ? AppColors.instance.teal500
                  : AppColors.instance.error500,
        ),
        SizedBox(height: 30),
        if (isgranted) ...[
          _buildText(
            title: "Access granted",
            subtitle: "You granted access to ",
            userName: userName,
          ),
        ] else ...[
          _buildText(
            title: "Access denied",
            subtitle: "You denied access to ",
            userName: userName,
            denialReason: denialReason,
            securityNotes: securityNotes,
          ),
        ],
      ],
    );
  }

  Widget _buildText({
    required String title,
    required String subtitle,
    required String userName,
    String? denialReason,
    String? securityNotes,
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
        if (!isGrated && denialReason != null) ...[
          SizedBox(height: 10),
          Text(
            "Reason: $denialReason",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              color: AppColors.instance.black300,
            ),
          ),
        ],
        if (!isGrated && securityNotes != null) ...[
          SizedBox(height: 10),
          Text(
            "Notes: $securityNotes",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              color: AppColors.instance.black300,
            ),
          ),
        ],
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
