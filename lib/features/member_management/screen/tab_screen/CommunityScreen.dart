import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityScreen extends BaseVerificationScreen {
  const CommunityScreen({super.key})
    : super(
        currentStep: 4,
        totalSteps: 5,
        title: "Hi Sam!👋🏻",
        description: 'Start a Conversation',
      );

  @override
  ConsumerState<CommunityScreen> createState() => _SignInState();
}

class _SignInState extends ConsumerState<CommunityScreen> {
  void _submitForm() {
    showUserBottomSheet(
      context: context,
      headertitle: "Star a conversation",
      headersubtitle: "A team typicall replies in less than a minute",
      ref: ref,
      bottom: BottomSheetView.startConversation,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      floatingActionButton: _buildAction(),
      appBar: _buildAppBar(),
      body: _biuldbody(size),
    );
  }

  Widget _biuldbody(Size size) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: _buildEmtyBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(leading: const Icon(Icons.arrow_back_ios_new));
  }

  //turn this to Emtey body
  Widget _buildEmtyBody() {
    return SingleChildScrollView(
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
          SizedBox(
            height: 300,
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Image.asset(AssetPaths.emtymeesage, height: 80, width: 80),
                Text(
                  "Your conversation appears here, start a conversation with an estate commitee or estate security",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 12,
                    color: AppColors.instance.black300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAction() {
    return FloatingActionButton(
      shape: CircleBorder(),

      onPressed: _submitForm,
      backgroundColor: AppColors.instance.black600,
      child: Icon(Icons.add, color: AppColors.instance.grey200),
    );
  }
}
