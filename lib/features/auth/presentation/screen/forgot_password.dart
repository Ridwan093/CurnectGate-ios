import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/screen/loading_screen/loading_page.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordReset extends BaseVerificationScreen {
  const PasswordReset({super.key})
    : super(
        currentStep: 4,
        totalSteps: 5,
        title: "Forgot password?",
        description: '',
      );

  @override
  ConsumerState<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends ConsumerState<PasswordReset> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _submitForm() {
    final email = _emailController.text;
    final pass = _passwordController.text;

    log('Email: $email');
    log('Phone: $pass');
    ref
        .read(formProvider.notifier)
        .forgetPass(context: context, email: email, ref: ref);

    //domin rougte chang later PasswordReset
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => PasswordResetSend()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final state = ref.watch(formProvider);

    return Scaffold(
      appBar: state.forgetPaSsLoading ? null : _buildAppBar(),
      bottomNavigationBar:
          state.forgetPaSsLoading
              ? null
              : SafeArea(top: false, child: _buildBottomAction()),
      body:
          state.forgetPaSsLoading
              ? AppLoader(size: LoaderSize.large, type: LoaderType.circular)
              : _biuldbody(size),
    );
  }

  Widget _biuldbody(Size size) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: _buildContent(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: const Icon(Icons.arrow_back_ios_new),
      actions: [_buildTextButton()],
    );
  }

  Widget _buildTextButton() {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Text(
          "Password reset",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 12,
            color: AppColors.instance.black500,
            fontWeight: FontFamilies.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),

          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
          ),

          const SizedBox(height: 24),
          ReusabelProfileForm(
            controller: _emailController,
            fieldKey: 'email',
            fieldType: FieldType.email,
            hintText: 'Enter email address',
            label: 'Email',
            onValidationChanged: (validation) {
              ref
                  .read(formProvider.notifier)
                  .updateField(
                    field: 'email',
                    isValid: validation.isValid,
                    errorMessage: validation.error,
                  );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAction() {
    return ActionButton(
      label: 'Email me a recovery link',
      onPressed: _submitForm,
    );
  }
}
