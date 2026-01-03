import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/ActiveCard.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/Activities_tab.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/rember_tab.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/reminder_card.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/notification_item.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/remider/reminder_model.dart';
import 'package:curnectgate/features/operations/notifications/provider/activity_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/notification_Count_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivityPage extends ConsumerStatefulWidget {
  const ActivityPage({super.key});

  @override
  ConsumerState<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends ConsumerState<ActivityPage> {
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
    final tabIndex = ref.watch(tabIndexProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: isSearching ? null : _buildNormalAppBar(context, tabIndex),
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
            if (tabIndex == 0) ...[
              SafeArea(
                child: Column(
                  children: [
                    // Search bar with bottom padding for gap
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: _buildSearchAppBar(context),
                    ),

                    // Consistent gap — this 12px will look the same on ALL devices
                    const SizedBox(height: 12),

                    // Results card — takes remaining space
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: _buildSearchBody(searchQuery),
                      ),
                    ),

                    // Optional bottom padding
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],

            if (tabIndex == 1) ...[
              SafeArea(
                child: Column(
                  children: [
                    // Search bar with bottom padding for gap
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: _buildSearchAppBar(context),
                    ),

                    // Consistent gap — this 12px will look the same on ALL devices
                    const SizedBox(height: 12),

                    // Results card — takes remaining space
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: _buildSearchBodyReminder(searchQuery),
                      ),
                    ),

                    // Optional bottom padding
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }

  AppBar _buildNormalAppBar(BuildContext context, int tabIndex) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),

      actions: [
        if (tabIndex == 1)
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: () {
              showUserBottomSheet(
                context: context,
                headertitle: "",
                headersubtitle: "",
                ref: ref,
                bottom: BottomSheetView.notificationReminderFilter,
              );
            },
          ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            ref.read(isSearchingProvider.notifier).state = true;
            _searchController.clear();
          },
        ),
        IconButton(
          icon: Icon(tabIndex == 0 ? Icons.settings_outlined : Icons.add),
          onPressed: () {
            if (tabIndex == 0) {
              showUserBottomSheet(
                context: context,
                headertitle: "",
                headersubtitle: "",
                ref: ref,
                bottom: BottomSheetView.notificationSetting,
              );
            } else {
              ref.watch(reminderProvider.notifier).resetAll();
              showUserBottomSheet(
                context: context,
                headertitle: "",
                headersubtitle: "",
                ref: ref,
                bottom: BottomSheetView.addReminder,
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildSearchAppBar(BuildContext context) {
    return SafeArea(
      child: Container(
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
    final tabIndex = ref.watch(tabIndexProvider);

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
        _buildTabButtons(ref),
        Expanded(
          child: IndexedStack(
            index: tabIndex,
            children: const [ActivitiesTab(), ReminderTab()],
          ),
        ),
      ],
    );
  }

  Widget _buildTabButtons(WidgetRef ref) {
    final tabIndex = ref.watch(tabIndexProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => ref.read(tabIndexProvider.notifier).state = 0,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color:
                      tabIndex == 0
                          ? AppColors.instance.yellow500
                          : Colors.transparent,
                  border: Border.all(
                    color:
                        tabIndex == 0
                            ? AppColors.instance.yellow500
                            : AppColors.instance.black300,
                  ),
                ),

                child: Center(
                  child: Text(
                    'Activities',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      color:
                          tabIndex == 0
                              ? AppColors.instance.black600
                              : AppColors.instance.black300,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: InkWell(
              onTap: () => ref.read(tabIndexProvider.notifier).state = 1,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color:
                      tabIndex == 1
                          ? AppColors.instance.yellow500
                          : Colors.transparent,
                  border: Border.all(
                    color:
                        tabIndex == 1
                            ? AppColors.instance.yellow500
                            : AppColors.instance.black300,
                  ),
                ),

                child: Center(
                  child: Text(
                    'Reminder',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      color:
                          tabIndex == 1
                              ? AppColors.instance.black600
                              : AppColors.instance.black300,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBody(String searchQuery) {
    final activities = _filterActivities(searchQuery);

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate safe top margin based on screen height

        return Container(
          width: MediaQuery.sizeOf(context).width,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child:
              activities.isEmpty
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // const SizedBox(height: 100),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 100, 8.0, 8.0),
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
                      // const SizedBox(height: 50),
                    ],
                  )
                  : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: activities.length,
                    itemBuilder: (context, index) {
                      final activity = activities[index];
                      return ActivityCard(activity: activity);
                    },
                  ),
        );
      },
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

  Widget _buildSearchBodyReminder(String searchQuery) {
    final activities = _filterActivitiesreminder(searchQuery);

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate safe top margin based on screen height

        return Container(
          width: MediaQuery.sizeOf(context).width,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child:
              activities.isEmpty
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // const SizedBox(height: 100),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 100, 8.0, 8.0),
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
                      // const SizedBox(height: 50),
                    ],
                  )
                  : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: activities.length,
                    itemBuilder: (context, index) {
                      final activity = activities[index];
                      return ReminderCard(activity: activity);
                    },
                  ),
        );
      },
    );
  }

  List<ReminderModel> _filterActivitiesreminder(String query) {
    final notificationRead = ref.watch(getReminderProvider).value;

    if (notificationRead?.status == true) {
      final allActivities = notificationRead!.data?.reminders ?? [];

      if (allActivities.isNotEmpty) {
        if (query.isEmpty) return allActivities;

        return allActivities
            .where(
              (activity) =>
                  activity.title?.toLowerCase().contains(query.toLowerCase()) ==
                      true ||
                  activity.description?.toLowerCase().contains(
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
