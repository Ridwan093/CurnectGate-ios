import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/progresscontainer.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/stepcount.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:curnectgate/features/member_management/medel/member_model.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/member_management/screen/main_navigation_screen.dart';
import 'package:curnectgate/features/member_management/screen/tab_screen/allmemberScreen.dart';
import 'package:curnectgate/features/member_management/widget/customtoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCOowner extends BaseVerificationScreen {
  final String selectedRole;
  const AddCOowner({super.key, required this.selectedRole})
    : super(
        currentStep: 4,
        totalSteps: 5,
        title: "Add $selectedRole",
        description: 'Enter details about $selectedRole',
      );

  @override
  ConsumerState<AddCOowner> createState() => _SetUppRofiledState();
}

class _SetUppRofiledState extends ConsumerState<AddCOowner> {
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
    var userpix = AssetPaths.userAvatar1;
    var member = MemberModel(
      userfirstName: firstName,
      userlaseName: lastName,
      userpix: userpix,
      userRole: widget.selectedRole,
      email: email,
      phonenumber: phone,
    );
    memebers.add(member);
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    if (memebers.isNotEmpty){
       Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainNavigationScreen(mainPage: AllMemberListScreen(),)));


    showCustomSuccessToast(

      positionNumber: 70,
      context: context,
      message: "$firstName  $lastName has been added",
      color: AppColors.instance.teal300,
      icon: Icons.check_circle,
      iconColors: AppColors.instance.black600,
    );
    }
   
    
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
        ],
      ),
    );
  }

  Widget _buildBottomAction() {
    final formState = ref.watch(formProvider);
    // final isLoading = ref.watch(estateCodeSubmissionProvider).isLoading;

    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: ActionButton(
        label: 'Continue',
        onPressed:
            formState.allValid ? _submitForm : null,
      ),
    );
  }
}
