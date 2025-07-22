import 'package:curnectgate/features/member_management/membership_ID/bottomSheet/ReGenerateMembrID.dart';
import 'package:curnectgate/features/member_management/membership_ID/bottomSheet/deActivePass.dart';
import 'package:curnectgate/features/member_management/membership_ID/bottomSheet/generateIdForStatrt.dart';
import 'package:curnectgate/features/member_management/membership_ID/bottomSheet/reActivatePass.dart';
import 'package:curnectgate/features/member_management/membership_ID/bottomSheet/setting_sheet.dart';
import 'package:curnectgate/features/member_management/membership_ID/provider/getDigitalIDProvider.dart';
import 'package:curnectgate/features/member_management/tabState/memberid_provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showBottomSheets(BuildContext context, WidgetRef ref) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Required for proper keyboard handling
    builder: (context) {
      return Padding(
        // Add padding equal to keyboard height
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Consumer(
          builder: (context, ref, _) {
            final sheetType = ref.watch(bottomSheetTypeProvider);
            final digit = ref.watch(digitMemberIDprovider).value;
            final isCardActive =
                digit?.data.digitalId.status == "active" ? true : false;

            switch (sheetType) {
              case BottomSheetType.settings:
                return BuildSettingsSheet(isCardActive: isCardActive);
              case BottomSheetType.startGenerate:
                return const Generateidforstatrt();
              case BottomSheetType.confirmation:
                return _buildConfirmationSheet(context, ref);
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      );
    },
  ).then((_) {
    ref.read(bottomSheetProvider.notifier).state = false;
    ref.read(bottomSheetTypeProvider.notifier).state = null;
  });
}

Widget _buildConfirmationSheet(BuildContext context, WidgetRef ref) {
  final action = ref.watch(confirmationActionProvider);
  if (action == ConfirmationAction.regenerate) {
    return Regeneratemembrid();
  } else if (action == ConfirmationAction.deactivate) {
    return DeactivePass();
  } else {
    return Reactivatepass();
  }
}
