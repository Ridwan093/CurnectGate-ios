import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/screen/tab_screen/allmemberScreen.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:curnectgate/features/userProfile/SetPreference.dart';
import 'package:curnectgate/features/userProfile/profile/provider/profile_provider.dart';
import 'package:curnectgate/features/userProfile/profile/widget/account_dropdown_menu.dart';
import 'package:curnectgate/features/userProfile/profile/widget/profileCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(userProfileProvider);

    // final preferences = ref.watch(userPreferencesProvider);
    // final privacySettings = ref.watch(userPrivacyProvider);
    return Scaffold(
      appBar: _buildAppBar(ref: ref, context: context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileAsync.when(
              data: (profile) {
                final user = profile.data;
                return Profilecard(
                  userProfileUrl: user!.mediaUrl ?? "",
                  role: user.role ?? "",
                  username: user.fullName ?? "",
                  estateName: user.estateName ?? "",
                  memberId: user.memberCode ?? "",
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Text(error.toString()),
            ),

            SizedBox(height: 25),
            Text(
              "Settings",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 19,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
              ),
            ),
            SizedBox(height: 25),
            _buildSettingTile(
              onTap: () async {
                final authData = await SharedPrefsService().getAuthData();
                final token = authData?['access_token'] as String?;
                // Extract token from auth data
                log(token!);
              },
              title: "Terms of Service",
              iconPath: AssetPaths.termsOfService,
            ),
            Divider(color: AppColors.instance.grey300),
            _buildSettingTile(
              onTap: () {
                showUserBottomSheet(
                  context: context,
                  headertitle: "",
                  headersubtitle: "",
                  ref: ref,
                  bottom: BottomSheetView.profilePiceUpdate,
                );
              },
              title: "Manage notifications",
              iconPath: AssetPaths.dashboardNotification,
            ),
            Divider(color: AppColors.instance.grey300),
            _buildSettingTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllMemberListScreen(),
                  ),
                );
              },
              title: "Manage Member",
              iconPath: AssetPaths.userStar,
            ),
            Divider(color: AppColors.instance.grey300),
            _buildSettingTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Setpreference()),
                );
              },
              title: "Set Preference",
              iconPath: AssetPaths.preferences,
            ),
            Divider(color: AppColors.instance.grey300),
            _buildSettingTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Setpreference()),
                );
              },
              title: "Set Privaciy",
              iconPath: AssetPaths.waterDrop,
            ),
            _buildSignOut(
              ref: ref,
              iconPath: AssetPaths.logOut,
              title: "Sign out",
              onTap: () {
                ref
                    .read(authProvider.notifier)
                    .logOut(ref: ref, context: context);
              },
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar({
    required WidgetRef ref,
    required BuildContext context,
  }) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Profile",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 19,
            color: AppColors.instance.black600,
            fontWeight: FontFamilies.bold,
          ),
        ),
      ),

      actions: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: InkWell(
        //     onTap: () async {
        //       // Extract tok
        //     },
        //     child: Icon(
        //       Icons.settings_outlined,
        //       color: AppColors.instance.black600,
        //     ),
        //   ),
        // ),
        AccountDropdownMenu(),
        SizedBox(width: 12),
      ],
    );
  }

  Widget _buildSignOut({
    required String iconPath,
    required String title,
    required VoidCallback onTap,
    required WidgetRef ref,
  }) {
    final formstate = ref.watch(formProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 90),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 8,
                children: [
                  Image.asset(iconPath, width: 24),
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,
                      fontSize: 17,
                      fontWeight: FontFamilies.light,
                    ),
                  ),
                ],
              ),
              formstate.isLoading
                  ? CircularProgressIndicator(
                    color: AppColors.instance.yellow500,
                  )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required String iconPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 8,
              children: [
                Image.asset(iconPath, width: 24),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                    fontSize: 14,
                    fontWeight: FontFamilies.bold,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.instance.black600,
            ),
          ],
        ),
      ),
    );
  }
}
