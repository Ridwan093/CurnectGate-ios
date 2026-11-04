import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/features/operations/notifications/event/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

/// Provider for managing events state
final eventsProvider = StateNotifierProvider<EventsNotifier, EventsState>((
  ref,
) {
  return EventsNotifier();
});

/// State notifier that handles all events logic
class EventsNotifier extends StateNotifier<EventsState> {
  EventsNotifier()
    : super(
        EventsState(
          focusedDay: _getValidFocusedDay(DateTime.now()),
          currentTab: 0,
          calendarFormat: CalendarFormat.month,

          events: [
            Event(
              "Community Meetup",
              "Akeem Ojo",
              DateTime.now().add(const Duration(days: 4)),
              "Hosted by",
              "Greendoor Estate",
              AssetPaths.commiteteal,
              false,
            ),
            Event(
              "Discussion with committee",
              "John ose",
              DateTime.now().add(const Duration(days: 2)),
              "Hosted by",
              "Estate Clubhouse",
              AssetPaths.commiteyellow,
              false,
            ),
            Event(
              "Discussion with committee",
              "John ose",
              DateTime.now().add(const Duration(days: 5)),
              "Hosted by",
              "Estate Clubhouse",
              AssetPaths.commiteyellow,
              false,
            ),
            Event(
              "Discussion with committee",
              "John ose",
              DateTime.now().add(const Duration(days: 6)),
              "Hosted by",
              "Estate Clubhouse",
              AssetPaths.commiteyellow,
              false,
            ),
            Event(
              "Estate Meeting",
              "Meddal Won",
              DateTime.now().add(const Duration(days: 3)),
              "Hosted by",
              "Estate Clubhouse",
              AssetPaths.commiteteal,
              true,
            ),
          ],
          goingEvents: [],
          cancelledEvents: [],
          selectedEvent: null,
          showDetails: false,
        ),
      );
  static DateTime _getValidFocusedDay(DateTime day) {
    final firstDay = DateTime.now().subtract(const Duration(days: 365));
    final lastDay = DateTime.now().add(const Duration(days: 365));

    if (day.isBefore(firstDay)) return firstDay;
    if (day.isAfter(lastDay)) return lastDay;
    return day;
  }

  void changeTab(int index) {

    
    state = state.copyWith(currentTab: index);
  }

  void changeCalendarFormat(CalendarFormat format) {
    state = state.copyWith(calendarFormat: format);
  }

  void changeFocusedDay(DateTime day) {
    state = state.copyWith(focusedDay: day);
  }

  void selectEvent(Event event) {
    state = state.copyWith(selectedEvent: event, showDetails: true);
  }

  void toggleEventAttendance(bool isGoing) {
    if (state.selectedEvent == null) return;

    final event = state.selectedEvent!;
    final events = List<Event>.from(state.events);
    final goingEvents = List<Event>.from(state.goingEvents);
    final cancelledEvents = List<Event>.from(state.cancelledEvents);

    events.remove(event);

    if (isGoing) {
      goingEvents.add(event);
    } else {
      cancelledEvents.add(event);
    }

    state = state.copyWith(
      events: events,
      goingEvents: goingEvents,
      cancelledEvents: cancelledEvents,
      showDetails: false,
    );
  }

  void closeDetails(BuildContext context) {
    context.pop();
    // state = state.copyWith(showDetails: false);
  }
}
