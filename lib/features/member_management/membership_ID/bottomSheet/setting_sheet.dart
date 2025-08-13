import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/membership_ID/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildSettingsSheet extends ConsumerWidget {
  final bool isCardActive;
  const BuildSettingsSheet({super.key, required this.isCardActive});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    child: Icon(
                      Icons.block,
                      color: AppColors.instance.black600,
                    ),
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
}
