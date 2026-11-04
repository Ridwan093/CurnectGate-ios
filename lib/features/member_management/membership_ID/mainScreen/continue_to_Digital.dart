import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/membership_ID/bottomSheet/member_Digital_buttomSeet.dart';
import 'package:curnectgate/features/member_management/membership_ID/provider/provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/estate_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MemberGetStart extends ConsumerWidget {
  const MemberGetStart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomSheet: _buildBottomButton(ref, context),
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildBottomButton(WidgetRef ref, BuildContext context) {
    return SafeArea(
      top: false,

      child: ActionButton(
        label: 'Continue',
        onPressed: () {
          ref.read(bottomSheetTypeProvider.notifier).state =
              BottomSheetType.startGenerate;
          ref.read(bottomSheetProvider.notifier).state = true;
          showBottomSheets(context, ref);
        },
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetPaths.employeeCad, width: 200, height: 200),
            SizedBox(height: 35),
            Text(
              "You are about to create your digital membership card",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 25,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Select "Continue" to create your membership card',
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 10,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back_ios, color: AppColors.instance.black600),
      ),
    );
  }
}
