import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/screen/loading_screen/loading_page.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/progresscontainer.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/stepcount.dart';
import 'package:curnectgate/features/member_management/profile_form/passwordform.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordScreen extends BaseVerificationScreen {
  final String role;
  final String memberCode;
  final String estateCode;
  final String userEmail;
  final String userPhone;
  final String digitalID;
  final String firstName;
  final String lastName;
  final String gender;
  final bool terms;

  const PasswordScreen({
    super.key,
    required this.userEmail,
    required this.userPhone,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.memberCode,
    required this.estateCode,
    required this.digitalID,
    required this.gender,
    required this.terms,
  }) : super(
         currentStep: 5,
         totalSteps: 5,
         title: "Hi $firstName.",
         description: "Let's cerate a password",
       );

  @override
  ConsumerState<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<PasswordScreen> {
  void _submitForm() {
    ref
        .read(formProvider.notifier)
        .completeRegristration(
          context: context,
          pass: '',
          firstName: widget.firstName,
          lasetName: widget.lastName,
          estateCode: widget.estateCode,
          memberCode: widget.memberCode,
          phnoneNumber: widget.userPhone,
          email: widget.userEmail,

          identityconfirmed: true,
          ref: ref,
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final state = ref.watch(formProvider);

    return Scaffold(
      appBar: state.creatPassLoading ? null : _buildAppBar(),
      bottomNavigationBar:
          state.creatPassLoading
              ? null
              : SafeArea(top: false, child: _buildBottomAction()),
      body:
          state.creatPassLoading
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
                widget.userEmail,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 11,
                ),
              ),
              Icon(Icons.keyboard_arrow_down_rounded, size: 20),
            ],
          ),
          const SizedBox(height: 32),
          PasswordInputField(
            hintText: "e.g Gre&&^#098",
            label: 'Creat a password ',
            showErroindicator: true,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAction() {
    return Consumer(
      builder: (context, ref, _) {
        final isValid = ref.watch(
          formProvider.select((state) => state.passValid),
        );
        return ActionButton(
          label: 'Finish setup',
          onPressed: isValid ? _submitForm : null,
        );
      },
    );
  }
}
