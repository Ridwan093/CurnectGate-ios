import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/notifications/event/event.dart';
import 'package:curnectgate/features/member_management/screen/membership_ID/memberIDScreen.dart';
import 'package:flutter/material.dart';

class NotificationPermissionScreen extends StatelessWidget {
  const NotificationPermissionScreen({super.key});
  void showEventsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder:
          (context) => Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.9,
            ),
            child: const EventsBottomSheet(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100), // 50px from top
            // Bell Icon
            Image.asset(AssetPaths.notificationBell, height: 50, width: 50),

            const SizedBox(height: 24),

            // Main Text
            Text(
              "Turn on notifications",
              style: TextStyle(
                fontSize: 22,
                color: AppColors.instance.black600,
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Subtitle Text
            Text(
              "Get notified about upcoming events",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontFamilies.medium,
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Expanded pushes content down
            const Expanded(child: SizedBox()),

            // Buttons Row
            Row(
              children: [
                // Maybe Later Button
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        // Handle maybe later

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DigitalCardScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Maybe later",
                        style: TextStyle(
                          color: AppColors.instance.black600,
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Turn On Button
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      onPressed: () => showEventsBottomSheet(context),
                      child: Text(
                        "Turn on",
                        style: TextStyle(
                          color: AppColors.instance.grey200,
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
