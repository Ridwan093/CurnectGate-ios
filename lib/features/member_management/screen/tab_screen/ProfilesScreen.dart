import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/userProfile/SetPreference.dart';
import 'package:curnectgate/features/member_management/screen/tab_screen/allmemberScreen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildprofilCard(),

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
              onTap: () {},
              title: "Terms of Service",
              iconPath: AssetPaths.termsOfService,
            ),
            Divider(color: AppColors.instance.grey300),
            _buildSettingTile(
              onTap: () {},
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
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetPaths.dashboardNotification, width: 30),
        ),
      ],
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

  Widget _buildprofilCard() {
    return Material(
      elevation: .7,
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(12),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Expanded(
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColors.instance.teal300,
                      image: DecorationImage(
                        image: AssetImage(AssetPaths.userAvatar1),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sam Ben",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 14,
                            fontWeight: FontFamilies.bold,
                            color: AppColors.instance.black600,
                          ),
                        ),
                        Text(
                          "Greenville Esate",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 10,
                            fontWeight: FontFamilies.bold,
                            color: AppColors.instance.black600,
                          ),
                        ),
                        Text(
                          "Owner",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 12,
                            fontWeight: FontFamilies.bold,
                            color: AppColors.instance.black300,
                          ),
                        ),
                        Text(
                          "#45859",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 12,
                            fontWeight: FontFamilies.bold,
                            color: AppColors.instance.grey400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetPaths.qr,
                  color: AppColors.instance.teal300,
                  width: 20,
                ),
                Text(
                  "My QR",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 12,
                    fontWeight: FontFamilies.bold,
                    color: AppColors.instance.grey400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
