import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/submit_permit_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item_card.dart';

class SubmitPermitBottomSheet extends ConsumerStatefulWidget {
  final String otp;
  final int id;
  const SubmitPermitBottomSheet({
    super.key,
    required this.otp,
    required this.id,
  });

  @override
  ConsumerState<SubmitPermitBottomSheet> createState() =>
      _SubmitPermitBottomSheetState();
}

class _SubmitPermitBottomSheetState
    extends ConsumerState<SubmitPermitBottomSheet> {
  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _contactPersonController =
      TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(itemListProvider);
    final size = MediaQuery.sizeOf(context);

    final loading = ref.watch(reminderProvider).isLoading;
    final form = ref.read(formProvider.notifier);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () => Navigator.of(context).pop(),
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
                        const SizedBox(height: 30),
                        Text(
                          "Create Clearance Permit",
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontWeight: FontFamilies.bold,
                            fontSize: 18,
                            color: AppColors.instance.black600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Grant access for guest and family',
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 13,
                            color: AppColors.instance.black300,
                          ),
                        ),
                        const SizedBox(height: 25),

                        /// Note field
                        ReusabelProfileForm(
                          controller: _noteController,
                          fieldKey: 'note',
                          fieldType: FieldType.reason,
                          hintText: 'Enter note',
                          label: 'Note',
                          onChanged: (_) {},
                          onValidationChanged: (_) {},
                        ),
                        const SizedBox(height: 20),

                        /// Two fields side by side
                        ReusabelProfileForm(
                          controller: _contactPersonController,
                          fieldKey: 'contact_person',
                          fieldType: FieldType.name,
                          hintText: 'Contact Person',
                          label: 'Contact Person',
                          onChanged: (_) {},
                          onValidationChanged: (_) {},
                        ),
                        const SizedBox(height: 20),

                        /// Description
                        ReusabelProfileForm(
                          controller: _descriptionController,
                          fieldKey: 'General description',
                          fieldType: FieldType.reason,
                          hintText: 'Enter description of items',
                          label: 'General Description',
                          maxLines: 2,
                          maxLength: 30,
                          onChanged: (_) {},
                          onValidationChanged: (_) {},
                        ),

                        const SizedBox(height: 16),

                        /// Add item button
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.instance.teal300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            showUserBottomSheet(
                              context: context,
                              headertitle: "",
                              headersubtitle: "",
                              ref: ref,
                              bottom: BottomSheetView.addpermitItems,
                              id: 0,
                            );
                          },
                          icon: const Icon(Icons.add, color: Colors.white),
                          label: Text(
                            "Add Item",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: FontFamilies.interDisplay,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// Item list
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child:
                              items.isEmpty
                                  ? Center(
                                    child: Text(
                                      "No items added yet.",
                                      style: TextStyle(
                                        fontFamily: FontFamilies.interDisplay,
                                        color: AppColors.instance.black300,
                                      ),
                                    ),
                                  )
                                  : SizedBox(
                                    height: 110,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: items.length,
                                      itemBuilder:
                                          (context, index) => ItemCard(
                                            item: items[index],
                                            onRemove: () {
                                              ref
                                                  .read(
                                                    itemListProvider.notifier,
                                                  )
                                                  .state = List.from(items)
                                                ..removeAt(index);
                                            },
                                          ),
                                    ),
                                  ),
                        ),

                        const SizedBox(height: 25),

                        /// Submit button (only when items exist)
                        AnimatedOpacity(
                          opacity:
                              items.isNotEmpty &&
                                      _descriptionController.text.isNotEmpty &&
                                      _contactPersonController
                                          .text
                                          .isNotEmpty &&
                                      _noteController.text.isNotEmpty &&
                                      _descriptionController.text.length > 9 &&
                                      _noteController.text.length > 9 &&
                                      _contactPersonController.text.length > 2
                                  ? 1
                                  : 0,
                          duration: const Duration(milliseconds: 400),
                          child: Visibility(
                            visible: items.isNotEmpty,
                            child: InkWell(
                              onTap: () {
                                final data = {
                                  "otp_id": widget.id,
                                  "items_description":
                                      _descriptionController.text.trim(),

                                  "items": items,
                                  "metadata": {
                                    "notes": _noteController.text.trim(),
                                    "contact_person":
                                        _contactPersonController.text.trim(),
                                  },
                                };
                                form.addPermitToActiveOTP(
                                  context: context,
                                  requestData: data,
                                  ref: ref,
                                );
                                debugPrint("SUBMIT PERMIT DATA: $data");
                                // items.clear();
                                _contactPersonController.clear();
                                _descriptionController.clear();

                                _noteController.clear();
                              },
                              child: Container(
                                width: size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.instance.black600,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Center(
                                  child: Text(
                                    "Submit Permit",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: FontFamilies.interDisplay,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (loading) Positioned.fill(child: _buildOverlayLoading()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildOverlayLoading() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white24.withOpacity(.9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Loadingstates(),
    );
  }
}
