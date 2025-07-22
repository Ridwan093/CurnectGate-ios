import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/notifications/activites-reminders/widget/mark_button_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MarksReminder extends ConsumerWidget {
  final String title;
  final String subtitle;
  const MarksReminder({super.key, required this.subtitle, required this.title});

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
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              fontSize: 20,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              color: AppColors.instance.black300,
            ),
          ),
          SizedBox(height: 40),
          MarkButtonCheck(title: "Mark as Done"),
          MarkButtonCheck(title: "Edit Reminder"),
          MarkButtonCheck(title: "Remove"),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
