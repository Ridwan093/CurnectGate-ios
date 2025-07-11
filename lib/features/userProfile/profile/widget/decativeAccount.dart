import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/userProfile/profile/model/fform_enum.dart';
import 'package:curnectgate/features/userProfile/profile/provider/form_state.dart';
import 'package:curnectgate/features/userProfile/profile/widget/profileButton.dart';
import 'package:curnectgate/features/userProfile/profile/widget/updateInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DeactiveAccount extends ConsumerWidget {
  const DeactiveAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formprovider = ref.read(formProvider.notifier);
    final formSate = ref.watch(formProvider);
    final state = ref.watch(profileFormProvider);
    final notifier = ref.read(profileFormProvider.notifier);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          SizedBox(height: 20),
          // Header Row
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deactive your Account',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              Text(
                'Where are sorry to hear you want to Deactive your Account, please tell ours the reason Below?',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.medium,
                  color: AppColors.instance.black300,
                ),
              ),
            ],
          ),

          const SizedBox(height: 26),
          UpdateInput(
            hintText: 'Enter your password',
            label: 'Password',
            obscureText: true,
            errorText: state.passwordError,
            onChanged:
                (value) => notifier.updateField(
                  type: ProfileFormType.deactivateAccount,
                  field: 'currentPassword',
                  value: value,
                ),
          ),
          const SizedBox(height: 16),
          UpdateInput(
            hintText: 'Reason for deactivation',
            label: 'Reason',
            errorText: state.reasonError,
            onChanged:
                (value) => notifier.updateField(
                  type: ProfileFormType.deactivateAccount,
                  field: 'reason',
                  value: value,
                ),
          ),
          const SizedBox(height: 20),
          ProfileButton(
            onPressed:
                state.allReasonValid
                    ? () async {
                      final authData = await SharedPrefsService().getAuthData();
                      final data = authData?['user'];
                      if (authData != null) {
                        final gender = data?['gender'] as String?;
                        final notfypre =
                            data?['preferred_notification'] as String?;

                        formprovider.deactiveAccount(
                          context: context,
                          reason: state.reason,
                          currentPassword: state.currentPassword,

                          ref: ref,
                        );
                      }
                    }
                    : null,
            label:
                formSate.isLoading
                    ? CircularProgressIndicator(
                      color: AppColors.instance.yellow500,
                    )
                    : Text(
                      "Deactive",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 15,
                        fontWeight: FontFamilies.medium,
                        color: AppColors.instance.black300,
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
