import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/navigation/back_manageent/back_provider/provider.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/model/estate_code_validator_state.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/provider/estate_code_repository.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/screen/loading_screen/loading_page.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/code_check_widget/buildnotifymessage.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/code_check_widget/codeformfield.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/progresscontainer.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/stepcount.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EstateCodeVerificationScreen extends BaseVerificationScreen {
  const EstateCodeVerificationScreen({super.key})
    : super(
        currentStep: 2,
        totalSteps: 5,
        title: 'Your estate code',
        description:
            'To confirm the estate you are registered to, enter your estate code',
      );

  @override
  ConsumerState<EstateCodeVerificationScreen> createState() =>
      _EstateCodeVerificationScreenState();
}

class _EstateCodeVerificationScreenState
    extends ConsumerState<EstateCodeVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(estateCodeFormProvider);
    // final asyncState = ref.watch(estateCodeSubmissionProvider);

    return Scaffold(
      appBar: !formState.isLoading ? _buildAppBar() : null,
      bottomNavigationBar: !formState.isLoading ? _buildBottomAction() : null,
      body:
          formState.isLoading
              ? AppLoader(size: LoaderSize.large, type: LoaderType.circular)
              : _buildBody(MediaQuery.sizeOf(context)),
    );
  }

  Widget _buildBody(Size size) {
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
      leading: InkWell(
        onTap: () {
          backPressNotifier.reset();
          router.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new),
      ),
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
          const SizedBox(height: 23),
          const ProgressIndicators(
            currentStep: 2,
            totalSteps: 5,
            height: 2.0,
            borderRadius: 4.0,
          ),
          const SizedBox(height: 40),
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
          ReUsableForm(label: "Estate ID", length: 10, hintText: 'eg 045679'),
          const SizedBox(height: 24),
          const InfoMessage(
            icon: AssetPaths.location,
            message:
                'You would have received your estate code from the management office',
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAction() {
    // final isLoading = ref.watch(estateCodeSubmissionProvider).isLoading;
    final formState = ref.watch(estateCodeFormProvider);
    final submitNotifier = ref.read(estateCodeSubmissionProvider.notifier);

    return ActionButton(
      label: 'Validate',
      onPressed:
          formState.isValid ? () => submitNotifier.submitCode(context) : null,
    );
  }
}
