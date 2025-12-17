import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/reminder_card.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/remider/reminder_model.dart';
import 'package:curnectgate/features/operations/notifications/provider/reminder_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ReminderTab extends ConsumerStatefulWidget {
  const ReminderTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActivitiesTabState();
}

class _ActivitiesTabState extends ConsumerState<ReminderTab> {
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
  Widget build(BuildContext context) {
    final notificationProviders = ref.watch(getReminderProvider);

    // Group by date

    // Group by date
    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(getReminderProvider.notifier)
              .refreshReminder(context, ref),
      child: notificationProviders.when(
        data: (notification) {
          try {
            if (notification != null && notification.data?.reminders != null) {
              return _buildReminderList(notification.data!.reminders!);
            } else {
              return _buildEmptyState(
                message: 'No reminders yet!',
                onRefresh:
                    () => ref
                        .read(getReminderProvider.notifier)
                        .refreshReminder(context, ref),
              );
            }
          } catch (e) {
            return _buildErrorState(
              error: e.toString(),
              onRefresh:
                  () => ref
                      .read(getReminderProvider.notifier)
                      .refreshReminder(context, ref),
              message: "Failed to load reminders",
            );
          }
        },
        loading: () {
          try {
            final cachedNotification = ref.read(getReminderProvider).value;
            return cachedNotification != null &&
                    cachedNotification.data?.reminders != null
                ? _buildReminderList(cachedNotification.data!.reminders!)
                : _buildLoadingState();
          } catch (e) {
            return _buildErrorState(
              error: e.toString(),
              onRefresh:
                  () => ref
                      .read(getReminderProvider.notifier)
                      .refreshReminder(context, ref),
              message: "Failed to load reminders",
            );
          }
        },
        error: (error, stack) {
          try {
            // Handle session expiration
           if (error.toString().contains("Unauthorized")) {
              return const Expiresessionbody();
            }

            // Handle connection errors
            if (error.toString().contains("The connection errored")) {
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
            }

            // Try to show cached data
            final cachedNotification = ref.read(getReminderProvider).value;
            if (cachedNotification != null &&
                cachedNotification.data?.reminders != null) {
              return Column(
                children: [
                  _buildReminderList(cachedNotification.data!.reminders!),
                  _buildEmergencyState(error: error.toString()),
                ],
              );
            }

            // No cached data available
            return _buildErrorState(
              error: error.toString(),
              onRefresh:
                  () => ref
                      .read(getReminderProvider.notifier)
                      .refreshReminder(context, ref),
              message: "Connection failed. Please check your network",
            );
          } catch (e) {
            return _buildErrorState(
              error: e.toString(),
              onRefresh:
                  () => ref
                      .read(getReminderProvider.notifier)
                      .refreshReminder(context, ref),
              message: "Failed to load reminders",
            );
          }
        },
      ),
    );
  }

  // Helper methods
  Widget _buildReminderList(List<ReminderModel> reminders) {
    final Map<String, List<ReminderModel>> groupedActivities = {};

    for (var activity in reminders) {
      final rawDateStr = activity.createdAt;
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
        final dateA = DateTime.tryParse(a.createdAt ?? '');
        final dateB = DateTime.tryParse(b.createdAt ?? '');
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
                  (activity) => ReminderCard(activity: activity),
                ),
              ],
            );
          }).toList(),
    );
  }

  Widget _buildEmptyState({
    required String message,
    required VoidCallback onRefresh,
  }) {
    return SizedBox.expand(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRefresh,
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

  Widget _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(color: AppColors.instance.yellow500),
    );
  }

  Widget _buildErrorState({
    required String error,
    required VoidCallback onRefresh,
    required String message,
  }) {
    return SizedBox.expand(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRefresh,
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

  Widget _buildEmergencyState({required String error}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "Showing cached data. Error: $error",
        style: TextStyle(color: AppColors.instance.error500),
      ),
    );
  }
}
