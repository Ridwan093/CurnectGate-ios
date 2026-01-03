//  ResidentCard(
//           userName: generatedLists.vistorName,
//           purposeOfVisit: generatedLists.purposeofVisit,
//           selectedDate: generatedLists.selectedDate,
//           selectedTime: generatedLists.selectedTime,
//           onChangePressed: () {},
//         );

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class ResidentCard extends StatelessWidget {
  final String userName;
  final String block;
  final String? adrress;

  final VoidCallback? onChangePressed;
  final bool colortype;

  const ResidentCard({
    super.key,
    required this.userName,
    required this.block,
    this.adrress,

    this.onChangePressed,
    this.colortype = true,
  });
  // New: Format address from JSON string
  String _formatAddress(String? addressJson) {
    if (addressJson == null ||
        addressJson.isEmpty ||
        addressJson == "null" ||
        addressJson == "{}") {
      return "Not provided";
    }

    try {
      // Remove { } and split by ', '
      String cleaned = addressJson.trim();
      if (cleaned.startsWith('{') && cleaned.endsWith('}')) {
        cleaned = cleaned.substring(1, cleaned.length - 1);
      }

      final Map<String, String> addressMap = {};

      // Split by ', ' and then by ': '
      final entries = cleaned.split(', ');
      for (var entry in entries) {
        final parts = entry.split(': ');
        if (parts.length == 2) {
          String key = parts[0].trim();
          String value = parts[1].trim();

          // Remove quotes if present
          if (value.startsWith('"') && value.endsWith('"')) {
            value = value.substring(1, value.length - 1);
          } else if (value.startsWith("'") && value.endsWith("'")) {
            value = value.substring(1, value.length - 1);
          }

          addressMap[key] = value;
        }
      }

      // Build formatted address
      final List<String> parts = [];

      if (addressMap['estate_name'] != null &&
          addressMap['estate_name'] != 'null') {
        parts.add(addressMap['estate_name']!);
      }

      return parts.isEmpty ? "Not provided" : parts.join(', ');
    } catch (e) {
      // Final fallback
      return "Address unavailable";
    }
  }

  String _getInitials(String fullName) {
    if (fullName.trim().isEmpty) return '';
    final parts = fullName.trim().split(RegExp(r'\s+'));
    final first = parts.first[0].toUpperCase();
    final last = parts.length > 1 ? parts.last[0].toUpperCase() : '';
    return '$first$last';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.instance.grey300,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardHeader(context, userName),
            const SizedBox(height: 10),
            _buildDetailRow(title: "Member ID", value: block),
            _buildDetailRow(title: "Address", value: _formatAddress(adrress)),
          ],
        ),
      ),
    );
  }

  Widget _buildCardHeader(BuildContext context, String userName) {
    return Row(
      children: [
        // Left: Avatar
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.instance.teal100,
          child: Text(
            _getInitials(userName),
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),

        const SizedBox(width: 12),

        // Middle: Name — takes all available space safely
        Expanded(
          child: Text(
            userName,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontWeight.bold,
              color: AppColors.instance.black600,
              fontSize: 19,
            ),
          ),
        ),

        // Right: Call button — always visible
        if (onChangePressed != null)
          InkWell(
            onTap: onChangePressed,
            borderRadius: BorderRadius.circular(40),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.instance.teal300,
              child: Icon(
                Icons.call,
                size: 18,
                color: AppColors.instance.black600,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDetailRow({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 13,
              color: AppColors.instance.black300,
            ),
          ),
          Flexible(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 13,
                color: AppColors.instance.black600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
