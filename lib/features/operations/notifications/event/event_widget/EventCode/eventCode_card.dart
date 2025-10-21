import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/operations/notifications/event/model/EventCodes/event_code_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/EventCodes/image_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventcodeCard extends ConsumerWidget {
  final VoidCallback onTap;
  final EventCode event;
  const EventcodeCard({super.key, required this.event, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = EventImageHelper.getEventImage(event.eventTypeDisplay);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Stack(
          children: [
            // Background card
            Material(
              borderRadius: BorderRadius.circular(30),
              elevation: 0,
              child: Container(
                padding: EdgeInsets.only(top: 220),

                decoration: BoxDecoration(
                  color: AppColors.instance.grey200,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(0, 6),
                      blurRadius: 12,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _cardRow(
                      eventDate: event.eventStartFormatted ?? "",
                      eventLocation: event.address ?? "",
                      eventTitle: event.eventTitle ?? "",
                      dec: event.eventDescription ?? "",
                      isExpired: event.status ?? "",
                      code: event.eventCode ?? "",
                      context: context,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // Top Image
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, // softer color
                      offset: const Offset(
                        0,
                        6,
                      ), // 👈 pushes the shadow down only
                      blurRadius: 10, // 👈 controls softness
                      spreadRadius:
                          0, // 👈 set to 0 to prevent spreading on all sides
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardRow({
    required String eventDate,
    required String eventLocation,
    required String eventTitle,
    required String dec,
    required String code,
    required String isExpired,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 📅 Date Column
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                eventDate.split(" ").first, // e.g. "Oct"
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 20,
                  fontWeight: FontFamilies.medium,
                  color: AppColors.instance.teal300,
                ),
              ),
              Text(
                eventDate.split(" ")[1].replaceAll(",", ""), // e.g. "20"
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 30,
                  fontWeight: FontFamilies.bold,
                  color: AppColors.instance.teal300,
                ),
              ),
            ],
          ),

          const SizedBox(width: 10),

          // Vertical Divider
          Container(width: 2, height: 90, color: AppColors.instance.teal300),

          const SizedBox(width: 10),

          // 🏠 Event Details Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  eventTitle,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.teal300,
                    fontWeight: FontFamilies.bold,
                    fontSize: 20,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  dec,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black400,
                    fontSize: 13,
                    height: 1.3,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 8),

                // 🟩 Code + Expired Row (NEW)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Event Code Container
                    _codeRow(code, context),
                    const SizedBox(width: 8),

                    // Expired/Active Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _Color(
                          isExpired,
                          red: Colors.red.withOpacity(0.1),
                          green: Colors.green.withOpacity(0.1),
                          grey: Colors.grey.withOpacity(0.1),
                        ),

                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isExpired,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: _Color(
                            isExpired,
                            red: Colors.red,
                            green: Colors.green,
                            grey: Colors.grey,
                          ),
                          fontSize: 12,
                          fontWeight: FontFamilies.medium,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _Color(
    String status, {
    required Color red,
    required Color green,
    required Color grey,
  }) {
    switch (status.toLowerCase()) {
      case "revoked":
        return red;
      case "pending":
        return grey;
      default:
        return green;
    }
  }

  Widget _codeRow(String code, BuildContext context) {
    return Row(
      spacing: 7,
      children: [
        Text(
          code,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 13,
            color: AppColors.instance.black600,
          ),
        ),

        InkWell(
          onTap: () {
            Clipboard.setData(ClipboardData(text: code));
            showCustomSuccessToast(
              context: context,
              message: "Copied",
              color: AppColors.instance.teal300,
              icon: Icons.check_circle,
              iconColors: AppColors.instance.black600,
              positionNumber: 70,
            );
          },
          child: Image.asset(AssetPaths.clipboard, height: 15, width: 15),
        ),
      ],
    );
  }
}
