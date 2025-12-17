import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/ActiveCard.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/notification_item.dart';
import 'package:curnectgate/features/operations/notifications/provider/activity_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ActivitiesTab extends ConsumerStatefulWidget {
  const ActivitiesTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActivitiesTabState();
}

class _ActivitiesTabState extends ConsumerState<ActivitiesTab> {
  String formatToFriendlyDate(String isoDate) {
    final date = DateTime.parse(isoDate).toLocal();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(date.year, date.month, date.day);

    if (target == today) {
      return 'Today';
    } else if (target == today.subtract(Duration(days: 1))) {
      return 'Yesterday';
    } else {
      return DateFormat.yMMMMd().format(date); // e.g., May 24, 2025
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notificationProviders = ref.watch(getUserNotification);

    // Group by date
    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(getUserNotification.notifier)
              .refreshSettings(context, ref),
      child: notificationProviders.when(
        data: (notification) {
          try {
            if (notification != null &&
                notification.data?.notifications != null) {
              return _buildNotificationList(notification.data!.notifications!);
            } else {
              return _buildEmptyState(message: "No notifications yet!");
            }
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(getUserNotification.notifier)
                      .refreshSettings(context, ref),
              firstMessae: "Failed to load notifications",
            );
          }
        },
        loading: () {
          try {
            final cachedNotification = ref.read(getUserNotification).value;
            return cachedNotification != null &&
                    cachedNotification.data?.notifications != null
                ? _buildNotificationList(
                  cachedNotification.data!.notifications!,
                )
                : Loadingstates();
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(getUserNotification.notifier)
                      .refreshSettings(context, ref),
              firstMessae: "Failed to load notifications",
            );
          }
        },
        error: (error, stack) {
          try {
            // Handle session expiration
            if (error.toString().contains("Unauthorized")) {
              return const Expiresessionbody();
            }
            // Try to show cached data
            final cachedNotification = ref.read(getUserNotification).value;
            if (cachedNotification != null &&
                cachedNotification.data?.notifications != null) {
              return Column(
                children: [
                  _buildNotificationList(
                    cachedNotification.data!.notifications!,
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
                      .read(getUserNotification.notifier)
                      .refreshSettings(context, ref),
              firstMessae: "Failed to load notifications",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(getUserNotification.notifier)
                      .refreshSettings(context, ref),
              firstMessae: "Failed to load notifications",
            );
          }
        },
      ),
    );
  }

  // Helper method to build the notification list
  Widget _buildNotificationList(List<NotificationItem> notifications) {
    final Map<String, List<NotificationItem>> groupedActivities = {};

    for (var activity in notifications) {
      final rawDateStr = activity.updatedAt;
      if (rawDateStr == null) continue;

      final parsedDate = DateTime.tryParse(rawDateStr);
      if (parsedDate == null) continue;

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final activityDate = DateTime(
        parsedDate.year,
        parsedDate.month,
        parsedDate.day,
      );

      // Format as "Today", "Yesterday", or "MMM d, yyyy"
      String dateKey;
      if (activityDate == today) {
        dateKey = 'Today';
      } else if (activityDate == today.subtract(const Duration(days: 1))) {
        dateKey = 'Yesterday';
      } else {
        dateKey = DateFormat('MMM d, yyyy').format(activityDate);
      }

      // Group the activities
      groupedActivities.putIfAbsent(dateKey, () => []);
      groupedActivities[dateKey]!.add(activity);
    }

    // Sort activities within each group (most recent first)
    for (var entry in groupedActivities.entries) {
      entry.value.sort((a, b) {
        final dateA = DateTime.tryParse(a.updatedAt ?? '');
        final dateB = DateTime.tryParse(b.updatedAt ?? '');
        return (dateB ?? DateTime(0)).compareTo(dateA ?? DateTime(0));
      });
    }

    // Sort the groups in chronological order (most recent first)
    final sortedEntries =
        groupedActivities.entries.toList()..sort((a, b) {
          if (a.key == 'Today') return -1;
          if (b.key == 'Today') return 1;
          if (a.key == 'Yesterday') return -1;
          if (b.key == 'Yesterday') return 1;

          try {
            final dateA = DateFormat('MMM d, yyyy').parse(a.key);
            final dateB = DateFormat('MMM d, yyyy').parse(b.key);
            return dateB.compareTo(dateA);
          } catch (e) {
            return 0;
          }
        });

    return ListView(
      children:
          sortedEntries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    entry.key,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      color: AppColors.instance.black300,
                      fontSize: 16,
                    ),
                  ),
                ),
                ...entry.value.map(
                  (activity) => ActivityCard(activity: activity),
                ),
              ],
            );
          }).toList(),
    );
  }

  Widget _buildEmptyState({required String message}) {
    return SizedBox.expand(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text(message), const SizedBox(height: 16)],
        ),
      ),
    );
  }
}
