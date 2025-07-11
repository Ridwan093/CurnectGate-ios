import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/screen/loading_screen/loading_page.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/stepcount.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart'
    show BaseVerificationScreen;
import 'package:curnectgate/features/member_management/profile_form/otp_form.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpScreen extends BaseVerificationScreen {
  final Map<String, dynamic>? data;

  const OtpScreen(this.data, {super.key})
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
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final state = ref.watch(formProvider);

    return Scaffold(
      appBar: state.isLoading ? null : _buildAppBar(),
      bottomNavigationBar:
          state.isLoading
              ? null
              : _buildVerifyButton(
                widget.data!["email"] ?? "",
                _otpController.text.trim(),
                context,
              ),
      body:
          state.isLoading
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

          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
          ),
          const SizedBox(height: 10),

          _buildEmailRichText(
            firstText: widget.description,
            email: widget.data!["email"] ?? "",
            lastText: ' please enter below',
            visibleStartChars: 3,
            visibleEndChars: 3,
          ),

          // Displays: "exa****ser@domain.com"
          const SizedBox(height: 42),

          OtpInputField(
            controller: _otpController,
            activeColor: AppColors.instance.yellow500,
            filledColor: AppColors.instance.yellow500,
            defaultColor: AppColors.instance.grey400,
            length: 6,
            onChanged: (value) {
              log(value);
              ref
                  .read(formProvider.notifier)
                  .updateOtp(value, value.isNotEmpty);
            },
          ),
          const SizedBox(height: 32),
          _buildResend(widget.data!["email"] ?? ""),
        ],
      ),
    );
  }

  Widget _buildResend(String email) {
    final formState = ref.watch(formProvider);
    final formNotifier = ref.read(formProvider.notifier);
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
        InkWell(
          onTap:
              formState.isResendOtpEnabled
                  ? () => formNotifier.requestNewOtp(
                    context: context,
                    email: email,
                    ref: ref,
                  )
                  : null,
          child: Text(
            formState.isResendOtpEnabled
                ? 'Resend'
                : 'Wait ${formState.resendCountdownTime}s',
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailRichText({
    required String email,
    required String firstText,
    required String lastText,
    int visibleStartChars = 3,
    int visibleEndChars = 3,
  }) {
    // Split the email into parts
    final atIndex = email.indexOf('@');
    if (atIndex == -1) return Text(email); // Not a valid email format

    final username = email.substring(0, atIndex);
    final domain = email.substring(atIndex);

    // Hide middle characters of username
    final hiddenUsername =
        username.length > (visibleStartChars + visibleEndChars)
            ? '${username.substring(0, visibleStartChars)}${'*' * (username.length - visibleStartChars - visibleEndChars)}${username.substring(username.length - visibleEndChars)}'
            : username; // Show full if too short

    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontFamily: FontFamilies.interDisplay,
          fontWeight: FontFamilies.light,
        ),
        children: [
          TextSpan(
            text: firstText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: FontFamilies.interDisplay,

              fontWeight: FontFamilies.light,
            ),
          ),
          TextSpan(
            text: hiddenUsername + domain,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              fontSize: 12,
            ),
          ),

          TextSpan(
            text: lastText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.light,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifyButton(String email, String otp, BuildContext context) {
    final isOtpComplete = ref.watch(
      formProvider.select((state) => state.isOtpComplete),
    );
    return ActionButton(
      label: 'Verify OTP',
      onPressed:
          isOtpComplete
              ? () {
              
                ref
                    .read(formProvider.notifier)
                    .verifyOTP(
                      context: context,
                      email: email,
                      otp: otp,
                      ref: ref,
                    );
              }
              : null,
    );
  }
}
