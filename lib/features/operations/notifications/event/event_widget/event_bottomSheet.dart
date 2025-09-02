import 'package:curnectgate/features/operations/notifications/event/event.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/event_detaile.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/calendar_event_model.dart';
import 'package:flutter/material.dart';

void showEventsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder:
        (context) => Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.9,
          ),
          child: const EventsBottomSheet(),
        ),
  );
}

void showEventsDetailBottomSheet(BuildContext context, CalendarEvent data) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder:
        (context) => Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.9,
          ),
          child: EventDetaile(data: data),
        ),
  );
}
