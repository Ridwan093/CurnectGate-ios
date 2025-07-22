import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/notifications/activites-reminders/widget/filter_button_check.dart';
import 'package:curnectgate/features/%20operations/notifications/activites-reminders/widget/filter_submit_buttion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Filter extends ConsumerWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
            ),
          ),
          Text(
            "Filter & Sort",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              fontSize: 20,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Filter only activites you want to see",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              color: AppColors.instance.black300,
            ),
          ),
          SizedBox(height: 40),
          FilterButtonCheck(title: "Payment"),
          FilterButtonCheck(title: "Access Log"),
          FilterButtonCheck(title: "Reminder"),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: FilterSubmitButtion(
                  buttionColor: AppColors.instance.grey500,
                  buttionTextColor: AppColors.instance.black600,
                  buttiontext: 'Reset',
                  onTap: () {},
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: FilterSubmitButtion(
                  buttionColor: AppColors.instance.black600,
                  buttionTextColor: AppColors.instance.grey200,
                  buttiontext: 'Apply',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
