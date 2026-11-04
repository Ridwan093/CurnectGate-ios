import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValidityPickerTile extends ConsumerWidget {
  final String? selectedValue;
  final Function(String) onChanged;

  const ValidityPickerTile({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => _showHourPopup(context, ref),
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          Text(
            'Validity period*',
            style: TextStyle(
              fontWeight: FontFamilies.medium,
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black400,

              fontSize: 14,
            ),
          ),
          const Spacer(),
          Text(
            selectedValue?.isEmpty ?? false ? "hrs" : selectedValue ?? "",
            style: TextStyle(
              fontSize: 14,
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black500,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.keyboard_arrow_down_rounded),
        ],
      ),
    );
  }

  void _showHourPopup(BuildContext context, WidgetRef ref) async {
    final hours = [
      '1 hr',
      '2 hrs',
      '3 hrs',
      '6 hrs',
      '12 hrs',
      '18 hrs',
      '24 hrs',
      'Custom...',
    ];

    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + box.size.height,
        position.dx + box.size.width,
        position.dy,
      ),
      items:
          hours
              .map(
                (hour) => PopupMenuItem<String>(value: hour, child: Text(hour)),
              )
              .toList(),
    );

    if (selected != null) {
      if (selected == 'Custom...') {
        // ref.read(bottomSheetStateProvider.notifier).state =
        //     BottomSheetView.validatorcustom;
        showUserBottomSheet(
          context: context,
          headertitle: "",
          headersubtitle: "",
          ref: ref,
          bottom: BottomSheetView.validatorcustom,
          id: 0,
        );
        return; // ⭐ THIS WILL HELP A LOT
      }

      onChanged(selected);
    }
  }
}
