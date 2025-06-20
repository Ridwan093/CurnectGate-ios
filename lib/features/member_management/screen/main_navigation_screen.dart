import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/screen/tab_screen/CommunityScreen.dart';
import 'package:curnectgate/features/member_management/screen/tab_screen/PaymentScreen.dart';
import 'package:curnectgate/features/member_management/screen/tab_screen/ProfilesScreen.dart';
import 'package:curnectgate/features/member_management/tabState/image_tab.dart';
import 'package:curnectgate/features/member_management/tabState/tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainNavigationScreen extends ConsumerWidget {
  final Widget mainPage;
  const MainNavigationScreen({super.key, required this.mainPage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(tabStateProvider);
    final tabController = ref.read(tabStateProvider.notifier);

    final List<Widget> screens = [
       mainPage,
      const CommunityScreen(),
      const PaymentScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Stack(
          children: [
            BottomNavigationBar(
              selectedItemColor: AppColors.instance.black600,

              selectedLabelStyle: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
              ),
              currentIndex: currentIndex,
              onTap: (index) => tabController.setTab(index),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              elevation: 0,
              items: [
                _buildTabItem(
                  context,
                  index: 0,
                  currentIndex: currentIndex,
                  normalIcon: AssetPaths.navHome,
                  activeIcon: AssetPaths.navHomefilled,
                  label: 'Home',
                ),
                _buildTabItem(
                  context,
                  index: 1,
                  currentIndex: currentIndex,
                  normalIcon: AssetPaths.navMessages,
                  activeIcon: AssetPaths.navMessageactive,
                  label: 'Community',
                ),
                _buildTabItem(
                  context,
                  index: 2,
                  currentIndex: currentIndex,
                  normalIcon: AssetPaths.navCreditCard,
                  activeIcon: AssetPaths.navCreditCardFilled,
                  label: 'Payments',
                ),
                _buildTabItem(
                  context,
                  index: 3,
                  currentIndex: currentIndex,
                  normalIcon: AssetPaths.navProfileInactive,
                  activeIcon: AssetPaths.navProfileActive,
                  label: 'Profile',
                ),
              ],
            ),
            // Indicator above active tab
            Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width / 4 * currentIndex,

              child: Container(
                margin: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width / 7,
                height: 3,
                color: AppColors.instance.teal300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildTabItem(
    BuildContext context, {
    required int index,
    required int currentIndex,
    required String normalIcon,
    required String activeIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          // Transparent space for the indicator
          Container(height: 3, color: Colors.transparent),
          const SizedBox(height: 4),
          ImageTab(
            normalImage: normalIcon,
            activeImage: activeIcon,
            isActive: currentIndex == index,
            size: 24,
          ),
        ],
      ),
      label: label,
    );
  }
}
