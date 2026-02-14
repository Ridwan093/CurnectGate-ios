import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/get_workOder/work_order.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Managevendorlog extends ConsumerWidget {
  final int id;
  final String title;
  final String subtitle;
  final WorkOrder? workOder;

  const Managevendorlog({
    super.key,
    required this.id,
    required this.subtitle,
    required this.title,
    required this.workOder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        key: const ValueKey('userDetails'),
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header section
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 20,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  color: AppColors.instance.black300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),

          _mangeButton(
            icon: Icons.drive_file_rename_outline_outlined,
            bg: AppColors.instance.grey400,
            iconColor: AppColors.instance.black600,
            onTap: () {
              context.pop();
              context.pushNamed(
                AppRoutes.workSubmit,
                extra: {"wokerOrder": workOder},
              );
            },
            title: "Edit vendor Log",
          ),

          const SizedBox(height: 5),

          _mangeButton(
            icon: Icons.restore,
            bg: AppColors.instance.error300,
            iconColor: AppColors.instance.error500,
            onTap: () {
              ref.read(bottomSheetStateProvider.notifier).state =
                  BottomSheetView.revokevendorconfirm;
            },
            title: "Revoke vendor Log",
          ),

          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _mangeButton({
    required VoidCallback onTap,
    required String title,
    required Color bg,
    required Color iconColor,
    required IconData icon,
  }) {
    return Container(
      height: 100,
      color: AppColors.instance.grey300,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: bg,
          child: Center(child: Icon(icon, color: iconColor)),
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
