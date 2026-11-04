import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/get_workOder/work_order.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/work_order_model.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/workformprovider.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/date_picker.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/dayTimeWindow.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/incressxdecress.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/work_submitbutton.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/workcategory_data.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/screen/loading_screen/loading_page.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class SubmitWorkOrderPage extends ConsumerStatefulWidget {
  final WorkOrder? vendor;
  const SubmitWorkOrderPage({super.key, this.vendor});

  @override
  ConsumerState<SubmitWorkOrderPage> createState() =>
      _SubmitWorkOrderPageState();
}

class _SubmitWorkOrderPageState extends ConsumerState<SubmitWorkOrderPage> {
  late final TextEditingController _vendorNameController;
  late final TextEditingController _discriptionController;
  late final TextEditingController _vendoremailController;
  late final TextEditingController _vendorphoneController;
  final now = DateTime.now();

  final List<String> workTypes = [
    'Electrical',
    'Plumbing',
    'Carpentry',
    'Cleaning',
    'Landscaping',
    'Painting',
    'Other',
  ];

  final List<String> timeWindows = [
    '9:00 AM - 5:00 PM',
    '10:00 AM - 4:00 PM',
    '8:00 AM - 6:00 PM',
    '7:00 AM - 7:00 PM',
  ];

  @override
  void initState() {
    super.initState();

    // Initialize controllers with vendor data if available
    _vendorNameController = TextEditingController(
      text: widget.vendor?.vendorName ?? '',
    );
    _discriptionController = TextEditingController(
      text: widget.vendor?.description ?? '',
    );
    _vendoremailController = TextEditingController(
      text: widget.vendor?.vendorEmail ?? '',
    );
    _vendorphoneController = TextEditingController(
      text: widget.vendor?.vendorPhone ?? '',
    );

    // Update form state after widgets are built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeFormWithVendorData();
    });
  }

  void _initializeFormWithVendorData() {
    if (widget.vendor == null) return;

    final notifier = ref.read(workOrderFormProvider.notifier);
    final vendor = widget.vendor!;

    // Update form state
    notifier.updateVendorName(vendor.vendorName ?? "");
    notifier.updateVendorEmail(vendor.vendorEmail ?? "");
    notifier.updatePhoneNumber(vendor.vendorPhone ?? "");
    notifier.updateWorkDescription(vendor.description ?? "");
    notifier.updateWorkType(
      vendor.category?.name ?? "",
      vendor.workorderCategoryId ?? 0,
    );

    // Handle numeric fields
    // notifier.updateDaysCount(int.tryParse(vendor.daysCount!) ?? 1);

    notifier.updateWorkCount(vendor.numberOfWorkers ?? 0);

    // Handle dates

    // Usage
    final startDate = parseDate(vendor.startDate);
    final endDate = parseDate(vendor.endDate);

    notifier.updateStartDate(startDate);
    notifier.updateEndDate(endDate);
    notifier.updateTimeWindow(vendor.dailyTimeWindow ?? "");
  }

  void _submitForm(BuildContext context) {
    final state = ref.watch(workOrderFormProvider);

    final provider = ref.read(formProvider.notifier);
    if (widget.vendor != null) {
      provider.updateWorkOrder(
        categorie: state.id,
        context: context,
        file: "",
        name: _vendorNameController.text.trim(),
        dec: _discriptionController.text.trim(),
        email: _vendoremailController.text.trim(),
        phone: _vendorphoneController.text.trim(),
        startDate: state.startDate.toString(),
        endDate: state.endDate.toString(),
        dailyWindowTime: state.selectedTimeWindow ?? "",
        numberofWorkers: state.workerCount.toString(),
        numberofDays: state.daysCount.toString(),
        id: (widget.vendor?.id ?? 0).toString(),
        ref: ref,
      );
    } else {
      provider.submitWorkOrder(
        categorie: state.id,
        context: context,
        file: "",
        name: _vendorNameController.text.trim(),
        dec: _discriptionController.text.trim(),
        email: _vendoremailController.text.trim(),
        phone: _vendorphoneController.text.trim(),
        startDate: state.startDate.toString(),
        endDate: state.endDate.toString(),
        dailyWindowTime: state.selectedTimeWindow ?? "",
        numberofWorkers: state.workerCount.toString(),
        numberofDays: state.daysCount.toString(),
        ref: ref,
      );
    }

    resetForm();
    _clearAllFields();
  }

  void resetForm() {
    ref.watch(workOrderFormProvider);
  }

  DateTime? parseDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return null;

    final dt = DateTime.tryParse(dateStr);
    if (dt != null) return dt;

    final formats = [
      DateFormat('yyyy-MM-dd'),
      DateFormat('dd/MM/yyyy'),
      DateFormat('yyyy-MM-dd HH:mm'),
      DateFormat('dd-MM-yyyy'),
      DateFormat('MM/dd/yyyy'),
    ];

    for (final format in formats) {
      try {
        return format.parseStrict(dateStr);
      } catch (_) {}
    }

    return null;
  }

  void _clearAllFields() {
    _vendorNameController.clear();
    _discriptionController.clear();
    _vendoremailController.clear();
    _vendorphoneController.clear();
  }

  @override
  void dispose() {
    _vendorNameController.dispose();
    _discriptionController.dispose();
    _vendoremailController.dispose();
    _vendorphoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(workOrderFormProvider);
    final notifier = ref.read(workOrderFormProvider.notifier);
    final provider = ref.watch(formProvider);
    final isValid = ref.watch(
      workOrderFormProvider.select((state) => state.allValid),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          provider.workOderLoading
              ? null
              : AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
      bottomNavigationBar:
          provider.workOderLoading
              ? null
              : SafeArea(
                top: false,
                child: WorkSubmitbutton(
                  label: "Generate access code",
                  onPressed: isValid ? () => _submitForm(context) : null,
                ),
              ),
      body:
          provider.workOderLoading
              ? AppLoader(size: LoaderSize.large, type: LoaderType.circular)
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Submit Work Order',
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.instance.black600,
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Vendor Name Field
                    ReusabelProfileForm(
                      controller: _vendorNameController,
                      fieldKey: "Vendor's name",
                      fieldType: FieldType.name,
                      hintText: 'Enter vendor name',
                      label: 'Vendor name',
                      onChanged: (value) {},
                      onValidationChanged: (value) {
                        notifier.updateVendorName(
                          _vendorNameController.text.trim(),
                        );
                      },
                    ),
                    const SizedBox(height: 16),

                    // Email Field
                    ReusabelProfileForm(
                      controller: _vendoremailController,
                      fieldKey: "email",
                      fieldType: FieldType.email,
                      hintText: 'Enter email',
                      label: 'Email',
                      onChanged: (value) {},
                      onValidationChanged: (value) {
                        notifier.updateVendorEmail(
                          _vendoremailController.text.trim(),
                        );
                      },
                    ),
                    const SizedBox(height: 16),

                    // Phone Number Field
                    ReusabelProfileForm(
                      controller: _vendorphoneController,
                      fieldKey: "Phone Number",
                      fieldType: FieldType.phone,
                      hintText: 'Enter phone number',
                      label: 'Phone number',
                      onChanged: (value) {},
                      onValidationChanged: (value) {
                        notifier.updatePhoneNumber(
                          _vendorphoneController.text.trim(),
                        );
                      },
                    ),
                    const SizedBox(height: 16),

                    // Work Type Dropdown
                    CategoryData(currentValue: state.workType.toString()),
                    // WorkDropDown(
                    //   workTypes: workTypes,
                    //   onChanged: (value) {
                    //     notifier.updateWorkType(value);
                    //   },
                    // ),
                    const SizedBox(height: 16),

                    // Work Description
                    ReusabelProfileForm(
                      controller: _discriptionController,
                      fieldKey: 'Work Description',
                      fieldType: FieldType.reason,
                      hintText: 'Enter work description',
                      label: 'Description',
                      maxLength: 100,
                      maxLines: 2,
                      onChanged: (value) {},
                      onValidationChanged: (value) {
                        notifier.updateWorkDescription(
                          _discriptionController.text.trim(),
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    // Worker and Days Count Section
                    _buildCounterSection(state, notifier),
                    const SizedBox(height: 20),

                    // Date and Time Section
                    _buildDateTimeSection(ref),
                  ],
                ),
              ),
    );
  }

  Widget _buildCounterSection(
    WorkOrderFormState state,
    WorkOrderFormNotifier notifier,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Worker Limit',
          style: TextStyle(
            fontSize: 18,
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
            fontWeight: FontFamilies.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Set the number of workers and days for the work',
          style: TextStyle(
            color: AppColors.instance.black300,
            fontFamily: FontFamilies.interDisplay,
          ),
        ),
        const SizedBox(height: 16),

        // Workers Counter
        Row(
          children: [
            Text(
              'Workers',
              style: TextStyle(
                fontSize: 16,
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
              ),
            ),
            const Spacer(),
            Incressxdecress(
              value: state.workerCount,
              onIncrement: () {
                if (state.workerCount > 19) {
                  showCustomSuccessToast(
                    positionNumber: 50,
                    context: context,
                    message:
                        "The number of workers  must not be greater than 20.",
                    color: AppColors.instance.grey200,
                    icon: Icons.error,
                    iconColors: AppColors.instance.black600,
                  );
                  Future.delayed(const Duration(milliseconds: 300), () {
                    notifier.setIncrementPresse(false);
                  });
                } else {
                  notifier.setIncrementPresse(true);
                  notifier.incrementWorkers();

                  Future.delayed(const Duration(milliseconds: 300), () {
                    notifier.setIncrementPresse(false);
                  });
                }
              },
              onDecrement: () {
                notifier.setDecrementPressed(true);
                notifier.decrementWorkers();

                Future.delayed(const Duration(milliseconds: 300), () {
                  notifier.setDecrementPressed(false);
                });
              },
              isIncrementActive: state.isIncrementPressed,
              isDecrementActive: state.isDecrementPressed,
            ),
          ],
        ),
        const SizedBox(height: 25),

        // Days Counter
        Row(
          children: [
            Text(
              'Days',
              style: TextStyle(
                fontSize: 16,
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
              ),
            ),
            const Spacer(),
            Incressxdecress(
              value: state.daysCount,
              onIncrement: () {
                notifier.setIncrementPresseday(true);
                notifier.incrementDays();

                Future.delayed(const Duration(milliseconds: 300), () {
                  notifier.setIncrementPresseday(false);
                });
              },
              onDecrement: () {
                notifier.setDecrementPressedday(true);
                notifier.decrementDays();

                Future.delayed(const Duration(milliseconds: 300), () {
                  notifier.setDecrementPressedday(false);
                });
              },

              isIncrementActive: state.isIncrementPressedday,
              isDecrementActive: state.isDecrementPressedday,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDateTimeSection(WidgetRef ref) {
    final state = ref.watch(workOrderFormProvider);
    final notifier = ref.read(workOrderFormProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Time',
          style: TextStyle(
            fontSize: 18,
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Set the start and end dates and time window',
          style: TextStyle(
            color: AppColors.instance.black300,
            fontFamily: FontFamilies.interDisplay,
          ),
        ),
        const SizedBox(height: 16),

        // Date Pickers
        Row(
          children: [
            Expanded(
              child: DatePickerField(
                label: 'Start Date',
                selectedDate: state.startDate,
                initialDate:
                    state.startDate != null && state.startDate!.isBefore(now)
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

        const SizedBox(height: 16),

        // Time Window Dropdown
        Daytimewindow(
          timeWindows: timeWindows,
          onChanged: (value) {
            notifier.updateTimeWindow(value);
          },
        ),
      ],
    );
  }
}
