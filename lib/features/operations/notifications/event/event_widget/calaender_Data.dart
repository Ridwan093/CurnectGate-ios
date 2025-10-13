import 'dart:developer';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/event_model.dart';
import 'package:curnectgate/features/operations/notifications/provider/eventprovider.dart';
import 'package:curnectgate/features/operations/notifications/provider/getCalender_provider.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderData extends ConsumerWidget {
  const CalenderData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeOtasync = ref.watch(getCalenderProvider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () =>
              ref.read(getCalenderProvider.notifier).refreshEvent(context, ref),
      child: activeOtasync.when(
        data: (event) {
          if (event?.events != null) {
            return Text(event?.events?.first.title.toString() ?? "");
          } else {
            return _buildCalendar(ref, event?.events ?? [], context);
          }
        },
        loading: () {
          return Loadingstates();
        },
        error: (error, stack) {
          try {
            if (error.toString().contains("Unauthenticated")) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref.read(authProvider.notifier).seassionExpire(context, ref);
              });
              return Expiresessionbody();
            }
            final event = ref.read(getCalenderProvider).value;
            if (event!.events!.isNotEmpty) {
              return _buildCalendar(ref, event.events ?? [], context);
            }
            return _buildCalendar(ref, event.events ?? [], context);
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(getCalenderProvider.notifier)
                      .refreshEvent(context, ref),
              firstMessae: "Failed to load Calendar?",
            );
          }
        },
      ),
    );
  }

  Widget _buildCalendar(
    WidgetRef ref,
    List<Event> events,
    BuildContext context,
  ) {
    final state = ref.watch(eventsProvider);
    final notifier = ref.read(eventsProvider.notifier);

    // Define date range
    final firstDay = DateTime.now().subtract(const Duration(days: 365));
    final lastDay = DateTime.now().add(const Duration(days: 365));

    return TableCalendar(
      firstDay: firstDay,
      lastDay: lastDay,
      focusedDay: state.focusedDay,
      calendarFormat: state.calendarFormat,
      onFormatChanged: notifier.changeCalendarFormat,
      onPageChanged: notifier.changeFocusedDay,
      onDaySelected: (selectedDay, focusedDay) {
        log(
          "SELECTEDDATE: ${selectedDay.toString()} FocusedDay: ${focusedDay.toString()}",
        );
      },
      eventLoader:
          (day) =>
              events
                  .where((e) => isSameDay(DateTime.parse(e.start ?? ""), day))
                  .toList(),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, date, focusedDay) {
          final calendarEvents =
              events
                  .where((e) => isSameDay(DateTime.parse(e.start ?? ""), date))
                  .toList();
          final hasEvents = calendarEvents.isNotEmpty;
          final isToday = isSameDay(date, DateTime.now());

          if (hasEvents || isToday) {
            return Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.instance.yellow300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
          return null;
        },
        markerBuilder: (context, date, events) {
          final validEvents = events.whereType<Event>().toList();
          if (validEvents.isEmpty) return null;

          final hasUserRsvp = validEvents.any(
            (event) => event.addedToCalendar ?? false,
          );

          if (hasUserRsvp) {
            return Positioned(
              bottom: 8,
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.instance.yellow600,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
