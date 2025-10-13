import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/general_notification_count_widget.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:curnectgate/features/userProfile/Privacy_setting/provider/privacy_provider.dart';
import 'package:curnectgate/features/userProfile/notification_setting/widget/reusabTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserPrivacySettings extends ConsumerWidget {
  const UserPrivacySettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(ref, context),
      body: _buildBody(ref, context),
    );
  }

  Widget _buildAppbarBottom(WidgetRef ref) {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Set Privacy",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 20,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(WidgetRef ref, BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10), // Adjust height as needed
        child: Divider(
          color: AppColors.instance.black100,
        ), // This can be a Container, Row, etc.
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.instance.black600,
          size: 14,
        ),
      ),

      actions: [
        NotificationCount(
          onTap: () {
            context.pushNamed(AppRoutes.notification);
          },
        ),
      ],
    );
  }

  Widget _buildBody(WidgetRef ref, BuildContext context) {
    final privacyAsync = ref.watch(userPrivacyprovider);
    final formProviders = ref.read(formProvider.notifier);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(userPrivacyprovider.notifier)
              .refreshSettings(context, ref),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildAppbarBottom(ref),
            SizedBox(height: 10),

            privacyAsync.when(
              data: (privacy) {
                try {
                  final user = privacy?.data;
                  final privacys = user!.privacy;
                  // ignore: unnecessary_null_comparison
                  return user != null
                      ? Column(
                        children: [
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: privacys?.profileVisibility?.description ?? "",
                            title: privacys?.profileVisibility?.name ?? "",
                            isEnabled:
                                privacys?.profileVisibility?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppPrivacy(
                                slug: privacys?.profileVisibility?.name ?? "",
                                context: context,
                                key: "profile_visibility",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: privacys?.showEmail?.description ?? "",
                            title: privacys?.showEmail?.name ?? "",
                            isEnabled: privacys?.showEmail?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppPrivacy(
                                slug: privacys?.showEmail?.name ?? "",
                                context: context,
                                key: "show_email",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: privacys?.showPhone?.description ?? "",
                            title: privacys?.showPhone?.name ?? "",
                            isEnabled: privacys?.showPhone?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppPrivacy(
                                slug: privacys?.showPhone?.name ?? "",
                                context: context,
                                key: "show_phone",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                        ],
                      )
                      : EmptyBodys(message: "No Privacy Settings?");
                } catch (e) {
                  return Builderroul(
                    error: e.toString(),
                    onTap:
                        () => ref
                            .read(userPrivacyprovider.notifier)
                            .refreshSettings(context, ref),
                    firstMessae: "Faile to load Privacy Settings?",
                  );
                }
              },
              loading: () {
                try {
                  final privacy = ref.read(userPrivacyprovider).value;
                  final privacys = privacy?.data?.privacy;
                  return privacy != null && privacys != null
                      ? SingleChildScrollView(
                        child: Column(
                          children: [
                            BuildListTile(
                              ref: ref,
                              context: context,
                              dec:
                                  privacys.profileVisibility?.description ?? "",
                              title: privacys.profileVisibility?.name ?? "",
                              isEnabled:
                                  privacys.profileVisibility?.value ?? false,
                              onChanged: (value) async {
                                formProviders.updateAppPrivacy(
                                  slug: privacys.profileVisibility?.name ?? "",
                                  context: context,
                                  key: "profile_visibility",
                                  value: value,
                                  ref: ref,
                                );
                              },
                            ),
                            BuildListTile(
                              ref: ref,
                              context: context,
                              dec: privacys.showEmail?.description ?? "",
                              title: privacys.showEmail?.name ?? "",
                              isEnabled: privacys.showEmail?.value ?? false,
                              onChanged: (value) async {
                                formProviders.updateAppPrivacy(
                                  slug: privacys.showEmail?.name ?? "",
                                  context: context,
                                  key: "show_email",
                                  value: value,
                                  ref: ref,
                                );
                              },
                            ),
                            BuildListTile(
                              ref: ref,
                              context: context,
                              dec: privacys.showPhone?.description ?? "",
                              title: privacys.showPhone?.name ?? "",
                              isEnabled: privacys.showPhone?.value ?? false,
                              onChanged: (value) async {
                                formProviders.updateAppPrivacy(
                                  slug: privacys.showPhone?.name ?? "",
                                  context: context,
                                  key: "show_phone",
                                  value: value,
                                  ref: ref,
                                );
                              },
                            ),
                          ],
                        ),
                      )
                      : Loadingstates();
                } catch (e) {
                  return Builderroul(
                    error: e.toString(),
                    onTap:
                        () => ref
                            .read(userPrivacyprovider.notifier)
                            .refreshSettings(context, ref),
                    firstMessae: "Faile to load Privacy Settings?",
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
                  // Show cached data while loading if available
                  final privacy = ref.read(userPrivacyprovider).value;

                  final user = privacy?.data;
                  final privacys = user!.privacy;
                  if (privacy != null && privacy.data != null) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: privacys?.profileVisibility?.description ?? "",
                            title: privacys?.profileVisibility?.name ?? "",
                            isEnabled:
                                privacys?.profileVisibility?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppPrivacy(
                                slug: privacys?.profileVisibility?.name ?? "",
                                context: context,
                                key: "profile_visibility",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: privacys?.showEmail?.description ?? "",
                            title: privacys?.showEmail?.name ?? "",
                            isEnabled: privacys?.showEmail?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppPrivacy(
                                slug: privacys?.showEmail?.name ?? "",
                                context: context,
                                key: "show_email",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: privacys?.showPhone?.description ?? "",
                            title: privacys?.showPhone?.name ?? "",
                            isEnabled: privacys?.showPhone?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppPrivacy(
                                slug: privacys?.showPhone?.name ?? "",
                                context: context,
                                key: "show_phone",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          Emmergencybody(error: error.toString()),
                        ],
                      ),
                    );
                  }

                  // No cached data available
                  return Builderroul(
                    error: error.toString(),
                    onTap:
                        () => ref
                            .read(userPrivacyprovider.notifier)
                            .refreshSettings(context, ref),
                    firstMessae: "Faile to load Privacy Settings?",
                  );
                } catch (e) {
                  return Builderroul(
                    error: e.toString(),
                    onTap:
                        () => ref
                            .read(userPrivacyprovider.notifier)
                            .refreshSettings(context, ref),
                    firstMessae: "Faile to load Privacy Settings?",
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
