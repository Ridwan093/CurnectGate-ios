import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecurityIncomAndAgentFess extends ConsumerStatefulWidget {
  const SecurityIncomAndAgentFess({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExperienceEducationRowState createState() => _ExperienceEducationRowState();
}

class _ExperienceEducationRowState
    extends ConsumerState<SecurityIncomAndAgentFess> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.read(formProvider.notifier);

    return Row(
      children: [
        // Years of Experience Field
        Flexible(
          flex: 1,
          child: ReusabelProfileForm(
            fieldKey: 'Agent fee',
            fieldType: FieldType.year,
            hintText: 'eg:75000',
            label: 'Agent fee',
            onChanged: (value) {
              provider.updateAgentFees(value);
            },
            onValidationChanged: (validation) {
              ref
                  .read(formProvider.notifier)
                  .updateField(
                    field: 'agent_fee',
                    isValid: validation.isValid,
                    errorMessage: validation.error,
                  );
            },
          ),
        ),

        SizedBox(width: 16),

        Flexible(
          flex: 1,
          child: ReusabelProfileForm(
            fieldKey: 'Security deposit',
            fieldType: FieldType.year,
            hintText: 'eg: 300000',
            label: 'Security deposit',
            onChanged: (value) {
              provider.updateSecurityFees(value);
            },
            onValidationChanged: (validation) {
              ref
                  .read(formProvider.notifier)
                  .updateField(
                    field: 'security deposit',
                    isValid: validation.isValid,
                    errorMessage: validation.error,
                  );
            },
          ),
        ),
      ],
    );
  }
}
