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
      elevation: .7,
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(12),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Expanded(
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColors.instance.teal300,
                      image: DecorationImage(
                        image:
                            userProfileUrl.isNotEmpty
                                ? NetworkImage(userProfileUrl)
                                : AssetImage(AssetPaths.navProfileActive),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          username,
                          overflow: TextOverflow.ellipsis,
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
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 10,
                            fontWeight: FontFamilies.bold,
                            color: AppColors.instance.black600,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          role,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 12,
                            fontWeight: FontFamilies.bold,
                            color: AppColors.instance.black300,
                          ),
                        ),
                        SizedBox(height: 3),
                        Expanded(
                          child: Text(
                            memberId,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              fontSize: 12,
                              fontWeight: FontFamilies.bold,
                              color: AppColors.instance.grey500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      AssetPaths.qr,
                      color: AppColors.instance.teal300,
                      width: 25,
                    ),
                  ),
                ),
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
          ],
        ),
      ),
    );
  }
}
