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

class ChangePasswordSheet extends ConsumerWidget {
  const ChangePasswordSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formprovider = ref.read(formProvider.notifier);
    final formSate = ref.watch(formProvider);
    final state = ref.watch(profileFormProvider);
    final notifier = ref.read(profileFormProvider.notifier);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Change Password',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                    ),
                  ),
                  Text(
                    'Change your current password to new!',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.medium,
                      color: AppColors.instance.black300,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),

          const SizedBox(height: 16),
          UpdateInput(
            hintText: 'Enter current password',
            label: 'Current Password',
            obscureText: true,
            errorText: state.passwordError,
            onChanged:
                (value) => notifier.updateField(
                  type: ProfileFormType.changePassword,
                  field: 'currentPassword',
                  value: value,
                ),
          ),
          const SizedBox(height: 16),
          UpdateInput(
            hintText: 'Enter new password',
            label: 'New Password',
            obscureText: true,
            errorText: state.newwpasswordError,
            onChanged:
                (value) => notifier.updateField(
                  type: ProfileFormType.changePassword,
                  field: 'newPass',
                  value: value,
                ),
          ),
          const SizedBox(height: 16),
          UpdateInput(
            hintText: 'Confirm new password',
            label: 'Confirm Password',
            obscureText: true,
            errorText: state.confirmpasswordError,
            onChanged:
                (value) => notifier.updateField(
                  type: ProfileFormType.changePassword,
                  field: 'confirmPass',
                  value: value,
                ),
          ),
          const SizedBox(height: 20),
          ProfileButton(
            onPressed:
                state.allNewPassValid
                    ? () async {
                      final authData = await SharedPrefsService().getAuthData();
                      final data = authData?['user'];
                      if (authData != null) {
                        final gender = data?['gender'] as String?;
                        final notfypre =
                            data?['preferred_notification'] as String?;

                        formprovider.updateUserPassWord(
                          context: context,
                          confirmPass: state.confirmPass,
                          currentPassword: state.currentPassword,
                          newPassword: state.newPass,

                          ref: ref,
                        );
                      }
                    }
                    : null,
            label:
                formSate.changProfilePassLoading
                    ? CircularProgressIndicator(
                      color: AppColors.instance.yellow500,
                    )
                    : Text(
                      "Update",
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
