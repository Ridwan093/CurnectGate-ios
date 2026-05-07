import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/EventCode/eventCode_card.dart';
import 'package:curnectgate/features/operations/notifications/event/model/EventCodes/event_code_model.dart';
import 'package:curnectgate/features/operations/notifications/provider/EventCode_provider/getlistofEventCode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventCodeData extends ConsumerWidget {
  final bool isBottomSheet;
  const EventCodeData({super.key, required this.isBottomSheet});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeOtasync = ref.watch(getEventCodeProvider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(getEventCodeProvider.notifier)
              .refreshEventCode(context, ref),

      child: activeOtasync.when(
        data: (event) {
          if (event!.data != null) {
            return _buildEventList(event.data?.eventCodes ?? [], context, ref);
          } else {
            return _buildEmtyBody();
          }

          // If data is valid
        },
        loading: () {
          final cachedEvent = ref.read(getEventCodeProvider).value;

          if (cachedEvent != null &&
              cachedEvent.status! &&
              cachedEvent.data!.eventCodes!.isNotEmpty) {
            return _buildEventList(
              cachedEvent.data?.eventCodes ?? [],
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
            final event = ref.read(getEventCodeProvider).value;

            // Try to show cached data

            if (event!.data!.eventCodes!.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildEventList(event.data?.eventCodes ?? [], context, ref),
                    Emmergencybody(error: error.toString()),
                  ],
                ),
              );
            }

            // No cached data available
            return Builderroul(
              isBottomSheet: isBottomSheet,
              error: error.toString(),
              onTap:
                  () => ref
                      .read(getEventCodeProvider.notifier)
                      .refreshEventCode(context, ref),
              firstMessae: "Faile to load Event",
            );
          } catch (e) {
            return Builderroul(
              isBottomSheet: isBottomSheet,
              error: e.toString(),
              onTap:
                  () => ref
                      .read(getEventCodeProvider.notifier)
                      .refreshEventCode(context, ref),
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
    List<EventCode> event,
    BuildContext context,
    WidgetRef ref,
  ) {
    return ListView.builder(
      itemCount: event.length,
      itemBuilder: (context, index) {
        var data = event[index];
        return EventcodeCard(
          event: data,

          onTap: () {
            ref.read(formProvider.notifier).updateRegenerateDigiterCode("");
            ref.read(formProvider.notifier).updateGenrateMemberIdLoading(false);
            showUserBottomSheet(
              context: context,
              headertitle: "Select option",
              headersubtitle: "Manage OTPs for Visitor Access",
              ref: ref,
              bottom: BottomSheetView.eventSetting,
              eventCode: data,
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
              "Your Event Code  appears here",
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
