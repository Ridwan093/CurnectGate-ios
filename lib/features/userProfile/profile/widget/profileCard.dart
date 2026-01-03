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
  const Profilecard({
    super.key,
    required this.username,
    required this.estateName,

    required this.role,
    required this.memberId,
    required this.userProfileUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.7,
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isSmallScreen =
                constraints.maxWidth < 400; // Covers iPhone SE and similar

            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Image — fixed size
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColors.instance.teal300,
                    image: DecorationImage(
                      image:
                          userProfileUrl.isNotEmpty
                              ? NetworkImage(userProfileUrl)
                              : AssetImage(AssetPaths.navProfileActive)
                                  as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                      Text(
                        estateName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 10,
                          fontWeight: FontFamilies.bold,
                          color: AppColors.instance.black600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        role,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 12,
                          fontWeight: FontFamilies.bold,
                          color: AppColors.instance.black300,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        memberId,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 12,
                          fontWeight: FontFamilies.bold,
                          color: AppColors.instance.grey500,
                        ),
                      ),
                    ],
                  ),
                ),

                // QR section — fixed width, never squeezed
                Padding(
                  padding: EdgeInsets.only(left: isSmallScreen ? 8 : 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            AssetPaths.qr,
                            color: AppColors.instance.teal300,
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "My QR",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 12,
                          fontWeight: FontFamilies.bold,
                          color: AppColors.instance.grey400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
