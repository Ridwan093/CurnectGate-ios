import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HoursAndDays extends ConsumerWidget {
  final String selectedValue;
  final String title;
  final List<String> items;

  final Function(String) onChanged;

  const HoursAndDays({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.items,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () => _showHourPopup(context, ref, items),
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontFamilies.medium,
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black400,
      
                fontSize: 14,
              ),
            ),
            const Spacer(),
            Text(
              selectedValue.isEmpty ? "__.__" : selectedValue,
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
      ),
    );
  }

  void _showHourPopup(
    BuildContext context,
    WidgetRef ref,
    List<String> hours,
  ) async {
    // final hours = [
    //   '1 hr',
    //   '2 hrs',
    //   '3 hrs',
    //   '6 hrs',
    //   '12 hrs',
    //   '18 hrs',
    //   '24 hrs',
    //   'Custom...',
    // ];

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
      // if (selected == 'Custom...') {
      //   ref.read(bottomSheetStateProvider.notifier).state =
      //       BottomSheetView.validatorcustom;
      // }
      onChanged(selected);
    }
  }
}
