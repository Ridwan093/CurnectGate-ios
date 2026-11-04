import 'dart:developer';

import 'package:curnectgate/core/navigation/back_manageent/back_provider/provider.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/multi_select_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/adissonalFildformanager.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/property_widget.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/tenant_additional_fields.dart';
import 'package:curnectgate/features/member_management/medel/member_model.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/screen/loading_screen/loading_page.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
  final TextEditingController _emergencycontactname = TextEditingController();
  final TextEditingController _emergencycontactphone = TextEditingController();
  final TextEditingController _desgination = TextEditingController();
  String role(String role) {
    switch (role) {
      case "co-owner":
        return "spouse";
      case "family member":
        return "family_member";
      case "property manager":
        return "property_manager";

      default:
        return role;
    }
  }

  void _submitForm() {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final emergencycontactname = _emergencycontactname.text.trim();
    final emergencycontactphone = _emergencycontactphone.text.trim();
    final desgination = _desgination.text.trim();
    final propertyID = ref.read(formProvider).propertyId;
    final specializations = ref.watch(multiSelectProvider("Specializations"));
    final certifications = ref.watch(multiSelectProvider("Certifications"));

    log('First Name: $firstName');
    log('Last Name: $lastName');
    log('Email: $email');
    log('Phone: $phone');

    if (memebers.isNotEmpty ||
        _emailController.text.trim().isNotEmpty ||
        _firstNameController.text.trim().isNotEmpty ||
        _lastNameController.text.trim().isNotEmpty ||
        _phoneController.text.trim().isNotEmpty) {
      switch (widget.selectedRole.toLowerCase()) {
        case "co-owner":
        case "family member":
        case "staff":
          ref
              .read(formProvider.notifier)
              .addHouseHoold(
                firstname: firstName,
                lastname: lastName,
                role: role(widget.selectedRole.toLowerCase()),
                email: email,
                phonenumber: phone,
                ref: ref,
                context: context,
                propertyId: int.parse(propertyID ?? ""),
              );

          break;
        case "property manager":
          ref
              .read(formProvider.notifier)
              .addHousepropertyManager(
                firstname: firstName,
                lastname: lastName,
                role: role(widget.selectedRole.toLowerCase()),
                email: email,
                phonenumber: phone,
                ref: ref,
                context: context,
                propertyId: int.parse(propertyID ?? ""),
                desgination: desgination,
                emergencycontactname: emergencycontactname,
                emergencycontactphone: emergencycontactphone,
                specializations: specializations,
                certifications: certifications,
              );
          break;
        case "tenant":
          ref
              .read(formProvider.notifier)
              .addHouseTenant(
                firstname: firstName,
                lastname: lastName,
                role: role(widget.selectedRole.toLowerCase()),
                email: email,
                phonenumber: phone,
                ref: ref,
                context: context,
                propertyId: int.parse(propertyID ?? ""),

                emergencycontactname: emergencycontactname,
                emergencycontactphone: emergencycontactphone,
              );
         
        default:
      }

      _firstNameController.clear();
      _lastNameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _emergencycontactname.clear();
      _emergencycontactphone.clear();
      _desgination.clear();
      // ref.read(formProvider.notifier).restaddMemberFillds();
    }
    // context.goNamed(AppRoutes.getMemberInfo);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _emergencycontactname.dispose();
    _desgination.dispose();
    _emergencycontactphone.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isLoading = ref.watch(formProvider).addHouseHoldLoading;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isLoading ? null : _buildAppBar(),
      bottomNavigationBar:
          isLoading
              ? null
              : SafeArea(
                child: _buildBottomAction(widget.selectedRole.toLowerCase()),
              ),
      body:
          isLoading
              ? AppLoader(
                size: LoaderSize.large,
                color: AppColors.instance.yellow500,
                type: LoaderType.circular,
              )
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
    final backPressNotifier = ref.read(backPressProvider.notifier);
    final router = GoRouter.of(context);
    return AppBar(
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: () {
          backPressNotifier.reset();
          router.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new),
      ),
      // actions: [
      //   StepIndicator(current: widget.currentStep, total: widget.totalSteps),
      // ],
    );
  }

  Widget _buildContent() {
    final property = ref.read(formProvider).property;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          // const ProgressIndicators(
          //   currentStep: 4,
          //   totalSteps: 5,
          //   height: 2.0,
          //   borderRadius: 4.0,
          // ),
          // const SizedBox(height: 55),
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
              fontWeight: FontFamilies.medium,
            ),
          ),
          const SizedBox(height: 32),
          ReusabelProfileForm(
            controller: _firstNameController,
            fieldKey: 'firstName',
            fieldType: FieldType.name,
            hintText: 'Enter first name',
            label: 'First Name',
            onChanged: (value) {},
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
            onChanged: (value) {},
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
            onChanged: (value) {},
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
            onChanged: (value) {},
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
          PropertyWidget(currentValue: property ?? ""),
          const SizedBox(height: 16),
          _buildAdditionalFileds(widget.selectedRole.toLowerCase()),
        ],
      ),
    );
  }

  Widget _buildBottomAction(String role) {
    final formState = ref.watch(formProvider);
    final specializations = ref.watch(multiSelectProvider("Specializations"));
    final certifications = ref.watch(multiSelectProvider("Certifications"));
    switch (role) {
      case "co-owner":
      case "family member":
      case "staff":
        return ActionButton(
          label: 'Continue',
          onPressed: formState.allValidAddmember ? _submitForm : null,
        );
      case "tenant":
        return ActionButton(
          label: 'Continue',
          onPressed: formState.allValidAddTenant ? _submitForm : null,
        );
      case "property manager":
        return ActionButton(
          label: 'Continue',
          onPressed:
              formState.allValidAddmembermanager &&
                      specializations.isNotEmpty &&
                      certifications.isNotEmpty
                  ? _submitForm
                  : null,
        );
      default:
        return ActionButton(
          label: 'Continue',
          onPressed: formState.allValidAddmember ? _submitForm : null,
        );
    }
  }

  Widget _buildAdditionalFileds(String role) {
    // final formState = ref.watch(formProvider);

    switch (role) {
      case "co-owner":
      case "family member":
      case "staff":
        return SizedBox();
      case "tenant":
        return TenantAdditionalFields(
          desgination: _desgination,
          emergencyContactname: _emergencycontactname,
          emergencyContactphnoe: _emergencycontactphone,
        );
      case "property manager":
        return Adissonalfildformanager(
          desgination: _desgination,
          emergencyContactname: _emergencycontactname,
          emergencyContactphnoe: _emergencycontactphone,
        );

      default:
        return SizedBox();
    }
  }
}
