import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/operations/notifications/event/model/EventCodes/event_code_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class EventCodeWidget extends StatelessWidget {
  final EventCode data;
  const EventCodeWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
              Text(
                "Event Code Details",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 20,
                  color: AppColors.instance.black600,
                ),
              ),
              Divider(color: AppColors.instance.grey400),
            ],
          ),
          const SizedBox(height: 40),

          // QR Code Placeholder (replace with actual QR widget)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_city,
                    size: 20,
                    color: AppColors.instance.teal300,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      data.eventLocation?.toUpperCase() ?? 'UNKNOWN LOCATION',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontFamilies.bold,
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black600,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
              Text(
                'ENTRY CODE',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontFamilies.bold,

                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                ),
              ),
              SizedBox(height: 10),
              // Copyable Code Section
              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: data.eventCode ?? ""));
                  showCustomSuccessToast(
                    context: context,
                    message: "Copied",
                    color: AppColors.instance.teal300,
                    icon: Icons.check_circle,
                    iconColors: AppColors.instance.black600,
                    positionNumber: 70,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 15),
                    Text(
                      data.eventCode ?? "",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontFamilies.medium,

                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black600,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(AssetPaths.clipboard, height: 20, width: 20),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Priority Pass Divider
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[400])),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.instance.grey300,
                    ),

                    child: Center(
                      child: Text(
                        'PRIORITY PASS',
                        style: TextStyle(
                          color: AppColors.instance.black300,
                          fontWeight: FontFamilies.bold,
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 10,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey[400])),
                ],
              ),

              const SizedBox(height: 30),

              Text(
                'Event Name',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontFamilies.bold,

                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                data.eventTitle.toString().toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontFamilies.bold,

                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),

              const SizedBox(height: 15),
              Text(
                'Type',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontFamilies.bold,

                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                data.eventTypeDisplay.toString().toUpperCase(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontFamilies.bold,

                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 20),

              // Status Indicator
              Text(
                'Status',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontFamilies.bold,

                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                ),
              ),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.status.toString().toUpperCase(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontFamilies.bold,

                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(width: 5),
                  CircleAvatar(
                    radius: 3,
                    backgroundColor: _buildColor(data.status ?? ""),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _buildColor(String status) {
    switch (status) {
      case "active":
        return AppColors.instance.teal500;

      case "inactive":
        return AppColors.instance.grey500;
      default:
        return AppColors.instance.grey500;
    }
  }
}
