import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/notifications/event/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DasboardEventcard extends StatelessWidget {
  final bool iscancle;
  final Event event;
  final bool showActions;
  final Function(bool)? onGoing;
  final VoidCallback? onTap;

  const DasboardEventcard({
    super.key,
    required this.event,
    required this.iscancle,
    this.showActions = true,

    this.onGoing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
        elevation: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            //         boxShadow: [
            // BoxShadow(
            //   spreadRadius: 5,
            //   blurRadius: 5,
            //   blurStyle: BlurStyle.solid,
            //   color: AppColors.instance.grey200

            // ),
            // ],
            borderRadius: BorderRadius.circular(10),
          ),

          // margin: const EdgeInsets.only(bottom: 8),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(event.imagepath, width: 20),
                      SizedBox(width: 5),
                      Text(
                        "Estate commite",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontFamilies.medium,
                          color: AppColors.instance.black300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
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
                    isTime: true,
                    icon: Icons.access_time,
                    title: DateFormat('hh:mm a').format(event.date),
                  ),
                  const SizedBox(height: 10),
                  _buildEventcontent(
                    isTime: false,
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
                      children: [
                        _buuildEventconfirmButton(
                          showActions: showActions,
                          onPressed: () => onGoing?.call(true),
                          title: "Going?",
                        ),
                        _buuildEventconfirmButton(
                          showActions: true,
                          onPressed: () => onGoing?.call(false),
                          title: "Decline",
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventcontent({
    required IconData icon,
    required String title,
    required bool isTime,
  }) {
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

        if (isTime) ...[
          Text(
            " -",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              fontWeight: FontFamilies.medium,
              color: AppColors.instance.black600,
            ),
          ),
          Text(
            " 400 PM GMT",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              fontWeight: FontFamilies.medium,
              color: AppColors.instance.teal300,
            ),
          ),
        ],
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
      width: !showActions ? 70 : 70,
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
