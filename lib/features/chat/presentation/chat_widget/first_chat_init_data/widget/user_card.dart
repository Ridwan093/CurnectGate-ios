import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserCard extends ConsumerWidget {
  final String userName;
  final String userRole;
  final String estateName;
  final String url;
  final String subtitle;
  final int id;
  final String? isOnline;
  final String? commitRole;
  const UserCard({
    super.key,
    required this.userName,
    required this.userRole,
    required this.estateName,
    required this.url,
    required this.subtitle,
    required this.id,
    this.isOnline,
    this.commitRole,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roleData = _getRoleStyle(commitRole ?? userRole);
    final formattedRole = _formatRole(userRole);
    final formatDute = _formatRole(subtitle);
    final isAdmin = (isOnline ?? "").toLowerCase().contains("online");

    return InkWell(
      onTap: () {
        context.pop();
        showUserBottomSheet(
          context: context,
          headertitle: userName,
          headersubtitle: formattedRole,
          location: estateName,
          ref: ref,
          bottom: BottomSheetView.initChat,
          id: id,
          access_type: commitRole ?? userRole,
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.instance.black100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Avatar + status
            Stack(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundImage: url.isNotEmpty ? NetworkImage(url) : null,
                  backgroundColor: roleData.color,
                  child:
                      url.isEmpty
                          ? Text(
                            _getInitials(userName),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )
                          : null,
                ),

                // Online indicator (NOT for admin)
                if (isAdmin)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: AppColors.instance.teal500,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(width: 14),

            // Info section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.instance.black600,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Role badge with icon
                  Row(
                    children: [
                      if (formattedRole.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: roleData.color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                roleData.icon,
                                size: 12,
                                color: roleData.color,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                formattedRole,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: roleData.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Subtitle
                  Text(
                    formatDute,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.instance.black400,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            Icon(
              Icons.chevron_right,
              size: 20,
              color: AppColors.instance.black300,
            ),
          ],
        ),
      ),
    );
  }

  // =========================
  // ROLE STYLE (ICON + COLOR)
  // =========================
  _RoleStyle _getRoleStyle(String role) {
    switch (role.toLowerCase()) {
      case 'estate_admin':
        return _RoleStyle(
          Icons.admin_panel_settings,
          AppColors.instance.teal500,
        );
      case 'committee_member':
        return _RoleStyle(Icons.groups, AppColors.instance.blue600);
      case 'security_personnel':
        return _RoleStyle(Icons.security, AppColors.instance.error700);
      case 'board_member':
        return _RoleStyle(Icons.card_membership, AppColors.instance.teal300);
      default:
        return _RoleStyle(Icons.person, Colors.grey);
    }
  }

  // =========================
  // FORMAT ROLE TEXT
  // =========================
  String _formatRole(String role) {
    return role
        .replaceAll('_', ' ')
        .split(' ')
        .map((e) => e.isNotEmpty ? e[0].toUpperCase() + e.substring(1) : '')
        .join(' ');
  }

  // =========================
  // INITIALS
  // =========================
  String _getInitials(String fullName) {
    if (fullName.trim().isEmpty) return '?';
    final parts = fullName.trim().split(RegExp(r'\s+'));
    final first = parts.first[0].toUpperCase();
    final last = parts.length > 1 ? parts.last[0].toUpperCase() : '';
    return '$first$last';
  }
}

// =========================
// ROLE STYLE CLASS
// =========================
class _RoleStyle {
  final IconData icon;
  final Color color;

  _RoleStyle(this.icon, this.color);
}
