import 'dart:developer';

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
            return _buildCalendar(ref, event?.events ?? []);
          } else {
            return _buildCalendar(ref, event?.events ?? []);
          }

          // If data is valid
        },
        loading: () {
          final cachedEvent = ref.read(getCalenderProvider).value;

          if (cachedEvent != null &&
              cachedEvent.status! &&
              cachedEvent.events!.isNotEmpty) {
            return _buildCalendar(ref, cachedEvent.events ?? []);
          }

          return _buildCalendar(ref, cachedEvent?.events ?? []);
        },
        error: (error, stack) {
          try {
            // Handle session expiration
            if (error.toString().contains("Unauthenticated")) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref.read(authProvider.notifier).seassionExpire(context, ref);
              });
              return Expiresessionbody();
            }
            final event = ref.read(getCalenderProvider).value;

            // Try to show cached data

            if (event!.events!.isNotEmpty) {
              return _buildCalendar(ref, event.events ?? []);
            }

            // No cached data available
            return _buildCalendar(ref, event.events ?? []);
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(getCalenderProvider.notifier)
                      .refreshEvent(context, ref),
              firstMessae: "Faile to load Calender?",
            );
          }
        },
      ),

      // Expanded(
      //   child:
      //       generatedList.isNotEmpty
      //           ? _buildMemberList(ref, size)
      //           : _buildEmtyBody(),
      // ),
    );
  }

  Widget _buildCalendar(WidgetRef ref, List<Event> event) {
    final state = ref.watch(eventsProvider);
    final notifier = ref.read(eventsProvider.notifier);

    // Define your date range
    final firstDay = DateTime.now().subtract(
      const Duration(days: 365),
    ); // 1 year back
    final lastDay = DateTime.now().add(
      const Duration(days: 365),
    ); // 1 year forward
    // Ensure focusedDay is within bounds (without modifying state during build)

    return TableCalendar(
      firstDay: firstDay,
      lastDay: lastDay,
      focusedDay: state.focusedDay, // Use the validated focusedDay
      calendarFormat: state.calendarFormat,
      onFormatChanged: notifier.changeCalendarFormat,
      onPageChanged: notifier.changeFocusedDay,
      onDaySelected: (selectedDay, focusedDay) {
        // Handle date selection

        log(
          "SELECTEDDATE; ${selectedDay.toString()} FocusedDay: ${focusedDay.toString()}",
        );
        // _handleDateSelection(selectedDay, ref);
      },
      eventLoader:
          (day) =>
              event
                  .where((e) => isSameDay(DateTime.parse(e.start ?? ""), day))
                  .toList(),

      // Calendar configuration
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, date, focusedDay) {
          final events =
              event
                  .where((e) => isSameDay(DateTime.parse(e.start ?? ""), date))
                  .toList();
          final hasEvents = events.isNotEmpty;
          final isToday = isSameDay(date, DateTime.now());

          // For event days and today, use colored container
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

          // For normal days, return null to use default styling
          return null;
        },

        markerBuilder: (context, date, events) {
          final validEvents = events.whereType<Event>().toList();
          if (validEvents.isEmpty) return null;

          final hasUserRsvp = validEvents.any(
            (event) => event.addedToCalendar ?? false,
          );

          // Only show red dot for user RSVP on event days
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
