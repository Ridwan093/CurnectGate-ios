import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class ResolutionTimeline extends StatelessWidget {
  const ResolutionTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Container(
            alignment: Alignment.topCenter,
            height: 4,
            width: 40,
            color: AppColors.instance.grey300,
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Close",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.teal400,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Resolution timeline',
            style: TextStyle(
              fontSize: 13,
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Improper parking (Block 57)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 40),
          Column(
            children: [
              _buildTimelineStep(
                time: '20:40 PM',
                title: 'Report sent has been confirmed',
                subtitle: 'We are currently looking this up',
                isFirst: true,
                isCompleted: true,
              ),
              _buildTimelineStep(
                time: '15:30 PM',
                title: 'Report has been assigned to authorities involved',
                subtitle: '',
                isCompleted: true,
              ),
              _buildTimelineStep(
                time: '4:20 PM',
                title: 'marked as Done',
                subtitle: '',
                isCompleted: true,
                isLast: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineStep({
    required String time,
    required String title,
    required String subtitle,
    bool isFirst = false,
    bool isLast = false,
    bool isCompleted = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Time column
        isCompleted
            ? SizedBox(
              width: 60,
              child: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.instance.black400,
                    fontWeight: FontFamilies.medium,
                    fontFamily: FontFamilies.interDisplay,
                  ),
                ),
              ),
            )
            : SizedBox(),

        // Timeline line + circle
        Container(
          width: 24,
          child: Column(
            children: [
              // Short top line
              if (!isFirst)
                Container(
                  height: 8, // Shorter top line
                  width: 3,
                  color: AppColors.instance.teal300,
                ),

              // Step circle
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isCompleted
                          ? AppColors.instance.teal300
                          : AppColors.instance.grey300,
                ),
                child:
                    isCompleted
                        ? Icon(
                          Icons.check,
                          size: 14,
                          color: AppColors.instance.grey200,
                        )
                        : Center(
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.instance.grey200,
                            ),
                          ),
                        ),
              ),

              // Long bottom line
              if (!isLast)
                Container(
                  height: 40, // Longer bottom line
                  width: 3,
                  color: AppColors.instance.teal300,
                ),
            ],
          ),
        ),

        const SizedBox(width: 12),

        // Step content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontWeight.w500,
                    color:
                        isCompleted
                            ? AppColors.instance.black600
                            : AppColors.instance.grey500,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
