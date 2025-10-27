import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/screens/election_dashboard.dart';
import 'package:flutter/material.dart';

class Headcard extends StatelessWidget {
  const Headcard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Material(
          color: AppColors.instance.teal400,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(12),
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.instance.teal400,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Greenville.",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 25,
                        color: AppColors.instance.grey200,
                        fontWeight: FontFamilies.bold,
                      ),
                    ),
                    Text(
                      "ESTATE",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 14,
                        wordSpacing: 10,
                        letterSpacing: 10,
                        color: AppColors.instance.grey400,
                        fontWeight: FontFamilies.medium,
                      ),
                    ),
                  ],
                ),
                Image.asset(AssetPaths.qrCode, width: 40, height: 40),
              ],
            ),
          ),
        ),
        Material(
          elevation: 3,
          color: AppColors.instance.teal200.withOpacity(.9),
          // ignore: deprecated_member_use
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(12),
            height: 100,
            width: size.width,
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: AppColors.instance.teal400.withOpacity(.8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "MEMBER",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 14,

                          color: AppColors.instance.grey400,
                          fontWeight: FontFamilies.medium,
                        ),
                      ),
                      Text(
                        "Benjamin Afolabi",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 19,
                          color: AppColors.instance.grey200,
                          fontWeight: FontFamilies.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ElectionPage()),
                      );
                    },
                    child: Icon(
                      Icons.how_to_vote,
                      color: AppColors.instance.yellow500,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
