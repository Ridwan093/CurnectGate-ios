import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class Profilecard extends StatelessWidget {
  final String username;
  final String estateName;

  final String role;
  final String memberId;
  final String userProfileUrl;
  final VoidCallback onTap;
  const Profilecard({
    super.key,
    required this.username,
    required this.estateName,

    required this.role,
    required this.memberId,
    required this.userProfileUrl,
    required this.onTap,
  });

  Color? getRoleColor(String role) {
    switch (role.toLowerCase().trim()) {
      case 'landlord':
      case 'owner':
        return AppColors
            .instance
            .black500; // Deep Purple – authority, ownership, premium

      case 'security_personal':
      case 'security':
      case 'security_personnel':
      case 'guard':
        return AppColors.instance.error700;

      case 'spouse':
        return AppColors.instance.black500; // Pink – warm, family, affection

      case 'project_manager':
      case 'manager':
        return AppColors
            .instance
            .blue300; // Blue – professional, trust, management

      case 'tenant':
        return AppColors
            .instance
            .teal500; // Green – resident, growth, living space

      case 'family_member':
        return AppColors
            .instance
            .yellow500; // Orange – family warmth, approachable, group

      default:
        return Colors.grey.shade700; // Neutral fallback
    }
  }

  IconData getRoleIcon(String role) {
    switch (role.toLowerCase().trim()) {
      // normalize input (case-insensitive)
      case 'landlord':
      case 'owner':
        return Icons.home; // house/bank/building icon (classic landlord)

      case 'security_personal':
      case 'security':
      case 'security_personnel':
        return Icons.local_police; // shield/lock/security icon

      case 'spouse':
        return Icons.wc; // heart (family/spouse)
      // Alternative: Icons.people_alt or Icons.wc (more neutral)

      case 'project_manager':
      case 'manager':
        return Icons.engineering; // hard hat / construction manager feel
      // Alternative: Icons.manage_accounts or Icons.supervisor_account

      case 'tenant':
        return Icons.apartment; // home (person living in the property)
      // Alternative: Icons.apartment or Icons.person_pin

      case 'family_member':
        return Icons.family_restroom; // people/group (family)
      // Alternative: Icons.family_restroom or Icons.people

      default:
        return Icons.person_outline; // fallback for unknown roles
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isSmallScreen =
            constraints.maxWidth < 400; // Covers iPhone SE and similar

        return InkWell(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Image — fixed size
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: AppColors.instance.teal300,
                  image:
                      userProfileUrl.isNotEmpty
                          ? DecorationImage(
                            image:
                                userProfileUrl.isNotEmpty
                                    ? NetworkImage(userProfileUrl)
                                    : AssetImage(AssetPaths.navProfileActive)
                                        as ImageProvider,
                            fit: BoxFit.cover,
                          )
                          : null,
                  shape: BoxShape.circle,
                ),
                child:
                    userProfileUrl.isEmpty
                        ? Center(
                          child: Icon(
                            Icons.person,
                            size: 30,
                            color: AppColors.instance.black500,
                          ),
                        )
                        : SizedBox.shrink(),
              ),

              const SizedBox(width: 12),

              // Text info — takes remaining space safely
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      username,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 18,
                        fontWeight: FontFamilies.bold,
                        color: AppColors.instance.black600,
                      ),
                    ),
                    // Text(
                    //   estateName,
                    //   overflow: TextOverflow.ellipsis,
                    //   maxLines: 1,
                    //   style: TextStyle(
                    //     fontFamily: FontFamilies.interDisplay,
                    //     fontSize: 10,
                    //     fontWeight: FontFamilies.bold,
                    //     color: AppColors.instance.black600,
                    //   ),
                    // ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          getRoleIcon(role),
                          size: 20,
                          color: getRoleColor(role),
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            role,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              fontSize: 15,
                              fontWeight: FontFamilies.regular,
                              color: AppColors.instance.black500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 4),
                    // Text(
                    //   memberId,
                    //   overflow: TextOverflow.ellipsis,
                    //   maxLines: 1,
                    //   style: TextStyle(
                    //     fontFamily: FontFamilies.interDisplay,
                    //     fontSize: 12,
                    //     fontWeight: FontFamilies.bold,
                    //     color: AppColors.instance.grey500,
                    //   ),
                    // ),
                  ],
                ),
              ),

              // QR section — fixed width, never squeezed
              Padding(
                padding: EdgeInsets.only(left: isSmallScreen ? 8 : 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.instance.black600,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
