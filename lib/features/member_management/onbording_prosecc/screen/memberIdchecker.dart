import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/model/estate_code_validator_state.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/code_check_widget/buildnotifymessage.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/code_check_widget/codeformfield.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/progresscontainer.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/stepcount.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/provider/member_code%20_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemberIdchecker extends BaseVerificationScreen {
  final Map<String, dynamic>? estateData;

  const MemberIdchecker({super.key, required this.estateData})
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
          ReUsableForm(label: "Menber ID", hintText: "eg 045679", length: 6),
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
    final formState = ref.watch(estateCodeFormProvider);
    final submitNotifier = ref.read(memberCodeSubmissionProvider.notifier);

    return ActionButton(
      label: 'Validate',
      onPressed:
          formState.isValid
              ? () {
                submitNotifier.submitCode(
                  context: context,
                  estateCode: widget.estateData?['estate_code'] ?? "",
                  estateName: widget.estateData?['name'] ?? "",
                  estateAddress: widget.estateData?['address'] ?? "",

                  estateLogo:
                      widget.estateData?['settings']?['image_url'] ?? "",
                );
                // log(widget.estateData!['image_url'].toString());
              }
              : null,
    );
  }
}
