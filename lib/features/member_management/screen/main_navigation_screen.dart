import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/navigation/back_manageent/back_widget/back_navigator.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/image_tab.dart';
import 'package:curnectgate/features/member_management/screen/tab_screen/CommunityScreen.dart';
import 'package:curnectgate/features/member_management/tabState/tab_state.dart';
import 'package:curnectgate/features/payment/screen/PaymentScreen.dart';
import 'package:curnectgate/features/userProfile/profile/screen/ProfilesScreen.dart';
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

    // Detect tablet
    final bool isTablet = MediaQuery.of(context).size.width >= 600;

    return BackButtonHandler(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Row(
            children: [
              // Tablet: Show NavigationRail on left
              if (isTablet)
                Container(
                  width: 80,
                  color: Colors.white,
                  child: _buildNavigationRail(currentIndex, tabController),
                ),

              // Main content — full on tablet, constrained on phone for beauty
              Expanded(
                child:
                    isTablet
                        ? screens[currentIndex] // Full width on tablet
                        : Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: screens[currentIndex],
                          ),
                        ),
              ),
            ],
          ),
        ),

        // Phone: BottomNavigationBar
        bottomNavigationBar:
            isTablet
                ? null
                : Container(
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
                      // Indicator
                      Positioned(
                        top: 0,
                        left:
                            MediaQuery.of(context).size.width /
                                4 *
                                currentIndex +
                            (MediaQuery.of(context).size.width / 8) -
                            (MediaQuery.of(context).size.width / 14),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: 3,
                          color: AppColors.instance.teal300,
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }

  Widget _buildNavigationRail(int currentIndex, dynamic tabController) {
    return NavigationRail(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) => tabController.setTab(index),
      labelType: NavigationRailLabelType.all,
      backgroundColor: Colors.white,
      indicatorColor: AppColors.instance.teal100,
      selectedIconTheme: IconThemeData(color: AppColors.instance.teal400),
      unselectedIconTheme: IconThemeData(color: AppColors.instance.black400),
      minWidth: 80, // Keeps it compact and clean
      // leading: const SizedBox(height: 20), // Top padding
      // trailing: const SizedBox(
      //   height: 20,
      // ), // Bottom padding (optional, can add safe area)
      // This is the key: distribute items evenly with space between
      groupAlignment:
          .9, //  -1 = top, 0 = center, 1 = bottom → we want centered like mobile

      destinations: [
        _buildRailDestination(
          AssetPaths.navHomefilled,
          AssetPaths.navHome,
          "Home",
        ),
        _buildRailDestination(
          AssetPaths.navMessageactive,
          AssetPaths.navMessages,
          "Community",
        ),
        _buildRailDestination(
            AssetPaths.navCreditCardFilled,
          AssetPaths.navCreditCard,
        
          "Payment",
        ),
        _buildRailDestination(
          AssetPaths.navProfileActive,
          AssetPaths.navProfileInactive,
          "Profile",
        ),
      ],
    );
  }

  NavigationRailDestination _buildRailDestination(
    String activeIcon,
    String inactiveIcon,
    String label,
  ) {
    return NavigationRailDestination(
      icon: ImageTab(
        normalImage: inactiveIcon,
        activeImage: inactiveIcon,
        isActive: false,
        size: 28,
      ),
      selectedIcon: ImageTab(
        normalImage: activeIcon,
        activeImage: activeIcon,
        isActive: true,
        size: 28,
      ),
      label: Text(
        label,
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontWeight: FontFamilies.bold,
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
