import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowEventDecFromHost extends ConsumerWidget {
  final String descriptionFromHost;
  const ShowEventDecFromHost({super.key, required this.descriptionFromHost});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        // Show animated dialog
        showGeneralDialog(
          context: context,
          barrierDismissible: true, // Dismiss when tapping outside
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black54, // Semi-transparent background
          transitionDuration: Duration(milliseconds: 300), // Animation speed
          pageBuilder: (context, animation, secondaryAnimation) {
            return Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.instance.grey300,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        "Host's Note",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontWeight: FontFamilies.bold,
                          fontSize: 18,
                          color: AppColors.instance.black500,
                        ),
                      ),
                      SizedBox(height: 12),
                      // Event Description
                      Text(
                        descriptionFromHost.isEmpty
                            ? "No description provided by host."
                            : descriptionFromHost,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontWeight: FontFamilies.regular,
                          fontSize: 16,
                          color: AppColors.instance.black400,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Close Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            "Close",
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              fontWeight: FontFamilies.medium,
                              color: AppColors.instance.blue500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          transitionBuilder: (context, animation, secondaryAnimation, child) {
            // Scale animation
            return ScaleTransition(
              scale: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutBack, // Smooth pop-in effect
              ),
              child: child,
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: 50,
        decoration: BoxDecoration(color: AppColors.instance.grey300),
        child: Row(
          children: [
            Icon(Icons.arrow_right, color: AppColors.instance.blue500),
            Text(
              "Event description from host",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.medium,
                color: AppColors.instance.black400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
