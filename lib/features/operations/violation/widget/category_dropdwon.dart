import 'dart:developer';

import 'package:curnectgate/features/operations/violation/model/getCategory_model.dart'
    show Category, CategoryData;
import 'package:curnectgate/features/operations/violation/report_provider/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final String value;
  final String Function(T) itemText;
  final void Function(T?) onChanged;
  final String hint;
  final String label;
  final EdgeInsetsGeometry? padding;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.itemText,
    required this.onChanged,
    required this.hint,
    required this.label,
    this.padding,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _toggleOverlay() {
    if (_isOpen) {
      _removeOverlay();
    } else {
      _addOverlay();
    }
    setState(() => _isOpen = !_isOpen);
  }

  void _addOverlay() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder:
          (context) => GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _toggleOverlay,
            child: Stack(
              children: [
                Positioned(
                  width: size.width,
                  child: CompositedTransformFollower(
                    link: _layerLink,
                    showWhenUnlinked: false,
                    offset: Offset(0, size.height + 5),
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(4),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 200,
                          minWidth: size.width,
                        ),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children:
                              widget.items.map((item) {
                                return InkWell(
                                  onTap: () {
                                    widget.onChanged(item);
                                    _toggleOverlay();
                                  },
                                  child: Container(
                                    width: size.width,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    child: Text(
                                      widget.itemText(item),
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _toggleOverlay,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.value.isNotEmpty ? widget.value : widget.hint,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color:
                              // ignore: unnecessary_null_comparison
                              widget.value.isNotEmpty
                                  ? Colors.black
                                  : Colors.grey,
                        ),
                      ),
                    ),
                    Icon(
                      _isOpen
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryDropdown extends ConsumerWidget {
  final String? currentValue;
  final CategoryData data;

  const CategoryDropdown({
    super.key,
    required this.currentValue,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Filter out null categories and IDs
    // ignore: unnecessary_null_comparison
    final categories = data.categories.where((c) => c.id != null).toList();

    // Find the selected category (using our extension method)

    return CustomDropdown<Category>(
      items: categories,
      value: currentValue ?? "",
      itemText: (category) => category.name,
      onChanged: (category) {
        if (category != null) {
          log(category.name);
          ref
              .read(reportProvider.notifier)
              .setCategory(category.name.toString(), category.id.toString());
        }
      },
      hint: 'Select category',
      label: 'Category',
    );
  }
}
