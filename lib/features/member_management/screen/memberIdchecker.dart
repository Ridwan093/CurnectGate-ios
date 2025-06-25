import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/auth/data/repositories/estate_code_repository.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/code_check_widget/buildnotifymessage.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/code_check_widget/codeformfield.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/progresscontainer.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/stepcount.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemberIdchecker extends BaseVerificationScreen {
  const MemberIdchecker({super.key})
    : super(
        currentStep: 3,
        totalSteps: 5,
        title: 'Confirm Your Member ID',
        description:
            'Let’s confirm your member ID matches the record of the estate ',
      );

  @override
  ConsumerState<MemberIdchecker> createState() =>
      _EstateCodeVerificationScreenState();
}

class _EstateCodeVerificationScreenState
    extends ConsumerState<MemberIdchecker> {
  final _formKey = GlobalKey<ReUsableFormState>();
  bool _isValid = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState?.isValid ?? false) {
      final code = _formKey.currentState!.currentValue;
      await ref
          .read(memberCodeSubmissionProvider.notifier)
          .submitCode2(code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomAction(),
      body: _biuldbody(size),
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
          ReUsableForm(
            label: "Menber ID",
            hintText: "eg 045679",
            key: _formKey,
            onValidationChanged:
                (isValid) => setState(() => _isValid = isValid),
          ),
          const SizedBox(height: 24),
          const InfoMessage(
            icon: AssetPaths.location,
            message: 'Find this ID in your estate welcome letter/',
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAction() {
    final isLoading = ref.watch(estateCodeSubmissionProvider).isLoading;

    return ActionButton(
      label: 'Validate',
      onPressed: _isValid && !isLoading ? _submitForm : null,
    );
  }
}
