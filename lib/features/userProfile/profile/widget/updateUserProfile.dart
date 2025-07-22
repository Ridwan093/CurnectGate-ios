

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

class UpdateProfileDialog extends ConsumerStatefulWidget {
  const UpdateProfileDialog({super.key});

  @override
  ConsumerState<UpdateProfileDialog> createState() =>
      _UpdateProfileDialogState();
}

class _UpdateProfileDialogState extends ConsumerState<UpdateProfileDialog> {
 

  @override
  Widget build(BuildContext context) {
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
                    'Update your info',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                    ),
                  ),
                   Text(
                    'Change your Username to new!',
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
            hintText: 'Enter first name',
            label: 'First Name',
            errorText: state.firstNameError,
            onChanged:
                (value) => notifier.updateField(
                  type: ProfileFormType.changeName,
                  field: 'firstName',
                  value: value,
                ),
          ),
          const SizedBox(height: 16),
          UpdateInput(
            hintText: 'Enter last name',
            label: 'Last Name',
            errorText: state.lastNameError,
            onChanged:
                (value) => notifier.updateField(
                  type: ProfileFormType.changeName,
                  field: 'lastName',
                  value: value,
                ),
          ),
          const SizedBox(height: 16),

          const SizedBox(height: 20),
          ProfileButton(
            onPressed:
                state.allNameValid
                    ? () async {
                      final authData = await SharedPrefsService().getAuthData();
                      final data = authData?['user'];
                      if (authData != null) {
                        final gender = data?['gender'] as String?;
                        final notfypre =
                            data?['preferred_notification'] as String?;

                          formprovider.updateUserName(
                            gender: gender ?? "",
                            context: context,
                            firstName: state.firstName,
                            lastName: state.lastName,
                            notifyPre: notfypre!,
                            ref: ref,
                          );
                        }
                      
                    }
                    : null,
            label:
                formSate.changProfileInfoLoading
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

  @override
  void dispose() {
   
    super.dispose();
  }
}
