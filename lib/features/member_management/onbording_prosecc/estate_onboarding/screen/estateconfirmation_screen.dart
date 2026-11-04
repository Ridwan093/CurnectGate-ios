import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/codeconfirmation_widget/address_card.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/progresscontainer.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/stepcount.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConfirmInfomation extends BaseVerificationScreen {
  final Map<String, dynamic>? estateData;
  const ConfirmInfomation({super.key, required this.estateData})
    : super(
        currentStep: 2,
        totalSteps: 6,
        title: 'Confirm your Estate information',
        description: '',
      );

  @override
  ConsumerState<ConfirmInfomation> createState() => _ConfirmInfomationState();
}

class _ConfirmInfomationState extends ConsumerState<ConfirmInfomation> {
  Future<void> _submitForm() async {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => MemberIdchecker()),
    // );

    context.pushNamed(AppRoutes.memberIdCheck, extra: widget.estateData);
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
          const SizedBox(height: 25),
          const ProgressIndicators(
            currentStep: 2,
            totalSteps: 6,
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

          const SizedBox(height: 32),

          AddressCard(
            icon: AssetPaths.locationInfo,
            address: widget.estateData?['address'] ?? "",
            code: widget.estateData?['estate_code'] ?? "",
            estateName: widget.estateData?['name'] ?? "",
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAction() {
    // final isLoading = ref.watch(estateCodeSubmissionProvider).isLoading;

    return ActionButton(label: 'Continue', onPressed: _submitForm);
  }
}
