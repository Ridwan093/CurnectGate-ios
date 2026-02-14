import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/workformprovider.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/date_picker.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/work_drop_down.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreatEvent extends ConsumerStatefulWidget {
  const CreatEvent({super.key});

  @override
  ConsumerState<CreatEvent> createState() => _SubmitPermitBottomSheetState();
}

class _SubmitPermitBottomSheetState extends ConsumerState<CreatEvent> {
  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _eventTitleController = TextEditingController();
  final TextEditingController _guestNumberController = TextEditingController();
  final TextEditingController _sepecialInstructionController =
      TextEditingController();
  final now = DateTime.now();
  final TextEditingController _eventLocationController =
      TextEditingController();

  final List<String> event_type = [
    "Party",
    "Wedding",
    "Meeting",
    "Ceremony",
    "Gathering",
    "Other",
  ];

  bool isPermitFormValid({
    required TextEditingController descriptionController,
    required TextEditingController guestNumberController,
    required TextEditingController eventTitleController,
    required TextEditingController specialInstructionController,
    required TextEditingController eventLocationController,
    required dynamic startDate,
    required dynamic endDate,
    required dynamic workType,
  }) {
    return descriptionController.text.trim().isNotEmpty &&
        guestNumberController.text.trim().isNotEmpty &&
        eventTitleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().length > 9 &&
        eventTitleController.text.trim().length > 5 &&
        specialInstructionController.text.trim().isNotEmpty &&
        eventLocationController.text.trim().isNotEmpty &&
        specialInstructionController.text.trim().length > 5 &&
        eventLocationController.text.trim().length > 5 &&
        startDate != null &&
        endDate != null &&
        workType != null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final notifier = ref.read(workOrderFormProvider.notifier);
    final state = ref.watch(workOrderFormProvider);
    final loading = ref.watch(reminderProvider).isLoading;
    final form = ref.read(formProvider.notifier);

    return PopScope(
      canPop: true, // allow system back
      onPopInvoked: (didPop) {
        if (!didPop) return;

        final reminderNotifier = ref.read(reminderProvider.notifier);

        reminderNotifier.updateLoading(false);
        notifier.updateEndDate(null);
        notifier.updateStartDate(null);
        notifier.updateWorkType("", 0);
      },
      child: SafeArea(
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
                              onTap: () {
                                context.pop();
                                ref
                                    .read(reminderProvider.notifier)
                                    .updateLoading(false);
                                notifier.updateEndDate(null);
                                notifier.updateStartDate(null);
                                notifier.updateWorkType("", 0);
                              },
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
                            "Request Event code",
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              fontWeight: FontFamilies.bold,
                              fontSize: 18,
                              color: AppColors.instance.black600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Request event code for your upcoming party',
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              fontSize: 13,
                              color: AppColors.instance.black300,
                            ),
                          ),
                          const SizedBox(height: 25),
                          ReusabelProfileForm(
                            controller: _eventTitleController,
                            fieldKey: 'event_title',
                            fieldType: FieldType.itemName,
                            hintText: 'eg, Birthday Party',
                            label: 'Event Title',
                            onChanged: (_) {},
                            onValidationChanged: (_) {},
                          ),
                          const SizedBox(height: 20),

                          WorkDropDown(
                            label: "Event Type",
                            workTypes: event_type,
                            onChanged: (value) {
                              notifier.updateWorkType(value, 0);
                            },
                          ),
                          const SizedBox(height: 20),
                          ReusabelProfileForm(
                            controller: _eventLocationController,
                            fieldKey: 'event_location',
                            fieldType: FieldType.itemName,
                            hintText: 'eg, Block A, House 12 Backyard',
                            label: 'Event Location',
                            onChanged: (_) {},
                            onValidationChanged: (_) {},
                          ),
                          const SizedBox(height: 20),
                          ReusabelProfileForm(
                            controller: _guestNumberController,
                            fieldKey: 'expected_guests',
                            fieldType: FieldType.year,
                            hintText: 'eg, 50',
                            label: 'Expected Guests',
                            onChanged: (_) {},
                            onValidationChanged: (_) {},
                          ),
                          const SizedBox(height: 20),

                          /// Two fields side by side
                          Row(
                            children: [
                              Expanded(
                                child: DatePickerField(
                                  label: 'Start Date',
                                  selectedDate: state.startDate,
                                  initialDate:
                                      state.startDate != null &&
                                              state.startDate!.isBefore(now)
                                          ? now
                                          : (state.startDate ?? now),
                                  firstDate: now,
                                  lastDate: DateTime(2100),
                                  onDateSelected: notifier.updateStartDate,
                                  errorText: state.startDateError,
                                  buttonColor: AppColors.instance.black600,
                                  selectionColor: AppColors.instance.teal300,
                                  textColor: AppColors.instance.black600,
                                ),
                              ),

                              const SizedBox(width: 16),
                              Expanded(
                                child: DatePickerField(
                                  label: 'End Date',
                                  selectedDate: state.endDate,
                                  initialDate: () {
                                    final first = state.startDate ?? now;
                                    final init = state.endDate ?? first;
                                    return init.isBefore(first) ? first : init;
                                  }(),
                                  firstDate: state.startDate ?? now,
                                  lastDate: DateTime(2100),
                                  onDateSelected: notifier.updateEndDate,
                                  errorText: state.endDateError,
                                  buttonColor: AppColors.instance.black600,
                                  selectionColor: AppColors.instance.teal300,
                                  textColor: AppColors.instance.black600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ReusabelProfileForm(
                            controller: _sepecialInstructionController,
                            fieldKey: 'special_instructions',
                            fieldType: FieldType.reason,
                            hintText:
                                'eg, Please allow catering vans between 4pm-6pm',
                            label: 'Special Instructions',
                            onChanged: (_) {},
                            onValidationChanged: (_) {},
                          ),
                          const SizedBox(height: 20),

                          /// Description
                          ReusabelProfileForm(
                            controller: _descriptionController,
                            fieldKey: 'Event description',
                            fieldType: FieldType.reason,
                            hintText: 'eg, Celebrating my 30th birthday?',
                            label: 'Event Description',
                            maxLines: 2,
                            // maxLength: 20,
                            onChanged: (_) {},
                            onValidationChanged: (_) {},
                          ),

                          /// Add item button
                          const SizedBox(height: 20),

                          /// Item list

                          /// Submit button (only when items exist)
                          InkWell(
                            onTap:
                                isPermitFormValid(
                                      descriptionController:
                                          _descriptionController,
                                      guestNumberController:
                                          _guestNumberController,
                                      eventTitleController:
                                          _eventTitleController,
                                      specialInstructionController:
                                          _sepecialInstructionController,
                                      eventLocationController:
                                          _eventLocationController,
                                      startDate: state.startDate,
                                      endDate: state.endDate,
                                      workType: state.workType,
                                    )
                                    ? () {
                                      // final data = {
                                      //   "guest_phone_number":
                                      //       _guestNumberController.text.trim(),
                                      //   "guest_name":
                                      //       _eventTitleController.text.trim(),
                                      //   "items_description":
                                      //       _descriptionController.text.trim(),
                                      //   "estimated_value": "",
                                      //   "items": [],
                                      //   "metadata": {
                                      //     "delivery_company":
                                      //         _sepecialInstructionController
                                      //             .text
                                      //             .trim(),
                                      //     "expected_date": ''.trim(),
                                      //     "special_instructions":
                                      //         _eventLocationController.text
                                      //             .trim(),
                                      //   },
                                      // };

                                      form.requestEventCode(
                                        context: context,
                                        event_title:
                                            _eventTitleController.text.trim(),
                                        event_description:
                                            _descriptionController.text.trim(),
                                        event_type:
                                            state.workType?.toLowerCase() ?? "",
                                        event_start_date:
                                            state.startDate.toString(),
                                        event_end_date:
                                            state.endDate.toString(),
                                        expected_guests: int.parse(
                                          _guestNumberController.text.trim(),
                                        ),
                                        event_location:
                                            _eventLocationController.text
                                                .trim(),
                                        special_instructions:
                                            _sepecialInstructionController.text
                                                .trim(),
                                        ref: ref,
                                      );

                                      // debugPrint("SUBMIT PERMIT DATA: $data");

                                      _descriptionController.clear();
                                      _sepecialInstructionController.clear();
                                      _eventTitleController.clear();
                                      _eventLocationController.clear();
                                      _guestNumberController.clear();

                                      notifier.updateWorkType("", 0);
                                      notifier.updateEndDate(null);
                                      notifier.updateStartDate(null);
                                    }
                                    : null,
                            child: Container(
                              width: size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color:
                                    isPermitFormValid(
                                          descriptionController:
                                              _descriptionController,
                                          guestNumberController:
                                              _guestNumberController,
                                          eventTitleController:
                                              _eventTitleController,
                                          specialInstructionController:
                                              _sepecialInstructionController,
                                          eventLocationController:
                                              _eventLocationController,
                                          startDate: state.startDate,
                                          endDate: state.endDate,
                                          workType: state.workType,
                                        )
                                        ? AppColors.instance.black600
                                        : AppColors.instance.grey400,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Center(
                                child: Text(
                                  "Submit Request",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: FontFamilies.interDisplay,
                                    fontWeight: FontWeight.bold,
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
