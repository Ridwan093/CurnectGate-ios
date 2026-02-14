import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Regeneratemembrid extends ConsumerWidget {
  const Regeneratemembrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.read(formProvider.notifier);
    final state = ref.watch(formProvider);
    final isLoading = ref.watch(formProvider).generateMemberIdLoading;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child:
                    isLoading
                        ? CircularProgressIndicator(
                          color: AppColors.instance.yellow500,
                        )
                        : IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close,
                            color: AppColors.instance.black600,
                          ),
                        ),
              ),
            ),

            const SizedBox(height: 20),
            Text(
              'Regenerate Code?',
              style: TextStyle(
                fontSize: 18,
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Text(
                'This will generate a new access code. Your old code will no longer work.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontWeight: FontFamilies.medium,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 23, right: 23, top: 10),
              child: ReusabelProfileForm(
                onChanged: (value) {
                  form.updateRegenerateDigiterCode(value);
                },
                fieldType: FieldType.reason,
                hintText: "Reason",
                label: "Reason",
                fieldKey: "Reason",
              ),
            ),
            const SizedBox(height: 30),
            ActionButton(
              onPressed:
                  (state.digiterReason?.trim() ?? "").isNotEmpty &&
                          (state.digiterReason?.trim() ?? "").length > 9
                      ? () {
                        form.reGenerateMemberID(context: context, ref: ref);
                      }
                      : null,
              label: 'Regenerate',
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
