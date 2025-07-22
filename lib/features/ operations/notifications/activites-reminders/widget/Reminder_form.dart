import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddReminderForms extends ConsumerWidget {
  final TextEditingController controller;
  const AddReminderForms(this.controller, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors.instance;
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: "Reminder title ",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.black400),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.black400),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.error600),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.error600),
        ),
        hintStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: colors.black300,
          fontSize: 13,
        ),
        labelStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: colors.black300,
          fontSize: 13,
        ),
      ),
    );
  }
}
