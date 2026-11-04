import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/co_dropdown.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/emergencyRelationShip_monthlyIncom.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/security_deposit_agentIncom.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/startDate_widget.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TenantAdditionalFields extends ConsumerWidget {
  final TextEditingController emergencyContactname;
  final TextEditingController emergencyContactphnoe;
  final TextEditingController desgination;

  TenantAdditionalFields({
    super.key,
    required this.desgination,
    required this.emergencyContactname,
    required this.emergencyContactphnoe,
  });
  final List<String> _rental_frequency = ['Monthly'];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(formProvider);
    return Column(
      children: [
        ReusabelProfileForm(
          controller: emergencyContactname,
          fieldKey: 'emergency_contact_name',
          fieldType: FieldType.name,
          hintText: 'eg. same jone',
          label: 'Emergency contact name',
          onChanged: (value) {},
          onValidationChanged: (validation) {
            ref
                .read(formProvider.notifier)
                .updateField(
                  field: 'emergency_contact_name',
                  isValid: validation.isValid,
                  errorMessage: validation.error,
                );
          },
        ),
        const SizedBox(height: 16),
        ReusabelProfileForm(
          controller: emergencyContactphnoe,
          fieldKey: 'emergency_contact_phone',
          fieldType: FieldType.phone,
          hintText: 'eg +234-748748',
          label: 'Emergency contact number',
          onChanged: (value) {},
          onValidationChanged: (validation) {
            ref
                .read(formProvider.notifier)
                .updateField(
                  field: 'emergency_contact_phone',
                  isValid: validation.isValid,
                  errorMessage: validation.error,
                );
          },
        ),
        const SizedBox(height: 16),
        MontlyIconAndEmergencyRole(),
        const SizedBox(height: 16),
        ReusabelProfileForm(
          controller: desgination,
          fieldKey: 'Occupation',
          fieldType: FieldType.name,
          hintText: 'eg.(banker, Software Engineer)',
          label: 'Occupation',
          onChanged: (value) {
            ref.read(formProvider.notifier).updateOcupation(value);
          },
          onValidationChanged: (validation) {
            ref
                .read(formProvider.notifier)
                .updateField(
                  field: 'occupation',
                  isValid: validation.isValid,
                  errorMessage: validation.error,
                );
          },
        ),
        const SizedBox(height: 16),
        ReusabelProfileForm(
          fieldKey: 'Employer',
          fieldType: FieldType.name,
          hintText: 'eg.(Amazon,Tech Solutions Inc.)',
          label: 'Employer',
          onChanged: (value) {
            ref.read(formProvider.notifier).updateEmplyer(value);
          },
          onValidationChanged: (validation) {
            ref
                .read(formProvider.notifier)
                .updateField(
                  field: 'employer',
                  isValid: validation.isValid,
                  errorMessage: validation.error,
                );
          },
        ),
        const SizedBox(height: 16),
        CoDropdown(
          item: _rental_frequency,
          label: 'Rental Frequency',
          onChanged: (value) {
            ref.read(formProvider.notifier).updateRentFrequency(value ?? "");
          },
          value:
              _rental_frequency.contains(state.rentalfrequency)
                  ? state.rentalfrequency
                  : null,
          errorKey: "rental_frequency",
        ),
        // ReusabelProfileForm(

        //   fieldKey: 'Rental Frequency',
        //   fieldType: FieldType.name,
        //   hintText: 'e.g. (monthly, annually)',
        //   label: 'Rental Frequency',
        //   onChanged: (value) {
        //      ref.read(formProvider.notifier).updateRentFrequency(value);
        //   },
        //   onValidationChanged: (validation) {
        //     ref
        //         .read(formProvider.notifier)
        //         .updateField(
        //           field: 'rental_frequency',
        //           isValid: validation.isValid,
        //           errorMessage: validation.error,
        //         );
        //   },
        // ),
        const SizedBox(height: 16),
        SecurityIncomAndAgentFess(),

        const SizedBox(height: 16),
        DatePickerWidget(),
      ],
    );
  }
}
