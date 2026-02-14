import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/event_model.dart';
import 'package:curnectgate/features/operations/notifications/provider/eventprovider.dart';
import 'package:curnectgate/features/operations/notifications/provider/getCalender_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/getevent_provider.dart';
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
          if (event != null) {
            return _buildCalendar(ref, event.data?.events ?? [], context);
          } else {
            return _buildCalendar(ref, event?.data?.events ?? [], context);
          }
        },
        loading: () {
          return Loadingstates();
        },
        error: (error, stack) {
          try {
            if (error.toString().contains("Unauthorized")) {
              return const Expiresessionbody();
            }
            final event = ref.read(getCalenderProvider).value;
            if (event!.data!.events!.isNotEmpty) {
              return _buildCalendar(ref, event.data?.events ?? [], context);
            }
            return _buildCalendar(ref, event.data?.events ?? [], context);
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

    final firstDay = DateTime.now().subtract(const Duration(days: 365));
    final lastDay = DateTime.now().add(const Duration(days: 365));

    return LayoutBuilder(
      builder: (context, constraints) {
        final double availableWidth = constraints.maxWidth;
        final bool isSmallScreen = availableWidth < 360;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: availableWidth,
              maxWidth: isSmallScreen ? 380 : double.infinity,
            ),
            child: TableCalendar(
              firstDay: firstDay,
              lastDay: lastDay,
              focusedDay: state.focusedDay,
              calendarFormat: state.calendarFormat,
              onFormatChanged: notifier.changeCalendarFormat,
              onPageChanged: notifier.changeFocusedDay,
              onDaySelected: (selectedDay, focusedDay) {
                ref
                    .read(getEventProvider.notifier)
                    .refreshEvent(context, ref, selectedDay.toString());
              },
              eventLoader:
                  (day) =>
                      events
                          .where(
                            (e) =>
                                isSameDay(DateTime.parse(e.start ?? ""), day),
                          )
                          .toList(),
              headerStyle: HeaderStyle(
                formatButtonVisible: !isSmallScreen,
                titleCentered: true,
                formatButtonShowsNext: false,
                titleTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(fontSize: isSmallScreen ? 11 : 13),
                weekendStyle: TextStyle(fontSize: isSmallScreen ? 11 : 13),
              ),
              calendarStyle: CalendarStyle(
                cellMargin: EdgeInsets.all(isSmallScreen ? 3 : 6),
                todayDecoration: BoxDecoration(
                  color: AppColors.instance.black600,
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(
                  color: Colors.transparent,
                ), // ← Key fix
                markerSize: 0, // ← Makes default dots invisible
                canMarkersOverflow: false,
              ),

              calendarBuilders: CalendarBuilders(
                todayBuilder: (context, date, focusedDay) {
                  final dayEvents =
                      events
                          .where(
                            (e) =>
                                isSameDay(DateTime.parse(e.start ?? ""), date),
                          )
                          .toList();
                  final hasAdded = dayEvents.any(
                    (e) => e.addedToCalendar ?? false,
                  );
                  final bgColor =
                      dayEvents.isNotEmpty
                          ? (hasAdded
                              ? AppColors.instance.yellow400
                              : AppColors.instance.teal400)
                          : AppColors.instance.black600;

                  return Container(
                    margin: EdgeInsets.all(isSmallScreen ? 3 : 6),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: isSmallScreen ? 12 : 14,
                        ),
                      ),
                    ),
                  );
                },
                defaultBuilder: (context, date, focusedDay) {
                  final dayEvents =
                      events
                          .where(
                            (e) =>
                                isSameDay(DateTime.parse(e.start ?? ""), date),
                          )
                          .toList();
                  if (dayEvents.isEmpty) return null;

                  final hasAdded = dayEvents.any(
                    (e) => e.addedToCalendar ?? false,
                  );
                  final bgColor =
                      hasAdded
                          ? AppColors.instance.yellow400
                          : AppColors.instance.yellow400;

                  return Container(
                    margin: EdgeInsets.all(isSmallScreen ? 3 : 6),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: isSmallScreen ? 12 : 14,
                        ),
                      ),
                    ),
                  );
                },

                // ONLY your custom yellow dot when addedToCalendar == true
                markerBuilder: (context, date, events) {
                  final dayEvents = events.whereType<Event>().toList();
                  if (dayEvents.isEmpty) return null;

                  final hasUserAdded = dayEvents.any(
                    (e) => e.addedToCalendar ?? false,
                  );
                  if (!hasUserAdded) return null;

                  // Your custom dot (no black default)
                  return Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColors.instance.yellow600,
                      shape: BoxShape.circle,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
