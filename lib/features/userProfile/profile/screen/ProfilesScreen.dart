import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/workformprovider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/tabState/tab_state.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/general_notification_count_widget.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:curnectgate/features/userProfile/profile/provider/profile_provider.dart';
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
      backgroundColor: Colors.white,
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
                          onTap: () {
                            context.pushNamed(
                              AppRoutes.profileDeatil,
                              extra: {
                                "userProfilePix": user.mediaUrl,
                                "userName": user.fullName,
                                "userRole": user.role.replaceAll("_", " "),
                                "memberId": user.memberCode,

                                "estateName": user.estateName,
                                "lastLogin": user.lastLoginAt?.hour.toString(),
                                "email": user.email,
                                "phoneNumber": user.phone,
                              },
                            );
                          },
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
                          onTap: () {
                            context.pushNamed(
                              AppRoutes.profileDeatil,
                              extra: {
                                "userProfilePix": cachedProfile.data.mediaUrl,
                                "userName": cachedProfile.data.fullName,
                                "userRole": cachedProfile.data.role,
                                "memberId": cachedProfile.data.memberCode,

                                "estateName": cachedProfile.data.estateName,
                                "lastLogin":
                                    cachedProfile.data.lastLoginAt?.hour
                                        .toString(),
                                "email": cachedProfile.data.email,
                                "phoneNumber": cachedProfile.data.phone,
                              },
                            );
                          },
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
                    if (error.toString().contains("Unauthorized")) {
                      return Expiresessionbody();
                    }

                    // Try to show cached data
                    final cachedProfile = ref.read(userProfileProvider).value;
                    if (cachedProfile != null) {
                      return Column(
                        children: [
                          Profilecard(
                            onTap: () {
                              context.pushNamed(
                                AppRoutes.profileDeatil,
                                extra: {
                                  "userProfilePix": cachedProfile.data.mediaUrl,
                                  "userName": cachedProfile.data.fullName,
                                  "userRole": cachedProfile.data.role,
                                  "memberId": cachedProfile.data.memberCode,

                                  "estateName": cachedProfile.data.estateName,
                                  "lastLogin":
                                      cachedProfile.data.lastLoginAt?.hour
                                          .toString(),
                                  "email": cachedProfile.data.email,
                                  "phoneNumber": cachedProfile.data.phone,
                                },
                              );
                            },
                            userProfileUrl: cachedProfile.data.mediaUrl,
                            role: cachedProfile.data.role,
                            username: cachedProfile.data.fullName,
                            estateName: cachedProfile.data.estateName,
                            memberId: cachedProfile.data.memberCode,
                          ),
                          // Emmergencybody(error: error.toString()),
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
              SizedBox(height: 10),
              Divider(color: AppColors.instance.grey300),
              SizedBox(height: 10),
              _buildRow(context, ref),
              SizedBox(height: 10),
              Divider(color: AppColors.instance.grey300),
              SizedBox(height: 10),

              BuildListTile(
                onTap: () async {
                  context.pushNamed(AppRoutes.termsAndcondition);
                },
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
                    if (data.toLowerCase().contains("landlord") ||
                        data.toLowerCase().contains("spouse")) {
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
                    } else {
                      return SizedBox();
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
                  context.pushNamed(AppRoutes.manageLoging);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => AllMemberListScreen(),
                  //   ),
                  // );
                },
                title: "Account Settings",
                iconPath: AssetPaths.loginSetting,
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

  Widget _buildSignOut({
    required String iconPath,
    required String title,
    required VoidCallback onTap,
    required WidgetRef ref,
  }) {
    final formstate = ref.watch(formProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 50),
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

  // Widget _buildProfileCard(GetUserProfile? user) {
  //   return Profilecard(
  //     userProfileUrl: user?.data.mediaUrl ?? "",
  //     role: user?.data.role ?? "",
  //     username: user?.data.fullName ?? "",
  //     estateName: user?.data.estateName ?? "",
  //     memberId: user?.data.memberCode ?? "",
  //   );
  // }
  Widget _buildRow(BuildContext context, WidgetRef ref) {
    final reminderprovider = ref.read(reminderProvider.notifier);
    final notifier = ref.read(workOrderFormProvider.notifier);
    return Wrap(
      // runAlignment: WrapAlignment.spaceBetween,
      spacing: 5, // horizontal space
      runSpacing: 10,
      children: [
        _builddirectriyButton(
          title: "Directory",
          icon: Icons.home_outlined,
          color: AppColors.instance.yellow300,
          onTap: () {
            context.pushNamed(AppRoutes.residentDirectory);
          },
        ),

        _builddirectriyButton(
          title: "Chats",
          icon: Icons.chat_bubble_outline,
          color: AppColors.instance.teal300.withOpacity(.6),
          onTap: () {
            ref.read(tabStateProvider.notifier).resetTochat();
          },
        ),
        _builddirectriyButton(
          title: "Events",
          icon: Icons.event,
          color: AppColors.instance.blue100,
          onTap: () {
            reminderprovider.resetAll();
            notifier.updateEndDate(null);
            notifier.updateStartDate(null);
            notifier.updateWorkType("", 0);
            showUserBottomSheet(
              context: context,
              headertitle: "",
              headersubtitle: "",
              ref: ref,
              bottom: BottomSheetView.seletctEvent,
            );
          },
        ),
      ],
    );
  }

  Widget _builddirectriyButton({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,

          children: [
            Icon(icon, color: AppColors.instance.black600, size: 20),
            SizedBox(width: 10),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
              ),
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
      backgroundColor: Colors.white,
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
            final role = ref.watch(userRoleProvider).value;
            if (role != null && role.contains("security")) {
              context.pushNamed(AppRoutes.securitynotification);
            } else if (role != null) {
              context.pushNamed(AppRoutes.notification);
            }
          },
        ),

        SizedBox(width: 12),
      ],
    );
  }
}
