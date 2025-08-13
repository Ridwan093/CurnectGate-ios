import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_status_model.dart/member_permission_model.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/button.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/basicPermission_switch.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PermissionContent extends ConsumerWidget {
  final Map<String, MemberPermission>? permission;
  final int id;

  const PermissionContent({
    super.key,
    required this.id,
    required this.permission,
  });

  // Define the order in which permissions should appear
  static const List<String> _permissionOrder = [
    'manage_household_members',
    'update_profile',
    'manage_properties',
    'view_property_reports',
    'manage_rentals',
    'gate_access',
    'night_access',
    'parking_access',
    'visitor_invitation',
    'view_announcements',
    'community_forum',
    'create_calendar',
    'generate_reports',
    'facility_access',
    'submit_workorder',
    'manage_workorder',
    'view_workorder',
    'update_workorder',
    'maintenance_request',
    'create_emergency',
    'emergency_contact',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formProviders = ref.read(formProvider.notifier);
    final isLoading = ref.watch(formProvider).basicPermissionLoading;

    // Get permissions in defined order, filtering out null/empty ones
    final orderedPermissions = _getOrderedPermissions(permission);

    return SingleChildScrollView(
      child: Column(
        key: const ValueKey('permissions'),
        mainAxisSize: MainAxisSize.min,
        children: [
          // Loading indicator
          if (isLoading ?? false)
            Align(
              alignment: Alignment.topRight,
              child: CircularProgressIndicator(
                color: AppColors.instance.yellow500,
              ),
            ),

          // Title
          Text(
            'Set basic Permission',
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 15,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 20),

          // Permissions container
          Container(
            decoration: BoxDecoration(
              color: AppColors.instance.grey300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                // Dynamically generate permission switches with keys
                ...orderedPermissions.map((perm) {
                  final permissionKey = ValueKey(perm.permission?.slug ?? '');
                  return BasicpermissionSwitch(
                    permissionSlug: perm.permission?.slug ?? "",
                    key: permissionKey,
                    value: perm.status?.isGranted ?? false,
                    onChanged: (value) {
                      formProviders.setbasicePermission(
                        context: context,
                        id: id,
                        ref: ref,
                        slug: perm.permission?.slug ?? "",
                        value: value,
                      );
                    },
                    title: perm.permission?.name ?? "Permission",
                    subtitle: perm.permission?.description ?? "",
                  );
                }).toList(),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Close button
          Buttonss(
            onPressed: () => context.pop(),
            child: Text(
              "Close",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 15,
                fontWeight: FontFamilies.medium,
                color: AppColors.instance.grey200,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to get permissions in defined order with null checks
  List<MemberPermission> _getOrderedPermissions(
    Map<String, MemberPermission>? permissions,
  ) {
    if (permissions == null) return [];

    return _permissionOrder
        .where(
          (key) =>
              permissions.containsKey(key) &&
              permissions[key]?.permission != null,
        )
        .map((key) => permissions[key]!)
        .toList();
  }
}
