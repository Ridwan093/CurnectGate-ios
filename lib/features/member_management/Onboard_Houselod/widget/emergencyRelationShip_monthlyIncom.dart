import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/co_dropdown.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MontlyIconAndEmergencyRole extends ConsumerStatefulWidget {
  const MontlyIconAndEmergencyRole({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExperienceEducationRowState createState() => _ExperienceEducationRowState();
}

class _ExperienceEducationRowState
    extends ConsumerState<MontlyIconAndEmergencyRole> {
  final List<String> _emergencyRoles = [
    "Family Member",

    "Aunt",

    "Wife",

    "Uncle",

    "Cousin",

    "Neighbor",

    "Friend",

    "Child",

    "Daughter",

    "Son",

    "Stepchild",

    "Grandparent",

    "Grandfather",

    "Grandmother",

    "Grandchild",
  ];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(formProvider);
    return Row(
      children: [
        // Years of Experience Field
        Flexible(
          flex: 1,
          child: ReusabelProfileForm(
            fieldKey: 'Monthly income',
            fieldType: FieldType.year,
            hintText: 'eg:75000',
            label: 'Monthly income',
            onChanged: (value) {
              ref.read(formProvider.notifier).updateMonthlyIcom(value);
            },
            onValidationChanged: (validation) {
              ref
                  .read(formProvider.notifier)
                  .updateField(
                    field: 'monthly_income',
                    isValid: validation.isValid,
                    errorMessage: validation.error,
                  );
            },
          ),
        ),

        SizedBox(width: 16),

        Flexible(
          flex: 1,
          child: CoDropdown(
            item: _emergencyRoles,
            label: "Emergency contact relationship",
            onChanged: (value) {
              ref.read(formProvider.notifier).updateEmergencyRole(value ?? "");
            },
            value:
                _emergencyRoles.contains(state.emenergencyRole)
                    ? state.emenergencyRole
                    : null,
            errorKey: "emergency_contact_relationship",
          ),
        ),
      ],
    );
  }
}
