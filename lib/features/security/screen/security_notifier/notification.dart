import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/ActiveCard.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/Activities_tab.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/notification_item.dart';
import 'package:curnectgate/features/operations/notifications/provider/activity_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/notification_Count_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecurityNotifications extends ConsumerStatefulWidget {
  const SecurityNotifications({super.key});

  @override
  ConsumerState<SecurityNotifications> createState() => _ActivityPageState();
}

class _ActivityPageState extends ConsumerState<SecurityNotifications> {
  late TextEditingController _searchController;

  Future<void> fetchData() async {
    log("------------>");
    final notificationRead = ref.watch(getNotificationCount).value;

    final allUnread = notificationRead!.data?.unreadOnly ?? false;
    log(notificationRead.data?.count.toString() ?? "");

    // Check if ALL statuses are 'unread'

    if (allUnread) {
      // Call your API here if all are unread
      log("THE NOTIFICATION WAS UNREAD LET READ SOME");
      ref
          .read(formProvider.notifier)
          .updateNotificationRead(context: context, ref: ref);
    } else {
      log("THE NOTIFICATION WAS READ  NOTHING NEW");
    }
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    // Don't call fetchData here
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSearching = ref.watch(isSearchingProvider);

    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: isSearching ? null : _buildNormalAppBar(context),
      body: Stack(
        children: [
          // Main content
          _buildMainBody(ref),

          // Search overlay
          if (isSearching) ...[
            ModalBarrier(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.5),
              dismissible: true,
              onDismiss: () {
                ref.read(isSearchingProvider.notifier).state = false;
                ref.read(searchQueryProvider.notifier).state = '';
                _searchController.clear();
              },
            ),

            _buildSearchAppBar(context),
            _buildSearchBody(searchQuery),
          ],
        ],
      ),
    );
  }

  AppBar _buildNormalAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),

      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            ref.read(isSearchingProvider.notifier).state = true;
            _searchController.clear();
          },
        ),
      ],
    );
  }

  Widget _buildSearchAppBar(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.sizeOf(context).width,
        child: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'Search activities...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: () {
                ref.read(searchQueryProvider.notifier).state = '';
                _searchController.clear();
              },
              icon: Icon(
                Icons.cancel_rounded,
                color: AppColors.instance.black600,
              ),
            ),
            prefixIcon: InkWell(
              onTap: () {
                ref.read(isSearchingProvider.notifier).state = false;
                ref.read(searchQueryProvider.notifier).state = '';
                _searchController.clear();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.instance.black600,
                size: 17,
              ),
            ),
          ),
          onChanged:
              (value) => ref.read(searchQueryProvider.notifier).state = value,
        ),
      ),
    );
  }

  Widget _buildMainBody(WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Activity',
            style: TextStyle(
              fontSize: 24,
              color: AppColors.instance.black600,
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
          ),
        ),

        Expanded(child: ActivitiesTab()),
      ],
    );
  }

  Widget _buildSearchBody(String searchQuery) {
    final activities = _filterActivities(searchQuery);

    return Container(
      margin: EdgeInsets.fromLTRB(10, 90, 10, 0),
      width: MediaQuery.sizeOf(context).width,

      height: activities.isEmpty ? 150 : null,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child:
          activities.isEmpty
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'No results found for "$searchQuery"',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                        color: AppColors.instance.black300,
                      ),
                    ),
                  ),
                ],
              )
              : ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  return ActivityCard(activity: activity);
                },
              ),
    );
  }

  List<NotificationItem> _filterActivities(String query) {
    final notificationRead = ref.watch(getUserNotification).value;

    if (notificationRead?.status == true) {
      final allActivities = notificationRead!.data?.notifications ?? [];

      if (allActivities.isNotEmpty) {
        if (query.isEmpty) return allActivities;

        return allActivities
            .where(
              (activity) =>
                  activity.description?.toLowerCase().contains(
                        query.toLowerCase(),
                      ) ==
                      true ||
                  activity.estate?.address?.toLowerCase().contains(
                        query.toLowerCase(),
                      ) ==
                      true,
            )
            .toList();
      }
    }

    // Fallback: always return an empty list
    return [];
  }
}
