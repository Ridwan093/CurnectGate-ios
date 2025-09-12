import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/calaender_Data.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/event_card.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/event_data.dart';
import 'package:curnectgate/features/operations/notifications/event/model/event_model.dart';
import 'package:curnectgate/features/operations/notifications/provider/eventprovider.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EventsBottomSheet extends ConsumerWidget {
  const EventsBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reminderProvider);
    final notifier = ref.read(eventsProvider.notifier);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Column(
                children: [
                  _buildHeader(notifier, context),
                  const SizedBox(height: 16), // Reduced spacing
                  _buildTitleSection(),
                  const SizedBox(height: 12), // Reduced spacing
                  // Calendar with fixed height
                  Container(
                    color: Colors.green,
                    // height: MediaQuery.of(context).size.height * 0.45,
                    child: CalenderData(),
                  ),

                  const SizedBox(height: 12), // Reduced spacing
                  _buildTabBar(ref),
                  const SizedBox(height: 12), // Reduced spacing
                  // Content area - THIS IS THE KEY FIX
                  Expanded(child: _buildContent(ref, context)),
                ],
              ),
              if (state.isLoading)
                Positioned.fill(child: _buildLoadingOverlay()),
            ],
          ),
        );
      },
    );
  }

  // =============================================
  // 3. Widget Building Methods
  // =============================================

  Widget _buildLoadingOverlay() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Center(child: Loadingstates()),
    );
  }

  Widget _buildHeader(EventsNotifier notifier, BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          context.pop();
        },
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

  Widget _buildContent(WidgetRef ref, BuildContext context) {
    final state = ref.watch(eventsProvider);

    return IndexedStack(
      index: state.currentTab,
      children: [
        EventData(),
        _buildEventList(state.goingEvents, false, false, ref, context),
        _buildEventList(state.cancelledEvents, false, true, ref, context),
      ],
    );
  }

  Widget _buildEventList(
    List<Event> events,
    bool showActions,
    bool isCancel,
    WidgetRef ref,
    BuildContext context,
  ) {
    final notifier = ref.read(eventsProvider.notifier);

    return events.isEmpty
        ? Center(child: Text("No events found"))
        : ListView.builder(
          // REMOVE PrimaryScrollController - this was causing the issue
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
}
