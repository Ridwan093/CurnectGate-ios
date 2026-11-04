import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/multi_select_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverlayContent extends ConsumerWidget {
  final String label;
  final List<String> options;
  final String? providerId;
  final VoidCallback onClose;
  final void Function(String?)? onChanged;

  const OverlayContent({
    super.key,
    required this.label,

    required this.options,
    this.providerId,
    required this.onClose,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(multiSelectProvider(providerId ?? label));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select $label',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontFamilies.bold,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: onClose,
                iconSize: 20,
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (_, index) {
              final item = options[index];
              final isSelected = selectedItems.contains(item);

              return InkWell(
                onTap: () {
                  onChanged!(item);
                  ref
                      .read(multiSelectProvider(providerId ?? label).notifier)
                      .toggleSelection(item);
                },
                child: Container(
                  color:
                      isSelected
                          ? AppColors.instance.teal300.withOpacity(0.1)
                          : null,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isSelected,
                        onChanged: (_) {
                          log(providerId ?? label);
                          ref
                              .read(
                                multiSelectProvider(
                                  providerId ?? label,
                                ).notifier,
                              )
                              .toggleSelection(item);
                        },
                        activeColor: AppColors.instance.teal300,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item,
                          style: TextStyle(
                            color:
                                isSelected
                                    ? AppColors.instance.teal300
                                    : Colors.black,
                            fontWeight:
                                isSelected
                                    ? FontWeight.w500
                                    : FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
