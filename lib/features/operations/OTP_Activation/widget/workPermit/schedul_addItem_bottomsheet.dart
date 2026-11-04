import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/submit_permit_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SchedulAddItemBottomSheet extends ConsumerStatefulWidget {
  const SchedulAddItemBottomSheet({super.key});

  @override
  ConsumerState<SchedulAddItemBottomSheet> createState() =>
      _AddItemBottomSheetState();
}

class _AddItemBottomSheetState
    extends ConsumerState<SchedulAddItemBottomSheet> {
  final TextEditingController _itemName = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  final TextEditingController _description = TextEditingController();

  final TextEditingController _category = TextEditingController();
  bool get _isValid {
    return _itemName.text.isNotEmpty &&
        _quantity.text.isNotEmpty &&
        _itemName.text.length > 4;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// ✅ SCROLLABLE FORM
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusabelProfileForm(
                controller: _itemName,
                fieldKey: 'item_name',
                fieldType: FieldType.itemName,
                hintText: 'Enter item name',
                label: 'Item Name',
                onChanged: (_) => setState(() {}),
                onValidationChanged: (_) {},
              ),
              const SizedBox(height: 8),

              ReusabelProfileForm(
                controller: _quantity,
                fieldKey: 'quantity',
                fieldType: FieldType.year,
                hintText: 'Enter quantity',
                label: 'Quantity',
                onChanged: (_) => setState(() {}),
                onValidationChanged: (_) {},
              ),
              const SizedBox(height: 8),

              ReusabelProfileForm(
                controller: _category,
                fieldKey: 'item_category',
                fieldType: FieldType.itemName,
                hintText: 'Enter category',
                label: 'Item Category',
                onChanged: (_) => setState(() {}),
                onValidationChanged: (_) {},
              ),

              // const SizedBox(height: 8),

              // ReusabelProfileForm(
              //   controller: _description,
              //   fieldKey: 'description',
              //   fieldType: FieldType.reason,
              //   hintText: 'Enter description',
              //   label: 'Description',
              //   maxLines: 2,
              //   onChanged: (_) => setState(() {}),
              //   onValidationChanged: (_) {},
              // ),
              const SizedBox(height: 40),
            ],
          ),
        ),

        /// 🚀 PREMIUM FLOATING ADD BUTTON
        Positioned(
          right: 16,
          bottom: 16,
          child: AnimatedScale(
            scale: _isValid ? 1 : 0,
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutBack,
            child: AnimatedOpacity(
              opacity: _isValid ? 1 : 0,
              duration: const Duration(milliseconds: 180),
              child: _buildFloatingAddButton(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingAddButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: !_isValid ? null : _handleAddItem,
        borderRadius: BorderRadius.circular(30),
        child: Ink(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: AppColors.instance.black600,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.18),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 26),
        ),
      ),
    );
  }

  void _handleAddItem() {
    log("Start-------?");
    final newItem = {
      "item_name": _itemName.text,
      "quantity": int.tryParse(_quantity.text) ?? 1,
      "description": _description.text,
      "item_category": _category.text,
    };

    final list = ref.read(schedulitemListProvider);
    ref.read(schedulitemListProvider.notifier).state = [...list, newItem];
    log("End-------?");
  }
}
