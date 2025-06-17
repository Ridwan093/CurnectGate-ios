import 'dart:math';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/member_management/tabState/memberid_provider/provider.dart';
import 'package:curnectgate/features/member_management/widget/customtoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showBottomSheets(BuildContext context, WidgetRef ref) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Consumer(
        builder: (context, ref, _) {
          final sheetType = ref.watch(bottomSheetTypeProvider);
          final isCardActive = ref.watch(cardStatusProvider);

          switch (sheetType) {
            case BottomSheetType.settings:
              return _buildSettingsSheet(context, ref, isCardActive);
            case BottomSheetType.confirmation:
              return _buildConfirmationSheet(context, ref);
            default:
              return const SizedBox.shrink();
          }
        },
      );
    },
  ).then((_) {
    ref.read(bottomSheetProvider.notifier).state = false;
    ref.read(bottomSheetTypeProvider.notifier).state = null;
  });
}

Widget _buildSettingsSheet(
  BuildContext context,
  WidgetRef ref,
  bool isCardActive,
) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close, color: AppColors.instance.black600),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          isCardActive ? 'Digital ID Settings' : 'Select option',
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black600,
            fontSize: 19,
          ),
        ),
        Text(
          'Manage Entry Pass',
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.medium,
            color: AppColors.instance.black300,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 35),

        // Regenerate Code Option
        InkWell(
          onTap: () {
            ref.read(confirmationActionProvider.notifier).state =
                ConfirmationAction.regenerate;
            ref.read(bottomSheetTypeProvider.notifier).state =
                BottomSheetType.confirmation;
          },
          child: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(color: AppColors.instance.grey300),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.instance.grey400,
                  child: Icon(
                    Icons.refresh,
                    color: AppColors.instance.black600,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Regenerate Code',
                  style: TextStyle(
                    fontWeight: FontFamilies.bold,
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 5),

        // Deactivate/Activate Pass Option
        InkWell(
          onTap: () {
            ref.read(confirmationActionProvider.notifier).state =
                isCardActive
                    ? ConfirmationAction.deactivate
                    : ConfirmationAction.activate;
            ref.read(bottomSheetTypeProvider.notifier).state =
                BottomSheetType.confirmation;
          },
          child: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(color: AppColors.instance.grey300),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.instance.grey400,
                  child: Icon(Icons.block, color: AppColors.instance.black600),
                ),
                const SizedBox(width: 10),
                Text(
                  isCardActive ? 'Deactivate Pass' : 'Reactivate Pass',
                  style: TextStyle(
                    fontWeight: FontFamilies.bold,
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
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

Widget _buildConfirmationSheet(BuildContext context, WidgetRef ref) {
  final action = ref.watch(confirmationActionProvider);

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),

    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close, color: AppColors.instance.black600),
          ),
        ),
        const SizedBox(height: 10),

        // Dynamic content based on action
        if (action == ConfirmationAction.regenerate)
          _buildRegenerateConfirmation(context, ref)
        else if (action == ConfirmationAction.deactivate)
          _buildDeactivateConfirmation(context, ref)
        else
          _buildActivateConfirmation(context, ref),
      ],
    ),
  );
}

Widget _buildRegenerateConfirmation(BuildContext context, WidgetRef ref) {
  return Column(
    children: [
      const Icon(Icons.autorenew, size: 48, color: Colors.blue),
      const SizedBox(height: 20),
      Text(
        'Regenerate Code?',
        style: TextStyle(
          fontSize: 18,
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black600,
          fontWeight: FontFamilies.bold,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Text(
          'This will generate a new access code. Your old code will no longer work.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black300,
            fontWeight: FontFamilies.medium,
          ),
        ),
      ),
      const SizedBox(height: 30),
      ActionButton(
        onPressed: () {
          ref.read(accessCodeProvider.notifier).state = _generateRandomCode();
          Navigator.pop(context);
          showCustomSuccessToast(
            positionNumber: 70,
            context: context,
            message: 'New code generated successfully',
            color: AppColors.instance.teal300,
            icon: Icons.check_circle,
            iconColors: AppColors.instance.black600,
          );
        },
        label: 'Regenerate',
      ),
      const SizedBox(height: 5),
    ],
  );
}

Widget _buildDeactivateConfirmation(BuildContext context, WidgetRef ref) {
  return Column(
    children: [
      const SizedBox(height: 20),
      Text(
        'Deactivate Pass?',
        style: TextStyle(
          fontSize: 18,
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black600,
          fontWeight: FontFamilies.bold,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Text(
          'Are you sure you want to deactivate your pass? ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black300,
            fontWeight: FontFamilies.medium,
          ),
        ),
      ),
      const SizedBox(height: 30),
      ActionButton(
        onPressed: () {
          ref.read(cardStatusProvider.notifier).state = false;
          Navigator.pop(context);
          showCustomSuccessToast(
            positionNumber: 70,
            context: context,
            message: 'Pass deactivated',
            color: AppColors.instance.teal300,
            icon: Icons.check_circle,
            iconColors: AppColors.instance.black600,
          );
        },
        label: 'Deactivate Pass',
      ),
      const SizedBox(height: 5),
    ],
  );
}

Widget _buildActivateConfirmation(BuildContext context, WidgetRef ref) {
  return Column(
    children: [
      const SizedBox(height: 20),
      Text(
        'Reactivate Pass?',
        style: TextStyle(
          fontSize: 18,
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black600,
          fontWeight: FontFamilies.bold,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Text(
          'Are you sure you want to reactive pass?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black300,
            fontWeight: FontFamilies.medium,
          ),
        ),
      ),
      const SizedBox(height: 30),
      ActionButton(
        onPressed: () {
          ref.read(cardStatusProvider.notifier).state = true;
          Navigator.pop(context);
          showCustomSuccessToast(
            positionNumber: 70,
            context: context,
            message: 'Pass reactivated',
            color: AppColors.instance.teal300,
            icon: Icons.check_circle,
            iconColors: AppColors.instance.black600,
          );
        },
        label: 'Reactivate Pass',
      ),
      const SizedBox(height: 5),
    ],
  );
}

String _generateRandomCode() {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();
  return List.generate(
    5,
    (index) => chars[random.nextInt(chars.length)],
  ).join();
}
