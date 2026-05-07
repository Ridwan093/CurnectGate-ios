import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/data_event_card.dart';
import 'package:curnectgate/features/operations/notifications/provider/activity_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/getevent_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventDataSliver {
  List<Widget> buildSlivers(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(getEventProvider);

    return [
      CupertinoSliverRefreshControl(
        onRefresh:
            () => ref
                .read(getEventProvider.notifier)
                .refreshEvent(context, ref, ""),
      ),

      ...asyncValue.when(
        data: (event) {
          if (event!.data!.events!.isEmpty) {
            return [
              SliverFillRemaining(hasScrollBody: false, child: _emptyBody()),
            ];
          }

          return [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final data = event.data!.events![index];
                return DataEventCard(
                  event: data,
                  onGoing: (_) {},
                  onTap: () {
                    ref.read(isPopProvider.notifier).state = true;
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
              }, childCount: event.data!.events!.length),
            ),
          ];
        },
        loading:
            () => [
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: Loadingstates()),
              ),
            ],
        error:
            (error, stack) => [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Builderroul(
                  isBottomSheet: true,
                  error: error.toString(),
                  onTap:
                      () => ref
                          .read(getEventProvider.notifier)
                          .refreshEvent(context, ref, ""),
                  firstMessae: "Failed to load event",
                ),
              ),
            ],
      ),
    ];
  }

  Widget _emptyBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetPaths.dashboardEvents, height: 100, width: 100),
          SizedBox(height: 10),
          Text(
            "Event details appear here",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontFamilies.medium,
              color: AppColors.instance.black300,
            ),
          ),
        ],
      ),
    );
  }
}
