import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/submit_permit_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddItemBottomSheet extends ConsumerStatefulWidget {
  const AddItemBottomSheet({super.key});

  @override
  ConsumerState<AddItemBottomSheet> createState() => _AddItemBottomSheetState();
}

class _AddItemBottomSheetState extends ConsumerState<AddItemBottomSheet> {
  final TextEditingController _itemName = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  final TextEditingController _description = TextEditingController();

  final TextEditingController _category = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () => context.pop(),
              child: Text(
                "Close",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 14,
                  color: AppColors.instance.teal400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            "Add Item",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              fontSize: 18,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Add details and information about the item",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 13,
              color: AppColors.instance.black300,
            ),
          ),
          const SizedBox(height: 25),

          // 🧾 Item Fields
          ReusabelProfileForm(
            controller: _itemName,
            fieldKey: 'item_name',
            fieldType: FieldType.itemName,
            hintText: 'Enter item name',
            label: 'Item Name',
            onChanged: (_) {},
            onValidationChanged: (_) {},
          ),
          const SizedBox(height: 8),
          ReusabelProfileForm(
            controller: _quantity,
            fieldKey: 'quantity',
            fieldType: FieldType.year,
            hintText: 'Enter quantity',
            label: 'Quantity',
            onChanged: (_) {},
            onValidationChanged: (_) {},
          ),

          const SizedBox(height: 8),
          ReusabelProfileForm(
            controller: _category,
            fieldKey: 'item_category',
            fieldType: FieldType.itemName,
            hintText: 'Enter category',
            label: 'Item Category',
            onChanged: (_) {},
            onValidationChanged: (_) {},
          ),
          const SizedBox(height: 8),
          ReusabelProfileForm(
            controller: _description,
            fieldKey: 'description',
            fieldType: FieldType.reason,
            hintText: 'Enter description',
            label: 'Description',
            maxLines: 2,
            onChanged: (_) {},
            onValidationChanged: (_) {},
          ),
          const SizedBox(height: 25),

          // ➕ Add Item Button
          InkWell(
            onTap:
                _itemName.text.trim().isNotEmpty &&
                        _quantity.text.trim().isNotEmpty &&
                        _description.text.trim().isNotEmpty &&
                        _category.text.trim().isNotEmpty
                    ? () {
                      final newItem = {
                        "item_name": _itemName.text.trim(),
                        "quantity": int.tryParse(_quantity.text.trim()) ?? 1,
                        "description": _description.text.trim(),

                        "item_category": _category.text.trim(),
                      };

                      final list = ref.read(itemListProvider);
                      ref.read(itemListProvider.notifier).state = [
                        ...list,
                        newItem,
                      ];
                      context.pop();
                    }
                    : null,
            child: Container(
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color:
                    _itemName.text.trim().isNotEmpty &&
                            _quantity.text.trim().isNotEmpty &&
                            _description.text.trim().isNotEmpty &&
                            _category.text.trim().isNotEmpty &&
                            _description.text.trim().length > 10 &&
                            _category.text.trim().length > 5 &&
                            _itemName.text.trim().length > 5
                        ? AppColors.instance.black600
                        : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(14),
              ),

              child: Center(
                child: Text("Add Item", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
