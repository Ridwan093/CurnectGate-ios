import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/notifications/screen/notification_permission.dart';
import 'package:curnectgate/features/member_management/medel/member_model.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/screen/add_member.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllMemberListScreen extends ConsumerWidget {
  const AllMemberListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(size, ref, context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: const Icon(Icons.arrow_back_ios_new),
      title: Text(
        "Add a member",
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontSize: 14,
          fontWeight: FontFamilies.bold,
          color: AppColors.instance.black600,
        ),
      ),
    );
  }

  Widget _buildBody(Size size, WidgetRef ref, BuildContext context) {
    return Column(
      children: [
        _buildAddMemberButton(size, context),
        const SizedBox(height: 30),
        Expanded(child: _buildContent(size, context, ref)),
      ],
    );
  }

  Widget _buildAddMemberButton(Size size, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddNewMember()),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColors.instance.black600,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Add Member +",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.grey200,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(Size size, BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Members",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 20,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Add or remove people who can use your family profile",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              fontWeight: FontFamilies.medium,
              color: AppColors.instance.black300,
            ),
          ),
          const SizedBox(height: 23),
          _buildListHeader(context),
          const SizedBox(height: 10),
          Expanded(
            child:
                memebers.isNotEmpty ? _buildMemberList(ref) : _buildEmtyBody(),
          ),
        ],
      ),
    );
  }

  Widget _buildListHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "First, last",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 10,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black500,
              ),
            ),
            const SizedBox(width: 5),
            const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationPermissionScreen(),
              ),
            );
          },
          child: Row(
            children: [
              const Icon(Icons.person_2_outlined, size: 16),
              const SizedBox(width: 5),
              Text(
                "4",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 10,
                  fontWeight: FontFamilies.bold,
                  color: AppColors.instance.black500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMemberList(WidgetRef ref) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: memebers.length,
      itemBuilder: (BuildContext context, int index) {
        final userinfo = memebers[index];
        return _buildListContent(userinfo, context, ref);
      },
    );
  }

  Widget _buildListContent(
    MemberModel userinfo,
    BuildContext context,
    WidgetRef ref,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 7),
      color: AppColors.instance.grey300,
      child: ListTile(
        onTap:
            () => showUserBottomSheet(
              context: context,
              headertitle: userinfo.userfirstName,
              headersubtitle: userinfo.userRole,
              ref: ref,
              bottom: BottomSheetView.permissions,
            ),
        leading: CircleAvatar(backgroundImage: AssetImage(userinfo.userpix)),
        title: Text(
          "${userinfo.userfirstName} ${userinfo.userlaseName}",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 15,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black600,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.instance.black600,
          size: 16,
        ),
        subtitle: Text(
          userinfo.userRole,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 12,
            fontWeight: FontFamilies.medium,
            color: AppColors.instance.black300,
          ),
        ),
      ),
    );
  }

  Widget _buildEmtyBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetPaths.addMember, height: 100, width: 100),
          SizedBox(height: 10),
          Text(
            "Members added to your profile appears here",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black300,
              fontSize: 12,
              fontWeight: FontFamilies.medium,
            ),
          ),
        ],
      ),
    );
  }
}
