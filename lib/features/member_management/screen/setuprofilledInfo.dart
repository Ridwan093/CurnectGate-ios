import 'dart:developer';

import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/progresscontainer.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/stepcount.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/member_management/screen/password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetUppRofiled extends BaseVerificationScreen {
  const SetUppRofiled({super.key})
    : super(
        currentStep: 4,
        totalSteps: 5,
        title: "Let's get you setup",
        description: 'Your information are pre-filed',
      );

  @override
  ConsumerState<SetUppRofiled> createState() => _SetUppRofiledState();
}

class _SetUppRofiledState extends ConsumerState<SetUppRofiled> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  void _submitForm() {
    ref.read(formProvider.notifier).updateLoading(true);
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;

    log('First Name: $firstName');
    log('Last Name: $lastName');
    log('Email: $email');
    log('Phone: $phone');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PasswordScreen(firstName, email)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(appBar: _buildAppBar(),bottomNavigationBar:  _buildBottomAction(), body: _biuldbody(size));
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
          const SizedBox(height: 8),
          Text(
            widget.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.light,
            ),
          ),
          const SizedBox(height: 32),
          ReusabelProfileForm(
            controller: _firstNameController,
            fieldKey: 'firstName',
            fieldType: FieldType.name,
            hintText: 'Enter first name',
            label: 'First Name',
            onValidationChanged: (validation) {
              ref
                  .read(formProvider.notifier)
                  .updateField(
                    field: 'firstName',
                    isValid: validation.isValid,
                    errorMessage: validation.error,
                  );
            },
          ),
          const SizedBox(height: 16),
          ReusabelProfileForm(
            controller: _lastNameController,
            fieldKey: 'lastName',
            fieldType: FieldType.name,
            hintText: 'Enter last name',
            label: 'Last Name',
            onValidationChanged: (validation) {
              ref
                  .read(formProvider.notifier)
                  .updateField(
                    field: 'lastName',
                    isValid: validation.isValid,
                    errorMessage: validation.error,
                  );
            },
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
          ReusabelProfileForm(
            controller: _phoneController,
            fieldKey: 'phone',
            fieldType: FieldType.phone,
            hintText: 'Enter phone number',
            label: 'Phone',
            onValidationChanged: (validation) {
              ref
                  .read(formProvider.notifier)
                  .updateField(
                    field: 'phone',
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
    final formState = ref.watch(formProvider);
    // final isLoading = ref.watch(estateCodeSubmissionProvider).isLoading;

    return ActionButton(
      label: 'Continue',
      onPressed:
          formState.allValid && !formState.isLoading ? _submitForm : null,
    );
  }
}
