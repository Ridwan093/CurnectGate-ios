import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedmarkProvider = StateProvider<List<String>>((ref) => []);

class MarkButtonCheck extends ConsumerWidget {
  final String title;

  const MarkButtonCheck({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilters = ref.watch(selectedmarkProvider);
    final isSelected = selectedFilters.contains(title);

    final size = MediaQuery.sizeOf(context);

    return InkWell(
      onTap: () {
        final notifier = ref.read(selectedmarkProvider.notifier);
        if (isSelected) {
          // Remove item from selected list
          notifier.state = [...selectedFilters]..remove(title);
        } else {
          // Add item to selected list
          notifier.state = [...selectedFilters, title];
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 4),
        height: 60,
        color: AppColors.instance.grey300,
        width: size.width,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 13,
              fontWeight: FontFamilies.bold,
            ),
          ),
          leading: Container(
            height: 25,
            width: 25,

            decoration: BoxDecoration(
              color:
                  isSelected
                      ? AppColors.instance.teal300
                      : AppColors.instance.grey500,
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                isSelected
                    ? Icon(
                      Icons.check,
                      color: AppColors.instance.black600,
                      size: 17,
                    )
                    : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
