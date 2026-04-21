import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/submit_permit_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/workPermit/add_item_bottomsheet.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubmitPermitBottomSheet extends ConsumerStatefulWidget {
  final String otp;
  final int id;
  final String userName;
  final String phoneNumber;
  const SubmitPermitBottomSheet({
    super.key,
    required this.otp,
    required this.id,
    required this.phoneNumber,
    required this.userName,
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
                    padding: const EdgeInsets.only(
                      bottom: 20,
                      left: 13,
                      right: 13,
                      top: 10,
                    ),
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
                        // ReusabelProfileForm(
                        //   controller: _noteController,
                        //   fieldKey: 'note',
                        //   fieldType: FieldType.reason,
                        //   hintText: 'Enter note',
                        //   label: 'Note',
                        //   onChanged: (_) {},
                        //   onValidationChanged: (_) {},
                        // ),
                        // const SizedBox(height: 20),

                        // /// Two fields side by side
                        // ReusabelProfileForm(
                        //   controller: _contactPersonController,
                        //   fieldKey: 'contact_person',
                        //   fieldType: FieldType.name,
                        //   hintText: 'Contact Person',
                        //   label: 'Contact Person',
                        //   onChanged: (_) {},
                        //   onValidationChanged: (_) {},
                        // ),
                        // const SizedBox(height: 20),

                        // /// Description
                        // ReusabelProfileForm(
                        //   controller: _descriptionController,
                        //   fieldKey: 'General description',
                        //   fieldType: FieldType.reason,
                        //   hintText: 'Enter description of items',
                        //   label: 'General Description',
                        //   maxLines: 2,
                        //   maxLength: 30,
                        //   onChanged: (_) {},
                        //   onValidationChanged: (_) {},
                        // ),
                        AddItemBottomSheet(
                          code: widget.otp,
                          userName: widget.userName,
                          phoneNumber: widget.phoneNumber,
                          onTap: () {
                            final data = {
                              "otp_id": widget.id,
                              "items_description": "",

                              "items": items,
                              "metadata": {"notes": "", "contact_person": ""},
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
