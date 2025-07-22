import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/screen/loading_screen/loading_page.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:curnectgate/features/member_management/profile_form/passwordform.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPassword extends BaseVerificationScreen {
  final String token;
  final String localEmail;
  const NewPassword({super.key, required this.localEmail, required this.token})
    : super(
        currentStep: 4,
        totalSteps: 5,
        title: "Hey .👋🏻",
        description: 'You almost there ',
      );

  @override
  ConsumerState<NewPassword> createState() => _SignInState();
}

class _SignInState extends ConsumerState<NewPassword> {
  void _submitForm() {
    log(widget.token.toString());
    log(widget.localEmail.toString());
    ref
        .read(formProvider.notifier)
        .creatNewPassword(
          context: context,
          email: widget.localEmail,
          token: widget.token.toString(),
          ref: ref,
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final state = ref.watch(formProvider);

    return Scaffold(
      appBar: state.creatPassLoading ? null : _buildAppBar(),
      bottomNavigationBar: state.creatPassLoading ? null : _buildBottomAction(),
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
      actions: [_buildTextButton()],
    );
  }

  Widget _buildTextButton() {
    return InkWell(
      onTap: () {
        // domin rought change later
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => PasswordScreen(Str)
        //   ),
        // );
      },
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
          PasswordInputField(
            hintText: "rge738\$..",
            label: 'Create a password',
            onChanged: (value) {
              ref.read(formProvider.notifier).updateCreateNewPass(value);
            },
            showErroindicator: false,
          ),
          const SizedBox(height: 8),
          PasswordInputField(
            hintText: "rge738\$..",
            label: 'cornfirm a password',
            onChanged: (value) {
              ref.read(formProvider.notifier).updateConfirmNewPass(value);
            },
            showErroindicator: true,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAction() {
    final isOtpComplete = ref.watch(
      formProvider.select((state) => state.allNewpassValid),
    );
    return ActionButton(
      label: 'Continue',
      onPressed: isOtpComplete ? _submitForm : null,
    );
  }
}
