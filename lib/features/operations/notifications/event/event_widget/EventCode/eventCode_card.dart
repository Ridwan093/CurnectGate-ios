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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date Column
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                eventDate.split(" ").first,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 20,
                  fontWeight: FontFamilies.medium,
                  color: AppColors.instance.teal300,
                ),
              ),
              Text(
                eventDate.split(" ")[1].replaceAll(",", ""),
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 30,
                  fontWeight: FontFamilies.bold,
                  color: AppColors.instance.teal300,
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          // Divider
          Container(width: 2, height: 80, color: AppColors.instance.teal300),

          const SizedBox(width: 12),

          // Main content — takes remaining space
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  eventTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.teal300,
                    fontWeight: FontFamilies.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 6),

                // Description — takes available space
                Text(
                  dec,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black400,
                    fontSize: 13,
                    height: 1.3,
                  ),
                ),

                const SizedBox(height: 10),

                // Bottom Row: Code + Status — min size, no wrapping issues
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    _codeRow(code, context),
                    // const SizedBox(width: 10),
                    // Direct badge — no Flexible, no IntrinsicWidth
                    _buildStatusBadge(isExpired),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Keep your status badge simple
  Widget _buildStatusBadge(String isExpired) {
    Color bgColor;
    Color textColor;

    switch (isExpired.toLowerCase()) {
      case 'active':
        bgColor = Colors.green.withOpacity(0.1);
        textColor = Colors.green;
        break;
      case 'expired':
      case 'revoked':
        bgColor = Colors.red.withOpacity(0.1);
        textColor = Colors.red;
        break;
      default:
        bgColor = Colors.grey.withOpacity(0.1);
        textColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        isExpired,
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _codeRow(String code, BuildContext context) {
    return Row(
      spacing: 7,
      children: [
        Text(
          code,
          overflow: TextOverflow.ellipsis,
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
