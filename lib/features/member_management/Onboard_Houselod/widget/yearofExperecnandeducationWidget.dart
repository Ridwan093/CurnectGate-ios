import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/co_dropdown.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExperienceEducationRow extends ConsumerStatefulWidget {
  const ExperienceEducationRow({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExperienceEducationRowState createState() => _ExperienceEducationRowState();
}

class _ExperienceEducationRowState
    extends ConsumerState<ExperienceEducationRow> {
  final List<String> _educationLevels = [
    'High School',
    'Bachelor\'s',
    'Master\'s',
    'PhD',
    "Professional"
        'Other',
  ];

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(formProvider.notifier);
    final state = ref.watch(formProvider);
    return Row(
      children: [
        // Years of Experience Field
        Flexible(
          flex: 1,
          child: ReusabelProfileForm(
            fieldKey: 'years of experience',
            fieldType: FieldType.year,
            hintText: 'eg. 8',
            label: 'Years of experience',
            onChanged: (value) {},
            onValidationChanged: (validation) {
              ref
                  .read(formProvider.notifier)
                  .updateField(
                    field: 'years_of_experience',
                    isValid: validation.isValid,
                    errorMessage: validation.error,
                  );
            },
          ),
        ),

        SizedBox(width: 16),

        // Education Level Dropdown
        Flexible(
          flex: 1,
          child: CoDropdown(
            item: _educationLevels,
            label: "Education level",
            onChanged: (value) {
              provider.updateEducationLevel(value);
            },
            value:
                _educationLevels.contains(state.educationLevel)
                    ? state.educationLevel
                    : null,
            errorKey: "education_level",
          ),
        ),
      ],
    );
  }
}
