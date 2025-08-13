import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/multi_select_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/overlay_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OverlayMultiSelect extends ConsumerWidget {
  final String label;
  final List<String> options;
  final bool isRequired;
  final String? providerId;
  final void Function(String?)? onChanged;
  const OverlayMultiSelect({
    super.key,
    required this.label,
    required this.options,
    this.isRequired = false,
    this.providerId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _OverlayMultiSelectContent(
      label: label,
      options: options,
      isRequired: isRequired,
      providerId: providerId,
      onChanged: onChanged,
    );
  }
}

class _OverlayMultiSelectContent extends ConsumerStatefulWidget {
  final String label;
  final List<String> options;
  final bool isRequired;
  final String? providerId;
  final void Function(String?)? onChanged;
  const _OverlayMultiSelectContent({
    required this.onChanged,
    required this.label,
    required this.options,
    required this.isRequired,
    this.providerId,
  });

  @override
  ConsumerState<_OverlayMultiSelectContent> createState() =>
      _OverlayMultiSelectContentState();
}

class _OverlayMultiSelectContentState
    extends ConsumerState<_OverlayMultiSelectContent> {
  void _showDialog() {
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 40,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              height: 400,
              child: OverlayContent(
                onChanged: widget.onChanged,
                label: widget.label,
                options: widget.options,
                providerId: widget.providerId,
                onClose: () => context.pop(),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedItems = ref.watch(
      multiSelectProvider(widget.providerId ?? widget.label),
    );
    // ref.read(formProvider.notifier).updateSpecializations(selectedItems);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isRequired)
          const Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: Text('*', style: TextStyle(color: Colors.red)),
          ),
        GestureDetector(
          onTap: _showDialog,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (selectedItems.isNotEmpty) ...[
                  Text(
                    widget.label,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                ],
                if (selectedItems.isEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select ${widget.label}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey.shade500,
                      ),
                    ],
                  )
                else
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        selectedItems.map((item) {
                          return Chip(
                            label: Text(item),
                            deleteIcon: const Icon(Icons.close, size: 16),
                            onDeleted: () {
                              widget.onChanged!(item);
                              ref
                                  .read(
                                    multiSelectProvider(
                                      widget.providerId ?? widget.label,
                                    ).notifier,
                                  )
                                  .toggleSelection(item);
                            },
                            backgroundColor: AppColors.instance.grey200
                                .withOpacity(0.2),
                            labelStyle: TextStyle(
                              color: AppColors.instance.black600,
                              fontFamily: FontFamilies.interDisplay,
                            ),
                          );
                        }).toList(),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
