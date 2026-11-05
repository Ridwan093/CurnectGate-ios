import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider/form_provider.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/general_notification_count_widget.dart';
import 'package:curnectgate/features/userProfile/notification_setting/model/community.dart';
import 'package:curnectgate/features/userProfile/notification_setting/model/notifications.dart';
import 'package:curnectgate/features/userProfile/notification_setting/provider/NotificationSettings_provider.dart';
import 'package:curnectgate/features/userProfile/notification_setting/widget/reusabTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
        preferredSize: Size.fromHeight(10),
        child: Divider(
          color: AppColors.instance.grey400,
        ),
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

  /// Returns a list of [_NotificationEntry] for only the fields
  /// that the backend actually returned (non-null). If the backend
  /// removes a setting, it will simply not appear in the list.
  List<_NotificationEntry> _getEntries(
    Notifications notification,
    FormNotifier formProviders,
    BuildContext context,
    WidgetRef ref,
  ) {
    final entries = <_NotificationEntry>[];

    void addIfPresent(Community? field, String fallbackKey) {
      if (field == null) return;
      entries.add(
        _NotificationEntry(
          title: field.name ?? fallbackKey,
          dec: field.description ?? '',
          isEnabled: field.value ?? false,
          onChanged: (value) async {
            formProviders.updateAppNotification(
              slug: field.name ?? fallbackKey,
              context: context,
              key: field.key ?? fallbackKey,
              value: value,
              ref: ref,
            );
          },
        ),
      );
    }

    addIfPresent(notification.email, 'email');
    addIfPresent(notification.sms, 'sms');
    addIfPresent(notification.push, 'push');
    addIfPresent(notification.payments, 'payments');
    addIfPresent(notification.paymentReminders, 'payment_reminders');
    addIfPresent(notification.security, 'security');
    addIfPresent(notification.community, 'community');
    addIfPresent(notification.communityUpdates, 'community_updates');
    addIfPresent(notification.maintenance, 'maintenance');
    addIfPresent(notification.maintenanceAlerts, 'maintenance_alerts');

    return entries;
  }

  /// Builds the column of tiles from a [Notifications] object.
  Widget _buildTiles(
    Notifications notification,
    FormNotifier formProviders,
    BuildContext context,
    WidgetRef ref,
  ) {
    final entries = _getEntries(notification, formProviders, context, ref);

    if (entries.isEmpty) {
      return EmptyBodys(message: "No Notification Settings available.");
    }

    return Column(
      children: entries.map((e) {
        return BuildListTile(
          ref: ref,
          context: context,
          dec: e.dec,
          title: e.title,
          isEnabled: e.isEnabled,
          onChanged: e.onChanged,
        );
      }).toList(),
    );
  }

  Widget _buildBody(WidgetRef ref, BuildContext context) {
    final profileAsync = ref.watch(userNotificationSettinProvider);
    final formProviders = ref.read(formProvider.notifier);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () =>
              ref
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

            ///-------------- DYNAMIC: Only renders what backend returns ------------->
            profileAsync.when(
              data: (notificationSettings) {
                final user = notificationSettings?.data;
                final notification = user?.notifications;

                if (user == null || notification == null) {
                  return EmptyBodys(message: "No Notification Settings.");
                }

                return _buildTiles(
                  notification,
                  formProviders,
                  context,
                  ref,
                );
              },
              loading: () {
                // Show cached data during loading if available, else spinner
                final cached =
                    ref.read(userNotificationSettinProvider).value;
                final notification = cached?.data?.notifications;

                if (notification != null) {
                  return _buildTiles(
                    notification,
                    formProviders,
                    context,
                    ref,
                  );
                }
                return Loadingstates();
              },
              error: (error, stack) {
                if (error.toString().contains("Unauthorized")) {
                  return Expiresessionbody();
                }

                // Try to show cached data on error
                final cached =
                    ref.read(userNotificationSettinProvider).value;
                final notification = cached?.data?.notifications;

                if (notification != null) {
                  return Column(
                    children: [
                      _buildTiles(notification, formProviders, context, ref),
            
                    ],
                  );
                }

                return Builderroul(
                  error: error.toString(),
                  onTap:
                      () =>
                          ref
                              .read(userNotificationSettinProvider.notifier)
                              .refreshSettings(context, ref),
                  firstMessage: "Failed to load notification settings.",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Simple data class to hold one notification entry.
class _NotificationEntry {
  final String title;
  final String dec;
  final bool isEnabled;
  final Function(bool) onChanged;

  const _NotificationEntry({
    required this.title,
    required this.dec,
    required this.isEnabled,
    required this.onChanged,
  });
}
