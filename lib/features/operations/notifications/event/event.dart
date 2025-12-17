import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/calaender_Data.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/event_data.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/going_tab.dart';
import 'package:curnectgate/features/operations/notifications/provider/cancel_provider.dart';
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
              Column(
                children: [
                  _buildHeader(notifier, context),
                  const SizedBox(height: 16), // Reduced spacing
                  _buildTitleSection(),
                  const SizedBox(height: 12), // Reduced spacing
                  // Calendar with fixed height
                  CalenderData(),

                  const SizedBox(height: 12), // Reduced spacing
                  _buildTabBar(ref, context),
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        eventtabLegnt(ref, context),

        goinglegnt(ref, context),
        cancledEventlegnt(ref, context),
      ],
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

  Widget _buildTabButton(
    int index,
    String title,
    int currentTab,
    EventsNotifier notifier,
    WidgetRef ref,
    BuildContext context,
  ) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            if (index == 0) {
              ref
                  .read(getEventProvider.notifier)
                  .refreshEvent(context, ref, "");
            } else if (index == 1) {
            } else if (index == 2) {
              ref
                  .read(canceledEventProvider.notifier)
                  .refreshEvent(context, ref, "cancelled");
            }
            notifier.changeTab(index);
          },
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
        GoingEvents(going: "going"),
        GoingEvents(going: "not_going"),
      ],
    );
  }
}
