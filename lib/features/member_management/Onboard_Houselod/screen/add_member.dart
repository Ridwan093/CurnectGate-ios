import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/screen/RoleSelection.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/onboard_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNewMember extends StatelessWidget {
  const AddNewMember({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.instance.black600,
      appBar: _buildAppBar(context),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPaths.addnewmember),
            fit: BoxFit.cover,
          ),
        ),
        child: _buildtopcontent(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          context.pop();
        },
        child: Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.instance.grey200,
        ),
      ),
    );
  }

  Widget _buildtopcontent(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(AssetPaths.addMember),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Add a co-owner, family member or staff to your property",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.grey200,
                      fontWeight: FontFamilies.bold,
                    ),
                  ),
                ],
              ),
            ),
            OnBoardButton(
              label: "Add new member",
              onPressed: () {
                ////domin rought change later
                ///MemberSelection
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MemberSelection()),
                );
              },
              bodycolor: AppColors.instance.grey200,
              textcolor: AppColors.instance.black500,
            ),
          ],
        ),
      ),
    );
  }
}
