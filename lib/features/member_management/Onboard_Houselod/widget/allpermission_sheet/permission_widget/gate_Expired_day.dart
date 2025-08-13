import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GateExpiredDay extends ConsumerWidget {
  final bool isEnable;
  const GateExpiredDay({super.key, required this.isEnable});
  String formatExpirationDay(int daysDifference) {
    if (daysDifference == 1) {
      return "24 hours";
    } else if (daysDifference == 2) {
      return "Tomorrow";
    } else {
      return "$daysDifference days";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationProviders);
    return InkWell(
      onTap: isEnable ? () => _selectExpirationDate(context, ref) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        decoration: BoxDecoration(
          color: isEnable ? Colors.white : AppColors.instance.grey200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Expired At",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontFamilies.bold,
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
              ),
            ),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      state.expiredDay.isEmpty
                          ? "Not selected"
                          : formatExpirationDay(int.parse(state.expiredDay)),

                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black400,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectExpirationDate(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final notifier = ref.read(notificationProviders.notifier);

    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day); // Strip time
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today, // Prevent selecting past days
      lastDate: DateTime(now.year + 5),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.instance.yellow500,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.black),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      final DateTime now = DateTime.now();
      final DateTime today = DateTime(
        now.year,
        now.month,
        now.day,
      ); // Strip time
      final DateTime selected = DateTime(
        picked.year,
        picked.month,
        picked.day,
      ); // Also strip time

      final int daysDifference = selected.difference(today).inDays + 1;

      // Safety check: make sure it's not a past date
      if (daysDifference < 1) {
        showCustomSuccessToast(
          context: context,
          message: "Please select today or a future date",
          color: Colors.red,
          icon: Icons.warning,
          iconColors: Colors.white,
          positionNumber: 60,
        );
        return;
      }

      notifier.updateGateConditions(
        expireday: daysDifference.toString(),
        timeRestrictions:
            ref.read(notificationProviders).gateConditions?.timeRestrictions,
      );
    }
  }
}
