import 'dart:developer';

import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/progresscontainer.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/stepcount.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:curnectgate/features/member_management/profile_form/passwordform.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordScreen extends BaseVerificationScreen {
  final String firstName;
  final String email;
  const PasswordScreen(this.firstName, this.email, {super.key})
    : super(
        currentStep: 5,
        totalSteps: 5,
        title: "Hi $firstName.",
        description: "Let's cerate a password",
      );

  @override
  ConsumerState<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<PasswordScreen> {
  final _passwordController = TextEditingController();
  void _submitForm() {
    String pass = _passwordController.text.trim();
    log(pass);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtpScreen(widget.email)),
    );
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
      actions: [
        StepIndicator(current: widget.currentStep, total: widget.totalSteps),
      ],
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const ProgressIndicators(
            currentStep: 4,
            totalSteps: 5,
            height: 2.0,
            borderRadius: 4.0,
          ),
          const SizedBox(height: 55),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.description,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Text(
                widget.email,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 11,
                ),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          const SizedBox(height: 32),
          PasswordInputField(
            passControler: _passwordController,
            hintText: "e.g Gre&&^#098",
            label: 'Creat a password ',
            showErroindicator: true,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAction() {
    // final isLoading = ref.watch(estateCodeSubmissionProvider).isLoading;

    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Consumer(
        builder: (context, ref, _) {
          final formState = ref.watch(formProvider);
          return ActionButton(
            label: 'Finish setup',
            onPressed: formState.allValid ? _submitForm : null,
          );
        },
      ),
    );
  }
}
