import 'package:table_calendar/table_calendar.dart';

/// State class that holds all events-related data
class EventsState {
  final int currentTab;
  final CalendarFormat calendarFormat;
  final DateTime focusedDay;
  final List<Event> events;
  final List<Event> goingEvents;
  final List<Event> cancelledEvents;
  final Event? selectedEvent;
  final bool showDetails;
  final bool hasUserRsvp;

  EventsState({
    required this.currentTab,
    required this.calendarFormat,
    required this.focusedDay,
    required this.events,
    required this.goingEvents,
    required this.cancelledEvents,
    this.selectedEvent,
    required this.showDetails,
    this.hasUserRsvp = false,
  });

  EventsState copyWith({
    int? currentTab,
    CalendarFormat? calendarFormat,
    DateTime? focusedDay,
    List<Event>? events,
    List<Event>? goingEvents,
    List<Event>? cancelledEvents,
    Event? selectedEvent,
    bool? showDetails,
    bool? hasUserRsvp,
  }) {
    return EventsState(
      hasUserRsvp: hasUserRsvp ?? this.hasUserRsvp,
      currentTab: currentTab ?? this.currentTab,
      calendarFormat: calendarFormat ?? this.calendarFormat,
      focusedDay: focusedDay ?? this.focusedDay,
      events: events ?? this.events,
      goingEvents: goingEvents ?? this.goingEvents,
      cancelledEvents: cancelledEvents ?? this.cancelledEvents,
      selectedEvent: selectedEvent ?? this.selectedEvent,
      showDetails: showDetails ?? this.showDetails,
    );
  }
}

class Event {
  final String title;
  final String subtitle;
  final DateTime date;
  final String description;
  final String location;
  final String imagepath;
   final bool hasUserRsvp;

  Event(
    this.title,
    this.subtitle,
    this.date,
    this.description,
    this.location,
    this.imagepath,
    this.hasUserRsvp
  );
}
