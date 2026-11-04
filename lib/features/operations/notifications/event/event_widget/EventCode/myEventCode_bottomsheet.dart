import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/EventCode/eventCode_Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyEventCode extends ConsumerWidget {
  final bool isTab;
  const MyEventCode({super.key, required this.isTab});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding:
          isTab
              ? const EdgeInsets.only(left: 10, right: 10, bottom: 8)
              : EdgeInsets.zero,
      child: SafeArea(
        child: Column(
          key: const ValueKey('userDetails'),

          mainAxisSize: MainAxisSize.min,
          children: [
            // Header section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                _buildAddMemberButton(size, context, ref),
                const SizedBox(height: 30),

                Text(
                  "Event code",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    fontSize: 20,
                    color: AppColors.instance.black600,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
            const SizedBox(height: 35),
            Expanded(child: EventCodeData(isBottomSheet: !isTab)),
          ],
        ),
      ),
    );
  }

  Widget _buildAddMemberButton(Size size, BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        showUserBottomSheet(
          context: context,
          headertitle: "Select option",
          headersubtitle: "Manage OTPs for Visitor Access",
          ref: ref,
          bottom: BottomSheetView.createdEvent,
        );
      },
      child: Container(
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColors.instance.black600,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Request new code",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.grey200,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
