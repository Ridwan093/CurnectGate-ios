import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/general_notification_count_widget.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:curnectgate/features/userProfile/profile/provider/profile_provider.dart';
import 'package:curnectgate/features/userProfile/profile/widget/account_dropdown_menu.dart';
import 'package:curnectgate/features/userProfile/profile/widget/listTile.dart';
import 'package:curnectgate/features/userProfile/profile/widget/profileCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> with RouteAware {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userProfileProvider.notifier).refreshProfile(context, ref);
    });
  }

  @override
  void didPopNext() {
    // Refresh when returning to this screen
    ref.read(userProfileProvider.notifier).refreshProfile(context, ref);
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(userProfileProvider);
    final role = ref.watch(userRoleProvider);

    return Scaffold(
      appBar: _buildAppBar(ref: ref, context: context),
      body: RefreshIndicator(
        color: AppColors.instance.yellow500,
        onRefresh:
            () => ref
                .read(userProfileProvider.notifier)
                .refreshProfile(context, ref),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileAsync.when(
                data: (profile) {
                  try {
                    final user = profile?.data;
                    return user != null
                        ? Profilecard(
                          userProfileUrl: user.mediaUrl,
                          role: user.role,
                          username: user.fullName,
                          estateName: user.estateName,
                          memberId: user.memberCode,
                        )
                        : EmptyBodys(message: "No profile data?");
                  } catch (e) {
                    return Builderroul(
                      error: e.toString(),
                      onTap:
                          () => ref
                              .read(userProfileProvider.notifier)
                              .refreshProfile(context, ref),
                      firstMessae: "Faile to load profile?",
                    );
                  }
                },
                loading: () {
                  try {
                    final cachedProfile = ref.read(userProfileProvider).value;
                    return cachedProfile != null
                        ? Profilecard(
                          userProfileUrl: cachedProfile.data.mediaUrl,
                          role: cachedProfile.data.role,
                          username: cachedProfile.data.fullName,
                          estateName: cachedProfile.data.estateName,
                          memberId: cachedProfile.data.memberCode,
                        )
                        : Loadingstates();
                  } catch (e) {
                    return Builderroul(
                      error: e.toString(),
                      onTap:
                          () => ref
                              .read(userProfileProvider.notifier)
                              .refreshProfile(context, ref),
                      firstMessae: "Faile to load profile?",
                    );
                  }
                },
                error: (error, stack) {
                  try {
                    // Handle session expiration
                    if (error.toString().contains("Unauthenticated")) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref
                            .read(authProvider.notifier)
                            .seassionExpire(context, ref);
                      });
                      return Expiresessionbody();
                    }

                    // Try to show cached data
                    final cachedProfile = ref.read(userProfileProvider).value;
                    if (cachedProfile != null) {
                      return Column(
                        children: [
                          Profilecard(
                            userProfileUrl: cachedProfile.data.mediaUrl,
                            role: cachedProfile.data.role,
                            username: cachedProfile.data.fullName,
                            estateName: cachedProfile.data.estateName,
                            memberId: cachedProfile.data.memberCode,
                          ),
                          Emmergencybody(error: error.toString()),
                        ],
                      );
                    }

                    // No cached data available
                    return Builderroul(
                      error: error.toString(),
                      onTap:
                          () => ref
                              .read(userProfileProvider.notifier)
                              .refreshProfile(context, ref),
                      firstMessae: "Faile to load profile?",
                    );
                  } catch (e) {
                    return Builderroul(
                      error: e.toString(),
                      onTap:
                          () => ref
                              .read(userProfileProvider.notifier)
                              .refreshProfile(context, ref),
                      firstMessae: "Faile to load profile?",
                    );
                  }
                },
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

              // ... other widgets
              SizedBox(height: 25),
              BuildListTile(
                onTap: () async {},
                title: "Terms of Service",
                iconPath: AssetPaths.termsOfService,
              ),
              Divider(color: AppColors.instance.grey300),
              BuildListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => UserNotificationSettings(),
                  //   ),
                  // );
                  context.pushNamed(AppRoutes.userNotificationSetting);
                },
                title: "Manage Notifications",
                iconPath: AssetPaths.dashboardNotification,
              ),

              role.when(
                data: (data) {
                  if (data.isNotEmpty) {
                    if (data.toLowerCase().contains("security") ||
                        data.toLowerCase().contains("tenate")) {
                      return SizedBox();
                    } else {
                      return Column(
                        children: [
                          Divider(color: AppColors.instance.grey300),

                          BuildListTile(
                            onTap: () {
                              context.pushNamed(AppRoutes.getMemberInfo);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => AllMemberListScreen(),
                              //   ),
                              // );
                            },
                            title: "Manage Member",
                            iconPath: AssetPaths.userStar,
                          ),
                        ],
                      );
                    }
                  } else {
                    return SizedBox();
                  }
                },
                error: (e, s) {
                  return SizedBox();
                },
                loading: () {
                  return SizedBox();
                },
              ),
              Divider(color: AppColors.instance.grey300),
              BuildListTile(
                onTap: () {
                  context.pushNamed(AppRoutes.setPreferences);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PreferencesScreen(),
                  //   ),
                  // );
                },
                title: "Set Preference",
                iconPath: AssetPaths.preferences,
              ),
              Divider(color: AppColors.instance.grey300),
              BuildListTile(
                onTap: () {
                  context.pushNamed(AppRoutes.setPrivacy);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => UserPrivacySettings(),
                  //   ),
                  // );
                },
                title: "Set Privacy",
                iconPath: AssetPaths.setCurfew,
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
      ),
    );
  }

  // Widget _buildProfileCard(GetUserProfile? user) {
  //   return Profilecard(
  //     userProfileUrl: user?.data.mediaUrl ?? "",
  //     role: user?.data.role ?? "",
  //     username: user?.data.fullName ?? "",
  //     estateName: user?.data.estateName ?? "",
  //     memberId: user?.data.memberCode ?? "",
  //   );
  // }

  PreferredSizeWidget _buildAppBar({
    required WidgetRef ref,
    required BuildContext context,
  }) {
    return AppBar(
      leading: SizedBox.shrink(),
      leadingWidth: 0,
      centerTitle: false,
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
        NotificationCount(
          width: 10,
          onTap: () {
            context.pushNamed(AppRoutes.notification);
          },
        ),
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
              formstate.logOutLoading
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
}
