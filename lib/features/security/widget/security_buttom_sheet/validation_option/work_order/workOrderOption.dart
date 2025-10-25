import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/security/model/validation_model.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WorkOrderOption extends ConsumerWidget {
  const WorkOrderOption({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedType = ref.watch(oTpformProvider).selectedValidationType;
    final notifier = ref.read(oTpformProvider.notifier);

    final options = [
      ValidationOption(
        label: 'Validate Vendor Code',
        icon: AssetPaths.memberId,
      ),
      ValidationOption(label: 'Validate Workers Code', icon: ''),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                notifier.updateValidationType("");
                context.pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select to continue',
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 20,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Select an option to validate',
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  color: AppColors.instance.black300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // Option buttons
          Wrap(
            spacing: 8,
            runSpacing: 8,
            direction: Axis.horizontal,

            children:
                options
                    .map(
                      (option) => _buildValidationButton(
                        context: context,
                        icon: option.icon,
                        label: option.label,
                        isSelected: selectedType == option.label,
                        onTap:
                            () => notifier.updateValidationType(option.label),
                      ),
                    )
                    .toList(),
          ),

          const SizedBox(height: 24),

          // Continue button (disabled until selection)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:
                  selectedType!.isEmpty
                      ? null
                      : () {
                        _handleSelectionAction(context, selectedType, ref);
                      },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor:
                    selectedType.isEmpty
                        ? Colors.grey[300]
                        : AppColors.instance.black600,
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamilies.interDisplay,
                  color: selectedType.isEmpty ? Colors.grey[600] : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValidationButton({
    required String icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width / 2 - 20,
        height: 120,
        // Added margin
        decoration: BoxDecoration(
          color: AppColors.instance.grey200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.instance.black600 : Colors.grey[300]!,
            width: isSelected ? 2.5 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontFamily: FontFamilies.interDisplay,
                color:
                    isSelected
                        ? AppColors.instance.black600
                        : AppColors.instance.black300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSelectionAction(
    BuildContext context,
    String selectedType,
    WidgetRef ref,
  ) {
    final notifier = ref.read(oTpformProvider.notifier);
    switch (selectedType) {
      case 'Validate Vendor Code':
        notifier.updateValidationType("");
        context.pop();
        showUserBottomSheet(
          context: context,
          headertitle: "",
          headersubtitle: "",
          ref: ref,
          bottom: BottomSheetView.validateVendor,
        );
        break;
      case 'Validate Workers Code':
        notifier.updateValidationType("");
        context.pop();
        showUserBottomSheet(
          context: context,
          headertitle: "",
          headersubtitle: "",
          ref: ref,
          bottom: BottomSheetView.validateWorker,
        );
        break;
      case 'Validate Checkin/Checkout':
        notifier.updateValidationType("");
        context.pop();
        showUserBottomSheet(
          context: context,
          headertitle: "",
          headersubtitle: "",
          ref: ref,
          bottom: BottomSheetView.workOdervalidation,
        );
        break;
    }
  }
}
