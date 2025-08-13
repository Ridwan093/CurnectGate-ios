
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/notifications/event/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final bool iscancle;
  final Event event;
  final bool showActions;
  final Function(bool)? onGoing;
  final VoidCallback? onTap;

  const EventCard({
    super.key,
    required this.event,
    required this.iscancle,
    this.showActions = true,

    this.onGoing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AssetPaths.eventyellow, height: 50, width: 50),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title,
                      style: TextStyle(
                        fontWeight: FontFamilies.bold,
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildEventcontent(
                      icon: Icons.access_time,
                      title: DateFormat('hh:mm a').format(event.date),
                    ),
                    const SizedBox(height: 10),
                    _buildEventcontent(
                      icon: Icons.location_on_outlined,
                      title: event.subtitle,
                    ),

                    const SizedBox(height: 8),
                    if (iscancle) ...[
                      Text(
                        "You cancelled this event",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 12,
                          fontWeight: FontFamilies.bold,
                          color: AppColors.instance.error600,
                        ),
                      ),
                    ] else ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(
                            "Going?",
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              color: AppColors.instance.black600,

                              fontWeight: FontFamilies.medium,
                            ),
                          ),

                          Row(
                            children: [
                              _buuildEventconfirmButton(
                                showActions: showActions,
                                onPressed: () => onGoing?.call(true),
                                title: "Yes",
                              ),
                              _buuildEventconfirmButton(
                                showActions: true,
                                onPressed: () => onGoing?.call(false),
                                title: "No",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventcontent({required IconData icon, required String title}) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.instance.black300),
        const SizedBox(width: 5),
        Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 12,
            fontWeight: FontFamilies.medium,
            color: AppColors.instance.black300,
          ),
        ),
      ],
    );
  }
}

Widget _buuildEventconfirmButton({
  required bool showActions,
  required String title,
  required VoidCallback onPressed,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      margin: EdgeInsets.all(5),
      height: 35,
      width: !showActions ? 70 : 50,
      decoration: BoxDecoration(
        color:
            !showActions
                ? AppColors.instance.teal300
                : AppColors.instance.grey400,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child:
            !showActions
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                        color: AppColors.instance.black600,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.done,
                      size: 12,
                      color: AppColors.instance.black600,
                    ),
                  ],
                )
                : Text(
                  title,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    color: AppColors.instance.black600,
                  ),
                ),
      ),
    ),
  );
}
