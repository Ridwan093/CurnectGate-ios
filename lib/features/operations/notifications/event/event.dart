import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/calaender_Data.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/event_data.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/going_tab.dart';
import 'package:curnectgate/features/operations/notifications/provider/eventprovider.dart';
import 'package:curnectgate/features/operations/notifications/provider/getevent_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/going_provider.dart';
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
              CustomScrollView(
                slivers: [
                  // Header
                  SliverToBoxAdapter(child: _buildHeader(notifier, context)),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),

                  // Title Section
                  SliverToBoxAdapter(child: _buildTitleSection()),
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),

                  // Calendar (fixed height is OK here since it's a calendar)
                  SliverToBoxAdapter(child: CalenderData()),
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),

                  // Tab Bar
                  SliverToBoxAdapter(child: _buildTabBar(ref, context)),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),

                  // Tab Content — takes all remaining space without overflow
                  // SliverFillRemaining(
                  //   hasScrollBody: false, // Allows inner ListView to scroll
                  //   child: _buildContent(ref, context),
                  // ),
                  ..._buildContentSlivers(ref, context),

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
          "close",
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

  Widget _buildTabBar(WidgetRef ref, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: eventtabLegnt(ref, context)),
        Expanded(child: goinglegnt(ref, context)),
        Expanded(child: cancledEventlegnt(ref, context)),
      ],
    );
  }

  Widget _buildTabButton(
    int index,
    String title,
    int currentTab,
    EventsNotifier notifier,
    WidgetRef ref,
    BuildContext context,
  ) {
    final bool isSelected = currentTab == index;

    return InkWell(
      onTap: () {
        if (index == 0) {
          ref.read(getEventProvider.notifier).refreshEvent(context, ref, "");
        } else if (index == 2) {
          // ref
          //     .read(canceledEventProvider.notifier)
          //     .refreshEvent(context, ref, "cancelled");
        }
        notifier.changeTab(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis, // ← Critical: prevents overflow
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color:
                  isSelected
                      ? AppColors.instance.black600
                      : AppColors.instance.black300,
            ),
          ),
          const SizedBox(height: 6),
          if (isSelected)
            Container(
              height: 3,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.instance.yellow500,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }

  Widget cancledEventlegnt(WidgetRef ref, BuildContext context) {
    final state = ref.watch(eventsProvider);
    final notifier = ref.read(eventsProvider.notifier);
    final getListEventCount = ref.watch(goingEventRsvpProvider("not_going"));
    return getListEventCount.when(
      data: (data) {
        if (data?.data != null) {
          return _buildTabButton(
            2,
            "Canceled(${data?.data?.events?.length.toString() ?? ""})",
            state.currentTab,
            notifier,
            ref,
            context,
          );
        } else {
          return _buildTabButton(
            2,
            "Canceled",
            state.currentTab,
            notifier,
            ref,
            context,
          );
        }
      },
      error: (e, s) {
        return _buildTabButton(
          2,
          "Canceled",
          state.currentTab,
          notifier,
          ref,
          context,
        );
      },
      loading: () {
        return _buildTabButton(
          2,
          "Canceled",
          state.currentTab,
          notifier,
          ref,
          context,
        );
      },
    );
  }

  Widget goinglegnt(WidgetRef ref, BuildContext context) {
    final state = ref.watch(eventsProvider);
    final notifier = ref.read(eventsProvider.notifier);
    final getListEventCount = ref.watch(goingEventRsvpProvider("going"));
    return getListEventCount.when(
      data: (data) {
        if (data?.data != null) {
          return _buildTabButton(
            1,
            "Going(${data?.data?.events?.length.toString() ?? ""})",
            state.currentTab,
            notifier,
            ref,
            context,
          );
        } else {
          return _buildTabButton(
            1,
            "Going",
            state.currentTab,
            notifier,
            ref,
            context,
          );
        }
      },
      error: (e, s) {
        return _buildTabButton(
          1,
          "Going",
          state.currentTab,
          notifier,
          ref,
          context,
        );
      },
      loading: () {
        return _buildTabButton(
          1,
          "Going",
          state.currentTab,
          notifier,
          ref,
          context,
        );
      },
    );
  }

  Widget eventtabLegnt(WidgetRef ref, BuildContext context) {
    final state = ref.watch(eventsProvider);
    final notifier = ref.read(eventsProvider.notifier);
    final getListEventCount = ref.watch(getEventProvider);
    return getListEventCount.when(
      data: (data) {
        if (data?.data != null) {
          return _buildTabButton(
            0,
            "Events(${data?.data?.events?.length.toString() ?? ""})",
            state.currentTab,
            notifier,
            ref,
            context,
          );
        } else {
          return _buildTabButton(
            0,
            "Events",
            state.currentTab,
            notifier,
            ref,
            context,
          );
        }
      },
      error: (e, s) {
        return _buildTabButton(
          0,
          "Events",
          state.currentTab,
          notifier,
          ref,
          context,
        );
      },
      loading: () {
        return _buildTabButton(
          0,
          "Events",
          state.currentTab,
          notifier,
          ref,
          context,
        );
      },
    );
  }
List<Widget> _buildContentSlivers(WidgetRef ref, BuildContext context) {
  final state = ref.watch(eventsProvider);

  switch (state.currentTab) {
    case 0:
      return EventDataSliver().buildSlivers(context, ref);
    case 1:
      return GoingEventsSliver(going: "going").buildSlivers(context, ref);
    case 2:
      return GoingEventsSliver(going: "not_going").buildSlivers(context, ref);
    default:
      return [];
  }
}

  // Widget _buildContent(WidgetRef ref, BuildContext context) {
  //   final state = ref.watch(eventsProvider);

  //   return IndexedStack(
  //     index: state.currentTab,
  //     children: [
  //       EventData(),
  //       GoingEvents(going: "going"),
  //       GoingEvents(going: "not_going"),
  //     ],
  //   );
  // }
}


