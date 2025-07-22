import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/notifications/activites-reminders/widget/ActiveCard.dart';
import 'package:curnectgate/features/%20operations/notifications/event/model/activit_model.dart';
import 'package:curnectgate/features/%20operations/notifications/provider/activity_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
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
    fetchData(); // Call API here
  }

  Future<void> fetchData() async {
    final notificationRead = ref.watch(getUserNotification).value;

    if (notificationRead?.status == true) {
      final notifications = notificationRead!.data?.notifications ?? [];

      // Check if ALL statuses are 'unread'
      final allUnread = notifications.every((n) => n.status == 'unread');

      if (allUnread) {
        // Call your API here if all are unread

        ref
            .read(formProvider.notifier)
            .updateNotificationRead(
              context: context,
              ref: ref,
            ); // or any relevant method
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final notificationProviders = ref.watch(getUserNotification);

    // Group by date

    return notificationProviders.when(
      data: (notification) {
        if (notification != null) {
          final activities = notification.data?.notifications ?? [];
          final Map<String, List<NotificationItem>> groupedActivities = {};

          for (var activity in activities) {
            final rawDateStr = activity.updatedAt;

            if (rawDateStr == null) continue;

            // Parse the ISO8601 string into a DateTime object
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
            } else if (activityDate ==
                today.subtract(const Duration(days: 1))) {
              dateKey = 'Yesterday';
            } else {
              dateKey = DateFormat('MMM d, yyyy').format(activityDate);
            }

            // Group the activities
            groupedActivities.putIfAbsent(dateKey, () => []);
            groupedActivities[dateKey]!.add(activity);
          }

          return RefreshIndicator(
            color: AppColors.instance.yellow500,
            onRefresh:
                () => ref
                    .read(getUserNotification.notifier)
                    .refreshSettings(context, ref),
            child: ListView(
              children:
                  groupedActivities.entries.map((entry) {
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
                        ...notification.data!.notifications!.map(
                          (activity) => ActivityCard(activity: activity),
                        ),
                      ],
                    );
                  }).toList(),
            ),
          );
        } else {
          return SizedBox.expand(
            // ← Forces full screen coverage
            child: Center(
              child: Column(
                mainAxisSize:
                    MainAxisSize
                        .min, // ← Makes Column only as big as its children
                children: [
                  Text('No notification yet!'),
                  const SizedBox(height: 16), // ← Adds spacing
                  ElevatedButton(
                    onPressed:
                        () => ref
                            .read(getUserNotification.notifier)
                            .refreshSettings(context, ref),
                    child: Text(
                      "Refresh",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
      loading: () {
        // Show cached data while loading if available
        final notification = ref.read(getUserNotification).value;
        if (notification != null) {
          final activities = notification.data?.notifications ?? [];
          final Map<String, List<NotificationItem>> groupedActivities = {};

          for (var activity in activities) {
            final rawDateStr = activity.updatedAt;

            if (rawDateStr == null) continue;

            // Parse the ISO8601 string into a DateTime object
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
            } else if (activityDate ==
                today.subtract(const Duration(days: 1))) {
              dateKey = 'Yesterday';
            } else {
              dateKey = DateFormat('MMM d, yyyy').format(activityDate);
            }

            // Group the activities
            groupedActivities.putIfAbsent(dateKey, () => []);
            groupedActivities[dateKey]!.add(activity);
          }
          return ListView(
            children:
                groupedActivities.entries.map((entry) {
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
                      ...notification.data!.notifications!.map(
                        (activity) => ActivityCard(activity: activity),
                      ),
                    ],
                  );
                }).toList(),
          );
        }
        return Center(
          child: CircularProgressIndicator(color: AppColors.instance.yellow500),
        );
      },
      error: (err, stack) {
        // Handle specific error cases
        if (err.toString().contains("The connection errored")) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showCustomSuccessToast(
              context: context,
              message: 'Connection failed. Please check your network',
              color: AppColors.instance.error500,
              icon: Icons.error,
              iconColors: AppColors.instance.grey300,
              positionNumber: 72,
            );
          });

          return SizedBox.expand(
            // ← Forces full screen coverage
            child: Center(
              child: Column(
                mainAxisSize:
                    MainAxisSize
                        .min, // ← Makes Column only as big as its children
                children: [
                  Text('Connection failed. Please check your network'),
                  const SizedBox(height: 16), // ← Adds spacing
                  ElevatedButton(
                    onPressed:
                        () => ref
                            .read(getUserNotification.notifier)
                            .refreshSettings(context, ref),
                    child: Text(
                      "Refresh",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (err.toString().contains(
          "Unauthenticated. Please login to continue.",
        )) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(authProvider.notifier).seassionExpire(context, ref);
          });
        } else {
          return SizedBox.expand(
            // ← Forces full screen coverage
            child: Center(
              child: Column(
                mainAxisSize:
                    MainAxisSize
                        .min, // ← Makes Column only as big as its children
                children: [
                  Text('Connection failed. Please check your network'),
                  const SizedBox(height: 16), // ← Adds spacing
                  ElevatedButton(
                    onPressed:
                        () => ref
                            .read(getUserNotification.notifier)
                            .refreshSettings(context, ref),
                    child: Text(
                      "Refresh",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        final notification = ref.read(getUserNotification).value;
        if (notification != null) {
          final activities = notification.data?.notifications ?? [];
          final Map<String, List<NotificationItem>> groupedActivities = {};

          for (var activity in activities) {
            final rawDateStr = activity.updatedAt;

            if (rawDateStr == null) continue;

            // Parse the ISO8601 string into a DateTime object
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
            } else if (activityDate ==
                today.subtract(const Duration(days: 1))) {
              dateKey = 'Yesterday';
            } else {
              dateKey = DateFormat('MMM d, yyyy').format(activityDate);
            }

            // Group the activities
            groupedActivities.putIfAbsent(dateKey, () => []);
            groupedActivities[dateKey]!.add(activity);
          }
          return ListView(
            children:
                groupedActivities.entries.map((entry) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Text(
                          formatToFriendlyDate(entry.key),
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontWeight: FontFamilies.bold,
                            color: AppColors.instance.black300,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      ...notification.data!.notifications!.map(
                        (activity) => ActivityCard(activity: activity),
                      ),
                    ],
                  );
                }).toList(),
          );
        }
        // Always try to show cached data if available

        if (notification != null) {
          final activities = notification.data?.notifications ?? [];
          final Map<String, List<NotificationItem>> groupedActivities = {};

          for (var activity in activities) {
            final rawDateStr = activity.updatedAt;

            if (rawDateStr == null) continue;

            // Parse the ISO8601 string into a DateTime object
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
            } else if (activityDate ==
                today.subtract(const Duration(days: 1))) {
              dateKey = 'Yesterday';
            } else {
              dateKey = DateFormat('MMM d, yyyy').format(activityDate);
            }

            // Group the activities
            groupedActivities.putIfAbsent(dateKey, () => []);
            groupedActivities[dateKey]!.add(activity);
          }
          return ListView(
            children:
                groupedActivities.entries.map((entry) {
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
                      ...notification.data!.notifications!.map(
                        (activity) => ActivityCard(activity: activity),
                      ),
                    ],
                  );
                }).toList(),
          );
        }
        return Center(
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // ← Makes Column only as big as its children
            children: [
              Text('Connection failed. Please check your network'),
              const SizedBox(height: 16), // ← Adds spacing
              ElevatedButton(
                onPressed:
                    () => ref
                        .read(getUserNotification.notifier)
                        .refreshSettings(context, ref),
                child: Text(
                  "Refresh",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
