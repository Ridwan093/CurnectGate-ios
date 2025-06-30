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
            _buildCardHeader(context),
            const SizedBox(height: 10),
            _buildDetailRow(title: "Block", value: block),
            _buildDetailRow(title: "Address", value: adrress!),
          ],
        ),
      ),
    );
  }

  Widget _buildCardHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.instance.teal100,
              child: Center(
                child: Text(
                  "BS",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                    fontWeight: FontFamilies.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              userName,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
                fontSize: 20,
              ),
            ),
          ],
        ),
        if (onChangePressed != null)
          CircleAvatar(
            backgroundColor: AppColors.instance.teal300,
            radius: 18,
            child: Center(
              child: Icon(
                Icons.call,
                size: 14,
                color: AppColors.instance.black600,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDetailRow({
    required String title,
    required String value,

    bool showExpiry = true,
  }) {
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
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 13,
                  color: AppColors.instance.black600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
