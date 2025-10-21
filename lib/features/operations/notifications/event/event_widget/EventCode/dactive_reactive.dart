import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/operations/notifications/event/model/EventCodes/event_code_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DeactiveEventCode extends ConsumerWidget {
  final  EventCode eventCode;
  const DeactiveEventCode({super.key, required this.eventCode});

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
                          onPressed: () => context.pop(),
                          icon: Icon(
                            Icons.close,
                            color: AppColors.instance.black600,
                          ),
                        ),
              ),
            ),

            const SizedBox(height: 20),
            Text(
              'Deactivate Code?',
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
                'Are you sure you want to deactivate your event code? ',
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
                  state.digiterReason!.isNotEmpty &&
                          state.digiterReason!.length > 19
                      ? () {
                        form.deActiveEventCode(context: context,id:eventCode.id??0, ref: ref);
                      }
                      : null,
              label: 'Deactivate code',
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
