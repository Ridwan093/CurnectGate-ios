import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/notifications/event/model/EventCodes/event_code_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EventSettings extends ConsumerWidget {
  final EventCode data;
  const EventSettings({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        key: const ValueKey('userDetails'),
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
              Text(
                "Event Settings",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 20,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Check your event code or control whether this event is active.",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  color: AppColors.instance.black300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          _buildButton(
            title: "Check Event Code",
            onTap: () {
              showUserBottomSheet(
                context: context,
                headertitle: "",
                headersubtitle: "Revoked  OTP",
                ref: ref,
                bottom: BottomSheetView.checkEventcode,
                id: 0,
                eventCode: data,
              );
            },
            icon: Icons.content_paste_search_sharp,
          ),

          const SizedBox(height: 5),
          _buildButton(
            title: "Deactive Event Code",
            onTap: () {
              context.pop();
              showUserBottomSheet(
                context: context,
                headertitle: "",
                headersubtitle: "Revoked  OTP",
                ref: ref,
                bottom: BottomSheetView.eventDeactive,
                id: 0,
                eventCode: data,
              );
            },
            icon: Icons.block,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String title,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return Container(
      height: 100,
      color: AppColors.instance.grey300,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: onTap,
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.instance.grey400,
          ),
          child: Center(child: Icon(icon, color: AppColors.instance.black600)),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
