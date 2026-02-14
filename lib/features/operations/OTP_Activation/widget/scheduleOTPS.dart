import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/ScheduleTime_widget.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/additionalInfo.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/scheduleDate_widget.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/validation_message_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleOTPinAdvance extends ConsumerStatefulWidget {
  const ScheduleOTPinAdvance({super.key});

  @override
  ConsumerState<ScheduleOTPinAdvance> createState() =>
      _ScheduleOTPinAdvanceState();
}

class _ScheduleOTPinAdvanceState extends ConsumerState<ScheduleOTPinAdvance> {
  // Controllers for text inputs
  final _visitorController = TextEditingController();
  final _vehicleController = TextEditingController();
  final _phoneController = TextEditingController();

  // Local state for dropdown (instant UI update without provider rebuilds)
  String? _selectedPurpose;

  @override
  void initState() {
    super.initState();
    // Optional: prefill from provider if needed
    _selectedPurpose = ref.read(generateNotifierProvider).purposeofVisit;
  }

  @override
  void dispose() {
    _visitorController.dispose();
    _vehicleController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    final purpose = _selectedPurpose ?? '';
    final visitor = _visitorController.text.trim();
    // final vehicle = _vehicleController.text.trim();
    // final phone = _phoneController.text.trim();
    final seletedDate =
        ref.watch(generateNotifierProvider.select((s) => s.selectedDate));
            final seletedTime =
        ref.watch(generateNotifierProvider.select((s) => s.selectedTime));

    // Adjust validation as needed (e.g. require phone or vehicle)
    return visitor.isNotEmpty && purpose.isNotEmpty && seletedDate != null && seletedTime !=null;
  }

  @override
  Widget build(BuildContext context) {
  
    final size = MediaQuery.sizeOf(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),

        // Visitor Name
        TextFormField(
          controller: _visitorController,
          decoration: InputDecoration(
            labelText: 'Visitor Name',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.instance.black500),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.instance.black500,
                width: 2,
              ),
            ),
            labelStyle: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black500,
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Purpose Dropdown (local state)
        _buildPurposeDropdown(ref, _selectedPurpose ?? ''),

        const SizedBox(height: 20),

        // Visitor Info Section
        VisitorInfoSection(
          vehicleNumber: _vehicleController,
          phoneNumber: _phoneController,
        ),

        const SizedBox(height: 20),

        // Date & Time Pickers
        DatePickerTile(),
        const SizedBox(height: 20),
        TimePickerTile(),
        const SizedBox(height: 20),

        ValidityMessage(),

        const SizedBox(height: 32),

        // Submit Button
        _buildSubmitButton(
          size: size,
          isLoading: _isFormValid,
          ref: ref,
          context: context,
          onTap: () {
            // Save values only on submit
            ref
                .read(generateNotifierProvider.notifier)
                .setVisitorName(_visitorController.text.trim());
            ref
                .read(generateNotifierProvider.notifier)
                .setVehicleNume(_vehicleController.text.trim());
            ref
                .read(generateNotifierProvider.notifier)
                .setPhoneNume(_phoneController.text.trim());

            if (_selectedPurpose != null) {
              ref
                  .read(generateNotifierProvider.notifier)
                  .setPurpose(_selectedPurpose!);
            }

            ref
                .read(formProvider.notifier)
                .scheduleOtpWithValidation(context: context, ref: ref);
          },
        ),
      ],
    );
  }

  Widget _buildPurposeDropdown(WidgetRef ref, String currentValue) {
    const purpose = {
      'Business meeting': 'Business meeting with property owner',
      'Property viewing': 'Viewing apartments or properties for rent/purchase',
      'Site inspection': 'Inspecting property for potential purchase or lease',
      'Lease discussion': 'Discussing lease terms or renewal',
      'Maintenance issue': 'Addressing maintenance or repair issues',
      'Family visit': 'Visiting family members residing in the property',
      'Friend visit': 'Visiting friends residing in the property',
      'Coworker visit': 'Meeting with coworkers residing in the property',
      'Delivery/services': 'Granting access for delivery or service personnel',
      'Property tour': 'Taking a tour of the property and its facilities',
    };

    final validValue = purpose.containsKey(currentValue) ? currentValue : null;

    return DropdownButtonFormField<String>(
      value: validValue,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColors.instance.black600,
        size: 24,
      ),
      iconSize: 24,
      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(12),
      decoration: InputDecoration(
        labelText: 'Purpose of Visit',
        labelStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black500,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.instance.black500),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.instance.black500),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.instance.black500, width: 2),
        ),
      ),
      selectedItemBuilder:
          (context) =>
              purpose.keys.map((key) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    key,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                );
              }).toList(),
      items:
          purpose.entries.map((entry) {
            return DropdownMenuItem<String>(
              value: entry.key,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      entry.key,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black600,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      entry.value,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
      onChanged: (value) {
        if (value != null) {
          setState(() => _selectedPurpose = value); // instant UI update
        }
      },
    );
  }

  Widget _buildSubmitButton({
    required Size size,
    required bool isLoading,
    required WidgetRef ref,
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    final realLoading = ref.watch(formProvider).schedulOtpLoading;

    return InkWell(
      onTap: isLoading ? onTap : null,
      child: Container(
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color:
              isLoading
                  ? AppColors.instance.black600
                  : AppColors.instance.grey500,
          borderRadius: BorderRadius.circular(10),
        ),
        child:
            realLoading
                ? const Loadingstates()
                : Center(
                  child: Text(
                    "Generate OTP",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 15,
                      fontWeight: FontFamilies.medium,
                      color: AppColors.instance.grey200,
                    ),
                  ),
                ),
      ),
    );
  }
}
