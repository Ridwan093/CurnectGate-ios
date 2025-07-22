import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:curnectgate/features/userProfile/notification_setting/provider/NotificationSettings_provider.dart';
import 'package:curnectgate/features/userProfile/notification_setting/widget/reusabTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotificationSettings extends ConsumerWidget {
  const UserNotificationSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(ref, context),
      body: _buildBody(ref, context),
    );
  }

  Widget _buildAppbarBottom(WidgetRef ref) {
    final state = ref.watch(formProvider);
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Set Notification",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 20,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
            ),
            if (state.notificationSettingLoading)
              SizedBox(
                height: 35,
                width: 35,
                child: CircularProgressIndicator(
                  color: AppColors.instance.yellow500,
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
          color: AppColors.instance.grey400,
        ), // This can be a Container, Row, etc.
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.instance.black600,
          size: 14,
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

  Widget _buildBody(WidgetRef ref, BuildContext context) {
    final profileAsync = ref.watch(userNotificationSettinProvider);
    final formProviders = ref.read(formProvider.notifier);
    // final isError = ref.watch(formProvider).notificationsettingerror;

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(userNotificationSettinProvider.notifier)
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

            //////---------------- NEW DATA APPEAR HER --------------------->
            profileAsync.when(
              data: (notificationSettings) {
                try {
                  final user = notificationSettings?.data;
                  final notification = user!.notifications;
                  // ignore: unnecessary_null_comparison
                  return user != null
                      ? Column(
                        children: [
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: notification?.email?.description ?? "",
                            title: notification?.email?.name ?? "Email",
                            isEnabled: notification?.email?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "email",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: notification?.sms?.description ?? "",
                            title: notification?.sms?.name ?? "SMS",
                            isEnabled: notification?.sms?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "sms",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: notification?.maintenance?.description ?? "",
                            title:
                                notification?.maintenance?.name ??
                                "Maintenance",
                            isEnabled:
                                notification?.maintenance?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "maintenance",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec:
                                notification?.maintenanceAlerts?.description ??
                                "",
                            title:
                                notification?.maintenanceAlerts?.name ??
                                "Maintenance Alerts",
                            isEnabled:
                                notification?.maintenanceAlerts?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key:
                                    notification?.maintenanceAlerts?.key ??
                                    "maintenance_alerts",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec:
                                notification?.paymentReminders?.description ??
                                "",
                            title:
                                notification?.paymentReminders?.name ??
                                "Payment Reminders",
                            isEnabled:
                                notification?.paymentReminders?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "payment_reminders",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: notification?.payments?.description ?? "",
                            title: notification?.payments?.name ?? "Payments",
                            isEnabled: notification?.payments?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "payments",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: notification?.community?.description ?? "",
                            title: notification?.community?.name ?? "Community",
                            isEnabled: notification?.community?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "community",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec:
                                notification?.communityUpdates?.description ??
                                "",
                            title:
                                notification?.communityUpdates?.name ??
                                "Community Updates",
                            isEnabled:
                                notification?.communityUpdates?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "community_updates",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: notification?.push?.description ?? "",
                            title: notification?.push?.name ?? "Push",
                            isEnabled: notification?.push?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "push",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: notification?.security?.description ?? "",
                            title: notification?.security?.name ?? "Security",
                            isEnabled: notification?.security?.value ?? false,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "security",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                        ],
                      )
                      : EmptyBodys(message: "No Notification Settings?");
                } catch (e) {
                  return Builderroul(
                    error: e.toString(),
                    onTap:
                        () => ref
                            .read(userNotificationSettinProvider.notifier)
                            .refreshSettings(context, ref),
                    firstMessae: "Faile to load Notification Settings?",
                  );
                }
              },
              loading: () {
                try {
                  final notifications =
                      ref.read(userNotificationSettinProvider).value;
                  final user = notifications?.data;
                  final notification = user?.notifications;

                  return notification != null && user != null
                      ? SingleChildScrollView(
                        child: Column(
                          children: [
                            BuildListTile(
                              ref: ref,
                              context: context,
                              dec: notification.email?.description ?? "",
                              title: notification.email?.name ?? "Email",
                              isEnabled: notification.email?.value ?? false,
                              onChanged: (value) async {
                                formProviders.updateAppNotification(
                                  context: context,
                                  key: "email",
                                  value: value,
                                  ref: ref,
                                );
                              },
                            ),
                            BuildListTile(
                              ref: ref,
                              context: context,
                              dec: notification.sms?.description ?? "",
                              title: notification.sms?.name ?? "SMS",
                              isEnabled: notification.sms?.value ?? false,
                              onChanged: (value) async {
                                formProviders.updateAppNotification(
                                  context: context,
                                  key: "sms",
                                  value: value,
                                  ref: ref,
                                );
                              },
                            ),
                            BuildListTile(
                              ref: ref,
                              context: context,
                              dec: notification.maintenance?.description ?? "",
                              title:
                                  notification.maintenance?.name ??
                                  "Maintenance",
                              isEnabled:
                                  notification.maintenance?.value ?? false,
                              onChanged: (value) async {
                                formProviders.updateAppNotification(
                                  context: context,
                                  key: "maintenance",
                                  value: value,
                                  ref: ref,
                                );
                              },
                            ),
                            BuildListTile(
                              ref: ref,
                              context: context,
                              dec:
                                  notification.maintenanceAlerts?.description ??
                                  "",
                              title:
                                  notification.maintenanceAlerts?.name ??
                                  "Maintenance Alerts",
                              isEnabled:
                                  notification.maintenanceAlerts?.value ??
                                  false,
                              onChanged: (value) async {
                                formProviders.updateAppNotification(
                                  context: context,
                                  key:
                                      notification.maintenanceAlerts?.key ??
                                      "maintenance_alerts",
                                  value: value,
                                  ref: ref,
                                );
                              },
                            ),
                            BuildListTile(
                              ref: ref,
                              context: context,
                              dec:
                                  notification.paymentReminders?.description ??
                                  "",
                              title:
                                  notification.paymentReminders?.name ??
                                  "Payment Reminders",
                              isEnabled:
                                  notification.paymentReminders?.value ?? false,
                              onChanged: (value) async {
                                formProviders.updateAppNotification(
                                  context: context,
                                  key: "payment_reminders",
                                  value: value,
                                  ref: ref,
                                );
                              },
                            ),
                            BuildListTile(
                              ref: ref,
                              context: context,
                              dec: notification.payments?.description ?? "",
                              title: notification.payments?.name ?? "Payments",
                              isEnabled: notification.payments?.value ?? false,
                              onChanged: (value) async {
                                formProviders.updateAppNotification(
                                  context: context,
                                  key: "payments",
                                  value: value,
                                  ref: ref,
                                );
                              },
                            ),
                            BuildListTile(
                              ref: ref,
                              context: context,
                              dec: notification.community?.description ?? "",
                              title:
                                  notification.community?.name ?? "Community",
                              isEnabled: notification.community?.value ?? false,
                              onChanged: (value) async {
                                formProviders.updateAppNotification(
                                  context: context,
                                  key: "community",
                                  value: value,
                                  ref: ref,
                                );
                              },
                            ),
                            BuildListTile(
                              ref: ref,
                              context: context,
                              dec:
                                  notification.communityUpdates?.description ??
                                  "",
                              title:
                                  notification.communityUpdates?.name ??
                                  "Community Updates",
                              isEnabled:
                                  notification.communityUpdates?.value ?? false,
                              onChanged: (value) async {
                                formProviders.updateAppNotification(
                                  context: context,
                                  key: "community_updates",
                                  value: value,
                                  ref: ref,
                                );
                              },
                            ),
                            BuildListTile(
                              ref: ref,
                              context: context,
                              dec: notification.push?.description ?? "",
                              title: notification.push?.name ?? "Push",
                              isEnabled: notification.push?.value ?? false,
                              onChanged: (value) async {
                                formProviders.updateAppNotification(
                                  context: context,
                                  key: "push",
                                  value: value,
                                  ref: ref,
                                );
                              },
                            ),
                            BuildListTile(
                              ref: ref,
                              context: context,
                              dec: notification.security?.description ?? "",
                              title: notification.security?.name ?? "Security",
                              isEnabled: notification.security?.value ?? false,
                              onChanged: (value) async {
                                formProviders.updateAppNotification(
                                  context: context,
                                  key: "security",
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
                            .read(userNotificationSettinProvider.notifier)
                            .refreshSettings(context, ref),
                    firstMessae: "Faile to load Notification Settings?",
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

                  final cachednotification =
                      ref.read(userNotificationSettinProvider).value;
                  if (cachednotification != null) {
                    final user = cachednotification.data;
                    final notification = user!.notifications;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: notification!.email!.description!,
                            title: notification.email!.name!,
                            isEnabled: notification.email!.value!,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "email",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),

                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: notification.sms!.description!,
                            title: notification.sms!.name!,
                            isEnabled: notification.sms!.value!,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "sms",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: notification.maintenance!.description!,
                            title: notification.maintenance!.name!,
                            isEnabled: notification.maintenance!.value!,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "maintenance",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            context: context,
                            dec: notification.maintenanceAlerts!.description!,
                            title: notification.maintenanceAlerts!.name!,
                            isEnabled: notification.maintenanceAlerts!.value!,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: notification.maintenanceAlerts!.key!,
                                value: value,
                                ref: ref,
                              );
                            },
                          ),

                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: notification.paymentReminders!.description!,
                            title: notification.paymentReminders!.name!,
                            isEnabled: notification.paymentReminders!.value!,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "payment_reminders",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: notification.payments!.description!,
                            title: notification.payments!.name!,
                            isEnabled: notification.payments!.value!,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "payments",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: notification.push!.description!,
                            title: notification.push!.name!,
                            isEnabled: notification.push!.value!,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "push",
                                value: value,
                                ref: ref,
                              );
                            },
                          ),
                          BuildListTile(
                            ref: ref,
                            context: context,
                            dec: notification.security!.description!,
                            title: notification.security!.name!,
                            isEnabled: notification.security!.value!,
                            onChanged: (value) async {
                              formProviders.updateAppNotification(
                                context: context,
                                key: "security",
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
                            .read(userNotificationSettinProvider.notifier)
                            .refreshSettings(context, ref),
                    firstMessae: "Faile to load Notification Settings?",
                  );
                } catch (e) {
                  return Builderroul(
                    error: e.toString(),
                    onTap:
                        () => ref
                            .read(userNotificationSettinProvider.notifier)
                            .refreshSettings(context, ref),
                    firstMessae: "Faile to load Notification Settings?",
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
