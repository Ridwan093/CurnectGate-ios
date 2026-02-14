import 'dart:developer';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/workformprovider.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/userProfile/profile/widget/profileButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Revokedotp extends ConsumerWidget {
  final String title;
  final String subtitle;
  final int id;

  Revokedotp({
    super.key,
    required this.id,
    required this.subtitle,
    required this.title,
  });
  final TextEditingController _vendorNameController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(workOrderFormProvider.notifier);
    final valid = ref.watch(workOrderFormProvider);
    final isValid = ref.watch(
      workOrderFormProvider.select((state) => state.workDescriptionValid),
    );
    final genrate = ref.read(generateNotifierProvider.notifier);
    final loading = ref.watch(formProvider).revokOtpLoading;
    final forms = ref.watch(formProvider.notifier);

    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 20,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  color: AppColors.instance.black300,
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),
          ReusabelProfileForm(
            controller: _vendorNameController,
            fieldKey: 'reason',
            fieldType: FieldType.reason,
            hintText: 'Enter reason',
            label: 'Reason',
            onChanged: (p0) {
              log(p0);
              notifier.updateWorkDescription(p0);
              genrate.setRevorkReason(p0);
            },
            // onValidationChanged: (value) {
            //   notifier.updateWorkDescription(_vendorNameController.text);
            // },
          ),
          const SizedBox(height: 20),
          ProfileButton(
            label:
                loading
                    ? Loadingstates()
                    : Text(
                      "Revoked",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.grey200,
                      ),
                    ),
            onPressed:
                isValid && valid.workDescription.trim().length > 10
                    ? () {
                      log(isValid.toString());
                      log(valid.workDescription);
                      forms.revorkActiveOTP(context: context, id: id, ref: ref);
                    }
                    : null,
          ),
        ],
      ),
    );
  }
}
