import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/submit_permit_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/workPermit/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddItemBottomSheet extends ConsumerStatefulWidget {
  final String code;
  final String userName;
  final String phoneNumber;
  final VoidCallback onTap;
  const AddItemBottomSheet({
    super.key,
    required this.code,
    required this.userName,
    required this.phoneNumber,
    required this.onTap,
  });

  @override
  ConsumerState<AddItemBottomSheet> createState() => _AddItemBottomSheetState();
}

class _AddItemBottomSheetState extends ConsumerState<AddItemBottomSheet> {
  final TextEditingController _itemName = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  final TextEditingController _description = TextEditingController();

  // final TextEditingController _category = TextEditingController();
  bool get _isValid {
    return _itemName.text.isNotEmpty &&
        _quantity.text.isNotEmpty &&
        _description.text.length > 4 &&
        _itemName.text.length > 4;
  }

  @override
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(itemListProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusabelProfileForm(
          controller: _itemName,
          fieldKey: 'item_name',
          fieldType: FieldType.itemName,
          hintText: 'Enter item name',
          label: 'Item Name',
          onChanged: (_) {},
          // onChanged: (_) => setState(() {}),
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
          // onChanged: (_) => setState(() {}),
          onValidationChanged: (_) {},
        ),
        const SizedBox(height: 8),

        // ReusabelProfileForm(
        //   controller: _category,
        //   fieldKey: 'item_category',
        //   fieldType: FieldType.itemName,
        //   hintText: 'Enter category',
        //   label: 'Item Category',
        //   onChanged: (_) {},
        //   // onChanged: (_) => setState(() {}),
        //   onValidationChanged: (_) {},
        // ),
        // const SizedBox(height: 8),
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
        if (_isValid) const SizedBox(height: 15),
        Align(
          alignment: Alignment.centerRight,
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
        if (_isValid) const SizedBox(height: 10),
        if (items.isNotEmpty) ...[
          _buildItemExitCard(),
          const SizedBox(height: 15),
          _buildClearanceSummary(),
        ],
      ],
    );
  }

  Widget _buildFloatingAddButton() {
    return InkWell(
      onTap: !_isValid ? null : _handleAddItem,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          color: AppColors.instance.black600,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.18),
              blurRadius: 14,
              spreadRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 26),
      ),
    );
  }

  Widget _buildItemData(WidgetRef ref) {
    final items = ref.watch(itemListProvider);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: 200,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildheader(),
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: items.length,
                itemBuilder:
                    (context, index) => ItemCard(
                      item: items[index],
                      onRemove: () {
                        ref.read(itemListProvider.notifier).state = List.from(
                          items,
                        )..removeAt(index);
                      },
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemExitCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          style: BorderStyle.solid,
          color: AppColors.instance.black400,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildvendorcardHead(),
                SizedBox(height: 10),
                _buildItemData(ref),
                SizedBox(height: 10),
                _buildLinkExit(),
                SizedBox(height: 10),
                _buildVisitorName(widget.userName, widget.phoneNumber),
                SizedBox(height: 10),
                _buildVisitorCod(widget.code),
              ],
            ),
          ),
          SizedBox(height: 10),
          _buildInof(),
        ],
      ),
    );
  }

  Widget _buildClearanceSummary() {
    final items = ref.watch(itemListProvider);
    final isEnabled = items.isNotEmpty;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.instance.black400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          /// LEFT CONTENT — flexible but safe
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "CLEARANCE SUMMARY",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black500,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 6),

                /// SAFE info row (no Wrap, no intrinsic)
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "${items.length} Items",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.black600,
                          fontSize: 12,
                          fontWeight: FontFamilies.bold,
                        ),
                      ),
                    ),

                    const SizedBox(width: 6),

                    Container(
                      width: 1,
                      height: 12,
                      color: AppColors.instance.black600,
                    ),

                    const SizedBox(width: 6),

                    /// visitor text constrained
                    Expanded(
                      child: Text(
                        "Visitor: ${widget.userName}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.black400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          /// BUTTON — intrinsic safe
          _SubmitButton(isEnabled: isEnabled, onTap: widget.onTap),
        ],
      ),
    );
  }

  Widget _buildInof() {
    return Container(
      padding: EdgeInsets.only(left: 8, top: 10, bottom: 5, right: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.hourglass_empty,
            size: 18,
            color: AppColors.instance.yellow600,
          ),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              "This clearance permit must match the visitor exit code at the security gate before items are released.",
              maxLines: 2,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black500,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkExit() {
    return Row(
      children: [
        SizedBox(width: 30, child: Divider(color: AppColors.instance.black300)),
        SizedBox(width: 8),
        Text(
          "Link Exit Code",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 12,
            color: AppColors.instance.black600,
          ),
        ),
        SizedBox(width: 8),
        Expanded(child: Divider(color: AppColors.instance.black300)),
      ],
    );
  }

  Widget _buildVisitorName(String name, String number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.person_2,
                color: AppColors.instance.black600,
                size: 18,
              ),
              SizedBox(width: 5),
              Flexible(
                child: Text(
                  "Visitor: $name",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 12,
                    color: AppColors.instance.black600,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 30),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.mobile_screen_share,
                color: AppColors.instance.black600,
                size: 15,
              ),

              Flexible(
                child: Text(
                  number,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVisitorCod(String code) {
    return Row(
      children: [
        Icon(Icons.person_2, color: Colors.white, size: 18),
        SizedBox(width: 5),
        Flexible(
          child: Text(
            "Exit Code: $code",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              color: AppColors.instance.black600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildvendorcardHead() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: AppColors.instance.teal500,
          child: Icon(Icons.done, color: Colors.white, size: 14),
        ),
        const SizedBox(width: 10),
        Expanded(
          // ← Critical: name takes remaining space
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Item Exit Authorization",
                overflow: TextOverflow.ellipsis,

                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontWeight.bold,
                  color: AppColors.instance.black600,
                  fontSize: 18,
                ),
              ),
              Text(
                "Authorizes approved visitor/vendor to exit estate with listed items.",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,

                  color: AppColors.instance.black300,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildheader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        CircleAvatar(
          radius: 8,
          backgroundColor: AppColors.instance.teal500,
          child: Icon(Icons.done, color: Colors.white, size: 14),
        ),
        const SizedBox(width: 10),
        Expanded(
          // ← Critical: name takes remaining space
          child: Text(
            "Items Authorized",
            overflow: TextOverflow.ellipsis,

            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontWeight.bold,
              color: AppColors.instance.black600,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  void _handleAddItem() {
    final newItem = {
      "item_name": _itemName.text,
      "quantity": int.tryParse(_quantity.text) ?? 1,
      "description": _description.text,
      // "item_category": "Phones",
    };

    final list = ref.read(itemListProvider);
    ref.read(itemListProvider.notifier).state = [...list, newItem];
    _itemName.clear();
    _quantity.clear();
    _description.clear();
  }
}

class _SubmitButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onTap;
  const _SubmitButton({required this.isEnabled, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isEnabled ? 1 : 0.5,
      child: Material(
        color: isEnabled ? AppColors.instance.black600 : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: isEnabled ? onTap : null,
          borderRadius: BorderRadius.circular(10),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Text(
              "Submit for Approval",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
