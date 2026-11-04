import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class QuikLinkCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isfund;

  const QuikLinkCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isfund,
  });

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to make size proportional & responsive
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardWidth =
        (screenWidth - 48) / 3; // ≈3 cards per row on phone, with spacing

    return SizedBox(
      width: cardWidth.clamp(
        100.0,
        160.0,
      ), // min 100px, max ~160px → never too big/small
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Material(
          elevation: 6, // softer than 8, looks pro on teal
          shadowColor: Colors.black.withOpacity(0.20),
          borderRadius: BorderRadius.circular(12),
          color: AppColors.instance.teal400,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isfund) ...[
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 16,
                      color: AppColors.instance.teal100,
                      fontWeight:
                          FontWeight
                              .bold, // assuming FontFamilies.bold = FontWeight.bold
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 10),
                  Container(
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.instance.grey300.withOpacity(.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icon,
                            color: AppColors.instance.yellow400,
                            size: 17,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Now",
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              fontSize: 13,
                              color: AppColors.instance.teal100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ] else ...[
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.instance.teal200,
                    child: Icon(
                      icon,
                      size: 25,
                      color: AppColors.instance.teal400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 13,
                      color: AppColors.instance.teal100,
                      fontWeight:
                          FontWeight
                              .bold, // assuming FontFamilies.bold = FontWeight.bold
                      height: 1.2,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
