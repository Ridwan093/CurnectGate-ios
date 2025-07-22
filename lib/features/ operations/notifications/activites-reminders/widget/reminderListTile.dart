import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/notifications/activites-reminders/widget/customSwitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReminderListTile extends ConsumerWidget {
  final bool isEnabled;
  final BuildContext context;

  final String title;
  final Function(bool)? onChanged;
  const ReminderListTile({
    super.key,

    required this.isEnabled,
    required this.context,

    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Text(
          title,
          style: TextStyle(
            fontWeight: FontFamilies.bold,
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
            fontSize: 14,
          ),
        ),

        CustomSwitch(
          value: isEnabled,
          onChanged: (value) async {
            if (onChanged != null) {
              await onChanged!(value); // ✅ Actually triggers the API logic
            }
          },
        )
        ],
      )
    );
  }
}
