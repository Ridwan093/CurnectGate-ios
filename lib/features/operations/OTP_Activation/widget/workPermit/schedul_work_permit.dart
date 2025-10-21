import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/workformprovider.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/date_picker.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/submit_permit_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item_card.dart';

class SubmitSchedulPermitBottomSheet extends ConsumerStatefulWidget {
  final String otp;
  const SubmitSchedulPermitBottomSheet(this.otp, {super.key});

  @override
  ConsumerState<SubmitSchedulPermitBottomSheet> createState() =>
      _SubmitPermitBottomSheetState();
}

class _SubmitPermitBottomSheetState
    extends ConsumerState<SubmitSchedulPermitBottomSheet> {
  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _guestNameController = TextEditingController();
  final TextEditingController _guestNumberController = TextEditingController();
  final TextEditingController _deleverCompanyController =
      TextEditingController();

  final TextEditingController _specialInfoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(schedulitemListProvider);
    final size = MediaQuery.sizeOf(context);

    final loading = ref.watch(reminderProvider).isLoading;
    final form = ref.read(formProvider.notifier);
    final notifier = ref.read(workOrderFormProvider.notifier);
    final state = ref.watch(workOrderFormProvider);
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
                          "Create Scheduled Permit",
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
                        ReusabelProfileForm(
                          controller: _guestNameController,
                          fieldKey: 'guest_name',
                          fieldType: FieldType.name,
                          hintText: 'eg, James Brdget',
                          label: 'Guest Name',
                          onChanged: (_) {},
                          onValidationChanged: (_) {},
                        ),
                        const SizedBox(height: 20),
                        ReusabelProfileForm(
                          controller: _guestNumberController,
                          fieldKey: 'guest_phone_number',
                          fieldType: FieldType.phone,
                          hintText: 'Eg, +2349138747',
                          label: 'Guest Phone Number',
                          onChanged: (_) {},
                          onValidationChanged: (_) {},
                        ),
                        const SizedBox(height: 20),
                        ReusabelProfileForm(
                          controller: _deleverCompanyController,
                          fieldKey: 'delivery_company',
                          fieldType: FieldType.itemName,
                          hintText: 'Swift Movers Ltd',
                          label: 'Delivery Company',
                          onChanged: (_) {},
                          onValidationChanged: (_) {},
                        ),

                        const SizedBox(height: 20),
                        ReusabelProfileForm(
                          controller: _specialInfoController,
                          fieldKey: 'special_instructions',
                          fieldType: FieldType.reason,
                          hintText: 'eg, call at 10 PM',
                          label: 'Special Instructions',
                          onChanged: (_) {},
                          onValidationChanged: (_) {},
                        ),
                        const SizedBox(height: 20),

                        /// Two fields side by side
                        DatePickerField(
                          label: 'Expected Date',
                          selectedDate: state.endDate,
                          initialDate:
                              state.endDate ??
                              (state.startDate ?? DateTime.now()),
                          firstDate: state.startDate ?? DateTime.now(),
                          lastDate: DateTime(2100),
                          onDateSelected: notifier.updateEndDate,
                          errorText: state.endDateError,
                          buttonColor:
                              AppColors
                                  .instance
                                  .black600, // Custom button color
                          selectionColor:
                              AppColors
                                  .instance
                                  .teal300, // Custom selection color
                          textColor:
                              AppColors.instance.black600, // Custom text color
                        ),
                        // ReusabelProfileForm(
                        //         controller: _expectedDateController,
                        //         fieldKey: 'expected_date',
                        //         fieldType: FieldType.year,
                        //         hintText: '2025-10-15',
                        //         label: 'Expected Date',
                        //         onChanged: (_) {},
                        //         onValidationChanged: (_) {},
                        //       ),
                        const SizedBox(height: 20),

                        /// Description
                        ReusabelProfileForm(
                          controller: _descriptionController,
                          fieldKey: 'General description',
                          fieldType: FieldType.reason,
                          hintText: 'Enter description of items',
                          label: 'General Description',
                          maxLines: 2,
                          maxLength: 100,
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
                              bottom: BottomSheetView.schedulpermitItem,
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
                                                    schedulitemListProvider
                                                        .notifier,
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
                                      _guestNumberController.text.isNotEmpty &&
                                      _guestNameController.text.isNotEmpty &&
                                      _descriptionController.text.length > 20 &&
                                      _guestNameController.text.length > 2 &&
                                      _guestNumberController.text.length > 9 &&
                                      _deleverCompanyController
                                          .text
                                          .isNotEmpty &&
                                      _specialInfoController.text.isNotEmpty &&
                                      state.endDate != null &&
                                      _deleverCompanyController.text.length >
                                          2 &&
                                      _specialInfoController.text.length > 2
                                  ? 1
                                  : 0,
                          duration: const Duration(milliseconds: 400),
                          child: Visibility(
                            visible: items.isNotEmpty,
                            child: InkWell(
                              onTap:
                                  items.isNotEmpty &&
                                          _descriptionController
                                              .text
                                              .isNotEmpty &&
                                          _guestNumberController
                                              .text
                                              .isNotEmpty &&
                                          _guestNameController
                                              .text
                                              .isNotEmpty &&
                                          _descriptionController.text.length >
                                              20 &&
                                          _guestNameController.text.length >
                                              2 &&
                                          _guestNumberController.text.length >
                                              9 &&
                                          _deleverCompanyController
                                              .text
                                              .isNotEmpty &&
                                          _specialInfoController
                                              .text
                                              .isNotEmpty &&
                                          state.endDate != null &&
                                          _deleverCompanyController
                                                  .text
                                                  .length >
                                              2 &&
                                          _specialInfoController.text.length > 2
                                      ? () {
                                        final data = {
                                          "otp_id": widget.otp,
                                          "guest_phone_number":
                                              _guestNumberController.text
                                                  .trim(),
                                          "guest_name":
                                              _guestNameController.text.trim(),

                                          "items_description":
                                              _descriptionController.text
                                                  .trim(),

                                          "items": items,
                                          "metadata": {
                                            "delivery_company":
                                                _deleverCompanyController.text
                                                    .trim(),
                                            "expected_date":
                                                state.endDate.toString(),

                                            "special_instructions":
                                                _specialInfoController.text
                                                    .trim(),
                                          },
                                          // "metadata": {
                                          //   "notes": _noteController.text.trim(),
                                          //   "contact_person":
                                          //       _contactPersonController.text.trim(),
                                          // },
                                        };
                                        form.addPermitToActiveOTP(
                                          context: context,
                                          requestData: data,
                                          ref: ref,
                                        );
                                        debugPrint("SUBMIT PERMIT DATA: $data");
                                        // items.clear();

                                        _descriptionController.clear();

                                        _deleverCompanyController.clear();
                                        _guestNameController.clear();
                                        _specialInfoController.clear();
                                        _guestNumberController.clear();
                                      }
                                      : null,
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
