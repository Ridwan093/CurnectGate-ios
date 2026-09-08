import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/first_chat_init_data/estate_admin_data.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/first_chat_init_data/estate_committee_data.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/first_chat_init_data/security_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EstateAdminSelectionSheet extends ConsumerWidget {
  final String type;

  const EstateAdminSelectionSheet({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String title = "Select Admin to Chat";
    String subtitle =
        "Choose an estate administrator to start a conversation about your concern";

    if (type.contains("committee")) {
      title = "Select Committee to Chat";
      subtitle =
          "Choose a committee member to start a conversation about your concern";
    } else if (type.contains("security")) {
      title = "Select Security to Chat";
      subtitle =
          "Choose a security personnel to start a conversation about your concern";
    }

    // Demo data — replace with your real admin data

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
              title,
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
              subtitle,
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
        ] else if (type.contains("security")) ...[
          SecurityData(role: type),
        ],
      ],
    );
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
