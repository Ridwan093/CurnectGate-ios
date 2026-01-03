import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/first_chat_init_data/estate_admin_data.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/first_chat_init_data/estate_committee_data.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EstateAdminSelectionSheet extends ConsumerWidget {
  final String type;

  const EstateAdminSelectionSheet({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Demo data — replace with your real admin data
    final List<EstateAdmin> admins = [
      EstateAdmin(
        id: 1,
        name: "Aisha Muhammad",
        role: "Estate Manager",
        isOnline: true,
        profileImage: "https://via.placeholder.com/50",
        lastSeen: "Active now",
      ),
      EstateAdmin(
        id: 2,
        name: "Dr. Chinedu Okeke",
        role: "Security Head",
        isOnline: false,
        profileImage: "https://via.placeholder.com/50",
        lastSeen: "Last seen 2h ago",
      ),
      EstateAdmin(
        id: 3,
        name: "Fatima Abdullahi",
        role: "Maintenance Supervisor",
        isOnline: true,
        profileImage: "https://via.placeholder.com/50",
        lastSeen: "Active now",
      ),
      EstateAdmin(
        id: 4,
        name: "Engr. Samuel Okafor",
        role: "Technical Lead",
        isOnline: false,
        profileImage: "https://via.placeholder.com/50",
        lastSeen: "Last seen 1d ago",
      ),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header
        Column(
          children: [
            // Close button
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.close,
                    color: AppColors.instance.black400,
                    size: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Title
            Text(
              "Select Admin to Chat",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.instance.black600,
              ),
            ),
            const SizedBox(height: 4),

            // Subtitle
            Text(
              "Choose an estate administrator to start a conversation about your concern",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 14,
                color: AppColors.instance.black400,
                height: 1.3,
              ),
            ),
          ],
        ),

        // Divider
        Container(height: 1, color: AppColors.instance.grey300),
        SizedBox(height: 10),
        // Admin List
        if (type.contains("admin")) ...[
          EstateAdminData(role: type),
        ] else if (type.contains("committee")) ...[
          EstateCommitteeData(role: type),
        ] else if (type.contains("security"))
          ...[

       ]
      ],
    );
  }

  Widget _buildAdminTile(
    BuildContext context,
    EstateAdmin admin,
    WidgetRef ref,
  ) {
    return InkWell(
      onTap: () {
        context.pop();
        showUserBottomSheet(
          context: context,
          headertitle: admin.name,
          headersubtitle: admin.role,
          location: "Medina Estate",
          ref: ref,
          bottom: BottomSheetView.initChat,
          id: admin.id,
          access_type: type,
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(10),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.black.withOpacity(0.04),
        //       blurRadius: 8,
        //       offset: const Offset(0, 2),
        //     ),
        //   ],
        // ),
        child: Row(
          children: [
            // Profile Avatar
            Stack(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundImage:
                      admin.profileImage.isNotEmpty
                          ? NetworkImage(admin.profileImage)
                          : null,
                  backgroundColor:
                      admin.isOnline
                          ? AppColors.instance.teal300
                          : AppColors.instance.grey300,
                  child:
                      admin.profileImage.isEmpty
                          ? Text(
                            _getInitials(admin.name),
                            style: const TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )
                          : null,
                ),
                // Online indicator
                if (admin.isOnline)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(width: 16),

            // Admin Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    admin.name,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 2),

                  // Role
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.instance.teal100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      admin.role,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.instance.teal500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Last seen
                  Row(
                    children: [
                      Icon(
                        admin.isOnline ? Icons.circle : Icons.schedule,
                        size: 14,
                        color:
                            admin.isOnline
                                ? Colors.green
                                : AppColors.instance.black400,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          admin.lastSeen,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 12,
                            color: AppColors.instance.black400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Arrow
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.instance.black300,
            ),
          ],
        ),
      ),
    );
  }

  String _getInitials(String fullName) {
    if (fullName.trim().isEmpty) return '?';
    final parts = fullName.trim().split(RegExp(r'\s+'));
    final first = parts.first[0].toUpperCase();
    final last = parts.length > 1 ? parts.last[0].toUpperCase() : '';
    return '$first$last';
  }
}

// Model (create this for typing)
class EstateAdmin {
  final int id;
  final String name;
  final String role;
  final bool isOnline;
  final String profileImage;
  final String lastSeen;

  const EstateAdmin({
    required this.id,
    required this.name,
    required this.role,
    required this.isOnline,
    required this.profileImage,
    required this.lastSeen,
  });
}
