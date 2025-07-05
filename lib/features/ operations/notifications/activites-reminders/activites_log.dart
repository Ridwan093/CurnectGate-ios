import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/notifications/activites-reminders/widget/ActiveCard.dart';
import 'package:curnectgate/features/%20operations/notifications/activites-reminders/widget/rember_tab.dart';
import 'package:curnectgate/features/%20operations/notifications/activites-reminders/widget/tab.dart';
import 'package:curnectgate/features/%20operations/notifications/event/model/activit_model.dart';
import 'package:curnectgate/features/%20operations/notifications/provider/activity_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class ActivityPage extends ConsumerStatefulWidget {
  const ActivityPage({super.key});

  @override
  ConsumerState<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends ConsumerState<ActivityPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
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

  AppBar _buildNormalAppBar(BuildContext context, int tabIndex) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text('Activity'),
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_list_rounded),
          onPressed: () {},
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
          onPressed: () {},
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

  List<ActivityItem> _filterActivities(String query) {
    final allActivities = [
      ActivityItem(
        title: 'Access Granted to james at Gate B',
        subtitle: 'Entry. Approved via OTP 787841',
        time: '10:30 AM',
        status: ActivityStatus.granted,
        date: "mar 24",
        actualDate: "Today",
      ),
      ActivityItem(
        title: 'Access Granted to Blessing at Gate B',
        subtitle: 'Entry. Approved via OTP 787841',
        time: '10:30 AM',
        status: ActivityStatus.granted,
        date: "mar 24",
        actualDate: "Today",
      ),
      ActivityItem(
        title: 'Access Denied - Invalid OTP by Okon',
        subtitle: 'Entry Approved via OTP. 789899',
        time: '02:15 PM',
        status: ActivityStatus.denied,
        date: "mar 24",
        actualDate: "Today",
      ),
      ActivityItem(
        title: 'Access Granted to jamms at Gate B',
        subtitle: 'Entry. Approved via OTP 787841',
        time: '10:30 AM',
        status: ActivityStatus.granted,
        date: "mar 24",
        actualDate: "May 2, 2025",
      ),
    ];

    if (query.isEmpty) return allActivities;
    return allActivities
        .where(
          (activity) =>
              activity.title.toLowerCase().contains(query.toLowerCase()) ||
              activity.subtitle.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}


