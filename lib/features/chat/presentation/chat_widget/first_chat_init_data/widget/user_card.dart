import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
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
  final bool isOnline;
  final String lastSeen;
  final int id;

  const UserCard({
    super.key,
    required this.userName,
    required this.userRole,
    required this.estateName,
    required this.url,
    required this.isOnline,
    required this.lastSeen,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        context.pop();
        showUserBottomSheet(
          context: context,
          headertitle: userName,
          headersubtitle: userRole,
          location: estateName,
          ref: ref,
          bottom: BottomSheetView.initChat,
          id: id,
          access_type: userRole,
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
                  backgroundImage: url.isNotEmpty ? NetworkImage(url) : null,
                  backgroundColor:
                      isOnline
                          ? AppColors.instance.teal300
                          : AppColors.instance.grey300,
                  child:
                      url.isEmpty
                          ? Text(
                            _getInitials(userName),
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
                if (isOnline)
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
                    userName,
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
                      userRole,
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
                        isOnline ? Icons.circle : Icons.schedule,
                        size: 14,
                        color:
                            isOnline
                                ? Colors.green
                                : AppColors.instance.black400,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          lastSeen,
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
