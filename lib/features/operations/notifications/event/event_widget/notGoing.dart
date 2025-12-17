import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/build_errorUlfor_event.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/data_event_card.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/calendar_event_model.dart';
import 'package:curnectgate/features/operations/notifications/provider/cancel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CancelEvent extends ConsumerWidget {
  const CancelEvent({super.key});
  // bool isUserGoing(CalendarUserRsvp? userRsvpMap) {
  //   if (userRsvpMap == null) return false;

  //   final response = userRsvpMap.response;
  //   return response != null && response.toString().toLowerCase() == 'going';
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeOtasync = ref.watch(canceledEventProvider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(canceledEventProvider.notifier)
              .refreshEvent(context, ref, "cancelled"),

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
          final cachedEvent = ref.read(canceledEventProvider).value;

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
            final event = ref.read(canceledEventProvider).value;

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
              onTap:
                  () => ref
                      .read(canceledEventProvider.notifier)
                      .refreshEvent(context, ref, "cancelled"),
              firstMessae: "Faile to load Event",
            );
          } catch (e) {
            return Builderrouls(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(canceledEventProvider.notifier)
                      .refreshEvent(context, ref, "cancelled"),
              firstMessae: "Faile to load Event?",
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

  Widget _buildEventList(
    List<CalendarEvent> event,
    BuildContext context,
    WidgetRef ref,
  ) {
    return ListView.builder(
      itemCount: event.length,
      itemBuilder: (context, index) {
        var data = event[index];
        return DataEventCard(
          event: data,
          onGoing: (p0) {},
          onTap: () {
            showUserBottomSheet(
              context: context,
              headertitle: "",
              headersubtitle: "",
              ref: ref,
              bottom: BottomSheetView.eventsDetails,

              event: data,
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
