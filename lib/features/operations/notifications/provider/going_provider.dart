// Provider for your API class
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/resv_model/rsvp_events_response.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final goingEventRsvpProvider = FutureProvider.autoDispose.family<
  RsvpEventsResponse?,
  String
>((ref, type) async {
  // Try load cached
  final local = await SharedPrefsService.getEventRsvp();

  try {
    // Fetch fresh from API using the passed `type` argument
    final fresh = await ref
        .read(getApiServiceProvider)
        .getEventRsvps(type: type);

    // Save if changed
    if (local == null || local.toJson() != fresh.toJson()) {
      await SharedPrefsService.saveEventRsvp(fresh);
    }

    return fresh;
  } catch (e) {
    // On error return cached when available, else rethrow so FutureProvider goes to error state
    if (local != null) return local;
    rethrow;
  }
});
Future<RsvpEventsResponse?> refreshRsvp(
    WidgetRef ref, String type) async {
  try {
    // Force refresh provider
    final refreshed = await ref.refresh(goingEventRsvpProvider(type).future);

    // Optionally save locally
    if (refreshed != null) {
      await SharedPrefsService.saveEventRsvp(refreshed);
    }

    // Return the fresh data
    return refreshed;
  } catch (e) {
    // On error, return cached data if available
    final local = await SharedPrefsService.getEventRsvp();
    if (local != null) {
      return local;
    }

    // If no cached data, rethrow
    rethrow;
  }
}
