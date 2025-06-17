import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/auth/presentation/screen/forgot_password.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/screen/onboard_code_confirm.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignIn extends BaseVerificationScreen {
  const SignIn({super.key})
    : super(
        currentStep: 4,
        totalSteps: 5,
        title: "Hi Sam.👋🏻",
        description: 'Sign in to continue',
      );

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _submitForm() {
    ref.read(formProvider.notifier).updateLoading(true);

    final email = _emailController.text;
    final pass = _passwordController.text;

    log('Email: $email');
    log('Phone: $pass');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(appBar: _buildAppBar(), body: _biuldbody(size));
  }

  Widget _biuldbody(Size size) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(children: [_buildContent(), _buildBottomAction()]),
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
      onTap: () {
        // domin rought change later
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EstateCodeVerificationScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Text(
          "Create an account",
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
          const SizedBox(height: 20),

          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.description,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
          ),

          const SizedBox(height: 30),
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
          const SizedBox(height: 20),
          ReusabelProfileForm(
            controller: _passwordController,
            hintText: 'Create password',
            label: 'Password',
            fieldKey: 'password',
            fieldType: FieldType.password,
            onValidationChanged: (validation) {
              // Handle validation changes
              // setState(() {
              //   _isPasswordValid = validation.isValid;
              // });
            },
          ),
          _buildForgotButton(),
        ],
      ),
    );
  }

  Widget _buildForgotButton() {
    return InkWell(
      onTap: () {
        //domin rougte chang later PasswordReset
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PasswordReset()),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Center(
          child: Text(
            "Forgot password?",
            strutStyle: StrutStyle.fromTextStyle(
              TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 13,
                color: AppColors.instance.black500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomAction() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: ActionButton(label: 'Sign in', onPressed: _submitForm),
    );
  }
}
