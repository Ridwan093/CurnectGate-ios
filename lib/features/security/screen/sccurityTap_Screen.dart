import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/navigation/back_manageent/back_widget/back_navigator.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/unread_counts_provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/image_tab.dart';
import 'package:curnectgate/features/member_management/screen/tab_screen/CommunityScreen.dart';
import 'package:curnectgate/features/member_management/tabState/tab_state.dart';
import 'package:curnectgate/features/security/provider/scanProvider.dart';
import 'package:curnectgate/features/security/screen/SecurityAdminScreen.dart';
import 'package:curnectgate/features/userProfile/profile/screen/ProfilesScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecurityTapScreen extends ConsumerWidget {
  const SecurityTapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(tabStateProvider);
    final tabController = ref.read(tabStateProvider.notifier);
    final isScanning = ref.watch(qrScanProvider);

    final tabCount = 3;
    final screenWidth = MediaQuery.of(context).size.width;
    final tabWidth = screenWidth / tabCount;

    final List<Widget> screens = [
      SecurityDashboard(),
      const CommunityScreen(),
      const ProfileScreen(),
    ];

    final bool isTablet = MediaQuery.of(context).size.width >= 600;

    return BackButtonHandler(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Row(
            children: [
              if (isTablet)
                Container(
                  width: 80,
                  color: Colors.white,
                  child: _buildNavigationRail(
                    currentIndex,
                    tabController,
                    ref, // ✅ PASS REF
                  ),
                ),

              Expanded(
                child: Builder(
                  builder: (context) {
                    if (!isTablet) {
                      return Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 600),
                          child: screens[currentIndex],
                        ),
                      );
                    }
                    return screens[currentIndex];
                  },
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar:
            isTablet || isScanning
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
                            ref,
                            index: 0,
                            currentIndex: currentIndex,
                            normalIcon: AssetPaths.navHome,
                            activeIcon: AssetPaths.navHomefilled,
                            label: 'Home',
                          ),
                          _buildTabItem(
                            context,
                            ref,
                            index: 1,
                            currentIndex: currentIndex,
                            normalIcon: AssetPaths.navMessages,
                            activeIcon: AssetPaths.navMessageactive,
                            label: 'Chats',
                          ),
                          _buildTabItem(
                            context,
                            ref,
                            index: 2,
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
                            tabWidth * currentIndex +
                            (tabWidth / 2) -
                            (tabWidth / 4),
                        child: Container(
                          width: tabWidth / 2,
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

  Widget _buildNavigationRail(
    int currentIndex,
    dynamic tabController,
    WidgetRef ref,
  ) {
    return NavigationRail(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) => tabController.setTab(index),
      labelType: NavigationRailLabelType.all,
      destinations: [
        _buildRailDestination(
          AssetPaths.navHomefilled,
          AssetPaths.navHome,
          "Home",
        ),
        _buildRailDestination(
          AssetPaths.navMessageactive,
          AssetPaths.navMessages,
          "Chats",
          index: 1, // ✅ chats index
          ref: ref,
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
    String label, {
    int? index,
    WidgetRef? ref,
  }) {
    final unreadAsync = ref?.watch(unreadCountsProvider);

    Widget buildIcon(String icon, bool isActive) {
      final base = ImageTab(
        label: label,
        normalImage: icon,
        activeImage: icon,
        isActive: isActive,
        size: 28,
      );

      return Stack(
        clipBehavior: Clip.none,
        children: [
          base,
          if (index == 1)
            unreadAsync!.when(
              data: (data) {
                final count = data?.totalUnreadMessages ?? 0;
                if (count > 0) {
                  return Positioned(top: -6, right: -6, child: _badge(count));
                } else {
                  return SizedBox.shrink();
                }
              },
              error: (error, stack) {
                try {
                  // Handle session expiration
                  if (error.toString().contains("Unauthorized")) {
                    return SizedBox.shrink();
                  }

                  // Try to show cached data
                  final cachedAdmin = ref?.read(unreadCountsProvider).value;
                  if (cachedAdmin?.totalUnreadMessages != null) {
                    final unreadCount = cachedAdmin?.totalUnreadMessages ?? 0;
                    return Positioned(
                      top: -6,
                      right: -6,
                      child: _badge(unreadCount),
                    );
                  }

                  // No cached data available
                  return SizedBox.shrink();
                } catch (e) {
                  return SizedBox.shrink();
                }
              },
              loading: () {
                return SizedBox.shrink();
              },
            ),
        ],
      );
    }

    return NavigationRailDestination(
      icon: buildIcon(inactiveIcon, false),
      selectedIcon: buildIcon(activeIcon, true),
      label: Text(label),
    );
  }

  BottomNavigationBarItem _buildTabItem(
    BuildContext context,
    WidgetRef ref, {
    required int index,
    required int currentIndex,
    required String normalIcon,
    required String activeIcon,
    required String label,
  }) {
    final unreadAsync = ref.watch(unreadCountsProvider);

    return BottomNavigationBarItem(
      icon: Column(
        children: [
          // Transparent space for the indicator
          Container(height: 3, color: Colors.transparent),
          const SizedBox(height: 4),
          Stack(
            clipBehavior: Clip.none,
            children: [
              ImageTab(
                label: label,
                normalImage: normalIcon,
                activeImage: activeIcon,
                isActive: currentIndex == index,
                size: 24,
              ),

              if (index == 1)
                unreadAsync.when(
                  data: (data) {
                    final count = data?.totalUnreadMessages ?? 0;
                    if (count > 0) {
                      return Positioned(
                        top: -6,
                        right: -6,
                        child: _badge(count),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                  error: (error, stack) {
                    try {
                      // Handle session expiration
                      if (error.toString().contains("Unauthorized")) {
                        return SizedBox.shrink();
                      }

                      // Try to show cached data
                      final cachedAdmin = ref.read(unreadCountsProvider).value;
                      if (cachedAdmin?.totalUnreadMessages != null) {
                        final unreadCount =
                            cachedAdmin?.totalUnreadMessages ?? 0;
                        return Positioned(
                          top: -6,
                          right: -6,
                          child: _badge(unreadCount),
                        );
                      }

                      // No cached data available
                      return SizedBox.shrink();
                    } catch (e) {
                      return SizedBox.shrink();
                    }
                  },
                  loading: () {
                    return SizedBox.shrink();
                  },
                ),
            ],
          ),
        ],
      ),
      label: label,
    );
  }

  Widget _badge(int count) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.instance.teal400,
        shape: BoxShape.circle,
      ),
      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
      child: Center(
        child: Text(
          count > 99 ? '99+' : count.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
