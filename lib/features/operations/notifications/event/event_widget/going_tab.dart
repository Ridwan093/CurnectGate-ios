import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/build_errorUlfor_event.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/resvp_event_card.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/resv_model/rsvp_event_history.dart';
import 'package:curnectgate/features/operations/notifications/provider/going_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoingEvents extends ConsumerWidget {
  final String going;
  const GoingEvents({super.key, required this.going});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeOtasync = ref.watch(goingEventRsvpProvider(going));

    return RefreshIndicator(
      onRefresh: () => refreshRsvp(ref, going),
      child: activeOtasync.when(
        data: (event) {
          if (event!.data!.events!.isNotEmpty) {
            return _buildEventList(event.data?.events ?? [], context, ref);
          } else {
            return _buildEmtyBody();
          }

          // If data is valid
        },
        loading: () {
          final cachedEvent = ref.read(goingEventRsvpProvider(going)).value;

          if (cachedEvent != null &&
              cachedEvent.status! &&
              cachedEvent.data!.events!.isNotEmpty) {
            return _buildEventList(
              cachedEvent.data?.events ?? [],
              context,
              ref,
            );
          }

          return const Loadingstates();
        },
        error: (error, stack) {
          try {
            // Handle session expiration
            if (error.toString().contains("Unauthorized")) {
              return const Expiresessionbody();
            }
            final event = ref.read(goingEventRsvpProvider(going)).value;

            // Try to show cached data

            if (event!.data!.events!.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildEventList(event.data?.events ?? [], context, ref),
                    Emmergencybody(error: error.toString()),
                  ],
                ),
              );
            }

            // No cached data available
            return Builderrouls(
              error: error.toString(),
              onTap: () => refreshRsvp(ref, going),
              firstMessae: "Faile to load Event",
            );
          } catch (e) {
            return Builderrouls(
              error: e.toString(),
              onTap: () => refreshRsvp(ref, going),
              firstMessae: "Faile to load Event?",
            );
          }
        },
      ),
    );
  }

  Widget _buildEventList(
    List<RsvpEventHistory> event,
    BuildContext context,
    WidgetRef ref,
  ) {
    return ListView.builder(
      itemCount: event.length,
      itemBuilder: (context, index) {
        var data = event[index];
        return RsvpDataEventCard(
          event: data,
          onGoing: (p0) {},
          onTap: () {
            showUserBottomSheet(
              context: context,
              headertitle: "",
              headersubtitle: "",
              ref: ref,
              bottom: BottomSheetView.eventRsvpDetails,

              rsvpdata: data,
            );
          },
        );
      },
    );
  }

  Widget _buildEmtyBody() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetPaths.dashboardEvents, height: 100, width: 100),
            SizedBox(height: 10),
            Text(
              "Your Evente detailes appears here",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black300,
                fontSize: 12,
                fontWeight: FontFamilies.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
