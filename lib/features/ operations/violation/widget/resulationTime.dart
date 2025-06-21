import 'package:flutter/material.dart';

class ResolutionTimeline extends StatelessWidget {
  const ResolutionTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header
          const Text(
            'Resolution Timeline',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Improper parking (Block 57)',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 16),

          // Custom Timeline
          Column(
            children: [
              _buildTimelineItem(
                time: '20:40 PM',
                title: 'Report sent has been confirmed',
                subtitle: 'We are currently looking this up',
                isFirst: true,
                isCompleted: true,
              ),
              _buildTimelineItem(
                time: '15:30 PM',
                title: 'Report has been assigned to authorities involved',
                subtitle: '',
                isCompleted: true,
              ),
              _buildTimelineItem(
                time: 'Pending',
                title: ' Waiting resolution',
                subtitle: '',
                isCompleted: false,
                isLast: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String time,
    required String title,
    required String subtitle,
    bool isFirst = false,
    bool isLast = false,
    bool isCompleted = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time Column (Left Side)
          SizedBox(
            width: 60,
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: isCompleted ? Colors.black : Colors.grey,
                  fontWeight: isCompleted ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),

          // Timeline Indicator and Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Timeline Line and Indicator
                    Column(
                      children: [
                        if (!isFirst)
                          Container(
                            width: 1,
                            height: 24,
                            color: Colors.grey[300],
                          ),
                        Container(
                          width: 20,
                          height: 20,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                isCompleted ? Colors.green : Colors.grey[300],
                          ),
                          child:
                              isCompleted
                                  ? const Icon(
                                    Icons.check,
                                    size: 14,
                                    color: Colors.white,
                                  )
                                  : null,
                        ),
                        if (!isLast)
                          Container(
                            width: 1,
                            height: 24,
                            color: Colors.grey[300],
                          ),
                      ],
                    ),
                    const SizedBox(width: 12),

                    // Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color:
                                  isCompleted ? Colors.black : Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          if (!isLast) const SizedBox(height: 16),
                        ],
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
}
