import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/notifications/event/event_widget/event_card.dart';
import 'package:curnectgate/features/%20operations/notifications/event/model/event_model.dart';
import 'package:curnectgate/features/%20operations/notifications/provider/eventprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsBottomSheet extends ConsumerWidget {
  const EventsBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(eventsProvider);
    final notifier = ref.read(eventsProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: [
          if (!state.showDetails) ...[
            _buildHeader(notifier),
            const SizedBox(height: 30),
            _buildTitleSection(),
            const SizedBox(height: 16),
            _buildCalendar(ref),
            const SizedBox(height: 16),
            _buildTabBar(ref),
            const SizedBox(height: 16),
          ],
          Expanded(
            child:
                state.showDetails
                    ? _buildEventDetails(ref)
                    : _buildContent(ref,context),
          ),
          if (state.showDetails) _buildDetailActions(ref, context),
        ],
      ),
    );
  }

  // =============================================
  // 3. Widget Building Methods
  // =============================================

  Widget _buildHeader(EventsNotifier notifier) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: notifier.closeDetails,
        child: Text(
          "Close",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      children: [
        Text(
          "Your events",
          style: TextStyle(
            fontSize: 18,
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
            fontWeight: FontFamilies.bold,
          ),
        ),
        Text(
          "Track event and happenings in your estate",
          style: TextStyle(
            fontSize: 12,
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black300,
            fontWeight: FontFamilies.medium,
          ),
        ),
      ],
    );
  }

  Widget _buildCalendar(WidgetRef ref) {
    final state = ref.watch(eventsProvider);
    final notifier = ref.read(eventsProvider.notifier);

    // Define your date range
    final firstDay = DateTime.now().subtract(
      const Duration(days: 365),
    ); // 1 year back
    final lastDay = DateTime.now().add(
      const Duration(days: 365),
    ); // 1 year forward

    // Ensure focusedDay is within bounds
    DateTime focusedDay = state.focusedDay;
    if (focusedDay.isBefore(firstDay)) {
      focusedDay = firstDay;
      notifier.changeFocusedDay(focusedDay); // Update state if needed
    } else if (focusedDay.isAfter(lastDay)) {
      focusedDay = lastDay;
      notifier.changeFocusedDay(focusedDay); // Update state if needed
    }

    return TableCalendar(
      firstDay: firstDay,
      lastDay: lastDay,
      focusedDay: focusedDay, // Use the validated focusedDay
      calendarFormat: state.calendarFormat,
      onFormatChanged: notifier.changeCalendarFormat,
      onPageChanged: notifier.changeFocusedDay,
      eventLoader:
          (day) => state.events.where((e) => isSameDay(e.date, day)).toList(),

      // Calendar configuration
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: AppColors.instance.yellow400,
          borderRadius: BorderRadius.circular(6),
        ),
        selectedDecoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
      headerStyle: const HeaderStyle(
        formatButtonVisible: true,
        formatButtonShowsNext: false,
        titleCentered: true,
      ),
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, events) {
          if (events.isNotEmpty) {
            return Positioned(
              right: 1,
              bottom: 1,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  events.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
          return null;
        },
      ),
    );
  }

  Widget _buildTabBar(WidgetRef ref) {
    final state = ref.watch(eventsProvider);
    final notifier = ref.read(eventsProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTabButton(0, "Events", state.currentTab, notifier),
        _buildTabButton(1, "Going", state.currentTab, notifier),
        _buildTabButton(2, "Canceled", state.currentTab, notifier),
      ],
    );
  }

  Widget _buildTabButton(
    int index,
    String title,
    int currentTab,
    EventsNotifier notifier,
  ) {
    return Column(
      children: [
        TextButton(
          onPressed: () => notifier.changeTab(index),
          style: TextButton.styleFrom(
            foregroundColor:
                currentTab == index
                    ? AppColors.instance.black600
                    : AppColors.instance.black300,
          ),
          child: Text(title),
        ),
        currentTab == index
            ? Container(
              height: 1,
              width: 50,
              color: AppColors.instance.yellow500,
            )
            : const SizedBox(),
      ],
    );
  }

  Widget _buildContent(WidgetRef ref,  BuildContext context) {
    final state = ref.watch(eventsProvider);

    return IndexedStack(
      index: state.currentTab,
      children: [
        _buildEventList(state.events, true, false, ref,context),
        _buildEventList(state.goingEvents, false, false, ref,context),
        _buildEventList(state.cancelledEvents, false, true, ref,context),
      ],
    );
  }

  Widget _buildEventList(
    List<Event> events,
    bool showActions,
    bool isCancel,
    WidgetRef ref,
    BuildContext context
  ) {
    final notifier = ref.read(eventsProvider.notifier);

    return ListView.builder(
       controller: PrimaryScrollController.of(context),
      itemCount: events.length,
      itemBuilder:
          (context, index) => EventCard(
            iscancle: isCancel,
            event: events[index],
            showActions: showActions,
            onGoing: notifier.toggleEventAttendance,
            onTap: () => notifier.selectEvent(events[index]),
          ),
    );
  }

  Widget _buildEventDetails(WidgetRef ref) {
    final state = ref.watch(eventsProvider);
    final notifier = ref.read(eventsProvider.notifier);

    if (state.selectedEvent == null) return const SizedBox.shrink();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: notifier.closeDetails,
              child: Text(
                "Close",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
          Image.asset(AssetPaths.eventblue, height: 50, width: 50),
          const SizedBox(height: 20),
          Text(
            state.selectedEvent!.title,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
          ),
          const SizedBox(height: 8),
          _buildEventDetailTile(
            icon: Icons.access_time,
            child: const SizedBox(),
            text: "30 min",
            isRichText: false,
          ),
          const SizedBox(height: 16),
          _buildEventDetailTile(
            icon: Icons.person_3_outlined,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.medium,
                      color: AppColors.instance.black400,
                    ),
                    text: state.selectedEvent!.description,
                  ),
                  TextSpan(
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      color: AppColors.instance.black600,
                    ),
                    text: " ${state.selectedEvent!.subtitle}  ",
                  ),
                ],
              ),
            ),
            text: '',
            isRichText: true,
          ),
          const SizedBox(height: 16),
          _buildEventDetailTile(
            icon: Icons.calendar_month,
            child: const SizedBox(),
            text:
                "${DateFormat('hh:mm a').format(state.selectedEvent!.date)}, "
                "${DateFormat('MMM dd, yyyy').format(state.selectedEvent!.date)}",
            isRichText: false,
          ),
          const SizedBox(height: 16),
          _buildEventDetailTile(
            icon: Icons.location_on_outlined,
            child: const SizedBox(),
            text: state.selectedEvent!.location,
            isRichText: false,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Going?",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                  fontWeight: FontFamilies.medium,
                ),
              ),
              Row(
                children: [
                  _buildEventConfirmButton(
                    showActions: false,
                    onPressed: () => notifier.toggleEventAttendance(true),
                    title: "Yes",
                  ),
                  _buildEventConfirmButton(
                    showActions: true,
                    onPressed: () => notifier.toggleEventAttendance(false),
                    title: "No",
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildEventDescription(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildEventDescription() {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 50,
      decoration: BoxDecoration(color: AppColors.instance.grey300),
      child: Row(
        children: [
          Icon(Icons.arrow_right, color: AppColors.instance.blue500),
          Text(
            "Event description from host",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.medium,
              color: AppColors.instance.black400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventDetailTile({
    required IconData icon,
    required Widget child,
    required String text,
    required bool isRichText,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.instance.black300),
        const SizedBox(width: 8),
        isRichText
            ? child
            : Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.instance.black400,
              ),
            ),
      ],
    );
  }

  Widget _buildDetailActions(WidgetRef ref, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () => _shareEvent(ref, context),
            child: Text(
              "Share event",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
            ),
          ),
          const SizedBox(width: 10),
          _buildAddToCalendarButton(
            () => _addToCalendar(ref, context),
            context,
          ),
        ],
      ),
    );
  }

  Widget _buildEventConfirmButton({
    required bool showActions,
    required String title,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(5),
        height: 35,
        width: !showActions ? 70 : 50,
        decoration: BoxDecoration(
          color:
              !showActions
                  ? AppColors.instance.teal300
                  : AppColors.instance.grey400,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child:
              !showActions
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontWeight: FontFamilies.bold,
                          color: AppColors.instance.black600,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.done,
                        size: 12,
                        color: AppColors.instance.black600,
                      ),
                    ],
                  )
                  : Text(
                    title,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      color: AppColors.instance.black600,
                    ),
                  ),
        ),
      ),
    );
  }

  Widget _buildAddToCalendarButton(
    VoidCallback onPressed,
    BuildContext context,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: MediaQuery.sizeOf(context).width / 2,
        decoration: BoxDecoration(
          color: AppColors.instance.black100,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.done),
            const SizedBox(width: 10),
            Text(
              'Add to Calendar',
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _shareEvent(WidgetRef ref, BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Event shared!")));
  }

  void _addToCalendar(WidgetRef ref, BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Added to calendar!")));
  }
}
