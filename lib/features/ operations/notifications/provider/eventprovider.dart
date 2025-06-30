import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/features/%20operations/notifications/event/model/event_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          currentTab: 0,
          calendarFormat: CalendarFormat.month,
          focusedDay: DateTime.now(),
          events: [
            Event(
              "Community Meetup",
              "Akeem Ojo",
              DateTime.now().add(const Duration(days: 17)),
              "Hosted by",
              "Greendoor Estate",
              AssetPaths.commiteteal,
            ),
            Event(
              "Discussion with committee",
              "John ose",
              DateTime.now().add(const Duration(days: 2)),
              "Hosted by",
              "Estate Clubhouse",
              AssetPaths.commiteyellow,
            ),
            Event(
              "Estate Meeting",
              "Meddal Won",
              DateTime.now().add(const Duration(days: 90)),
              "Hosted by",
              "Estate Clubhouse",
              AssetPaths.commiteteal,
            ),
          ],
          goingEvents: [],
          cancelledEvents: [],
          selectedEvent: null,
          showDetails: false,
        ),
      );

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

  void closeDetails() {
    state = state.copyWith(showDetails: false);
  }
}
