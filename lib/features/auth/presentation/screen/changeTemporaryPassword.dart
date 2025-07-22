import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/auth/widget/tempt_pass_form.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/screen/loading_screen/loading_page.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChangeTemporaryPassword extends BaseVerificationScreen {
  final String token;
  const ChangeTemporaryPassword({super.key, required this.token})
    : super(
        currentStep: 4,
        totalSteps: 5,
        title: "Hey .👋🏻",
        description: 'Let get your password change',
      );

  @override
  ConsumerState<ChangeTemporaryPassword> createState() => _SignInState();
}

class _SignInState extends ConsumerState<ChangeTemporaryPassword> {
  void _submitForm() {
    ref
        .read(formProvider.notifier)
        .changeTemporaryPass(context: context, ref: ref, token: widget.token);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final state = ref.watch(formProvider);

    return Scaffold(
      appBar: state.changTemporyPassLoading ? null : _buildAppBar(),
      bottomNavigationBar:
          state.changTemporyPassLoading ? null : _buildBottomAction(),
      body:
          state.changTemporyPassLoading
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
      leading: InkWell(
        onTap: () => context.pop(),

        child: const Icon(Icons.arrow_back_ios_new),
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

          PasswordInput(
            hintText: "rge738\$..",
            label: 'Current password',
            onChanged: (value) {
              ref.read(formProvider.notifier).updatecurrentPass(value);
            },
            showErroindicator: false,
          ),
          const SizedBox(height: 8),

          PasswordInput(
            hintText: "rge738\$..",
            label: 'New  password',
            onChanged: (value) {
              ref.read(formProvider.notifier).updateCreateNewPass(value);
            },
            showErroindicator: false,
          ),
          const SizedBox(height: 8),
          PasswordInput(
            hintText: "rge738\$..",
            label: 'Cornfirm  password',
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
      formProvider.select((state) => state.alltemptpassValid),
    );
    return ActionButton(
      label: 'Change',
      onPressed: isOtpComplete ? _submitForm : null,
    );
  }
}
