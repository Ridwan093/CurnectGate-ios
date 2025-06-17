import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/auth/presentation/screen/memeber_getstarted.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/stepcount.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart'
    show BaseVerificationScreen;
import 'package:curnectgate/features/member_management/profile_form/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpScreen extends BaseVerificationScreen {
  final String email;

  const OtpScreen(this.email, {super.key})
    : super(
        currentStep: 5,
        totalSteps: 5,
        title: "Confirm your identity",
        description: "Code sent via email ",
      );

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
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

          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
          ),
          const SizedBox(height: 10),

          _buildrichText(
            firsttext: widget.description,
            secondtext: widget.email,
            lasttext: ' please enter below',
          ),

          const SizedBox(height: 42),

          OtpInputField(
            activeColor: AppColors.instance.grey400,
            filledColor: AppColors.instance.yellow500,
            defaultColor: AppColors.instance.grey400,
            length: 6,
            onCompleted: (otp) {
              log('Completed OTP: $otp');

              // Handle OTP verification here
            },
          ),
          const SizedBox(height: 32),
          _buildResend(),
        ],
      ),
    );
  }

  Widget _buildResend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Didn't recieve a code? ",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 10,
            fontWeight: FontFamilies.light,
            color: AppColors.instance.black300,
          ),
        ),
        Text(
          "Resend",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 12,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black400,
          ),
        ),
      ],
    );
  }

  Widget _buildrichText({
    required String firsttext,
    required String secondtext,
    required lasttext,
  }) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontFamily: FontFamilies.interDisplay,
          fontWeight: FontFamilies.light,
        ),
        children: [
          TextSpan(text: firsttext),
          TextSpan(
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              fontSize: 11,
            ),
            text: secondtext,
          ),
          TextSpan(text: lasttext),
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
      child: ActionButton(
        label: 'Finish setup',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AuthOnboardingScreen()),
          );
        },
      ),
    );
  }
}
