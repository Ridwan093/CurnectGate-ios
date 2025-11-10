import 'package:flutter/material.dart';

class ElectionCard extends StatelessWidget {
  final String title;
  final String status;
  final String description;
  final int daysLeft;
  final int votedCount;
  final int totalVoters;
  final double turnoutPercentage;

  const ElectionCard({
    super.key,
    required this.title,
    required this.status,
    required this.description,
    required this.daysLeft,
    required this.votedCount,
    required this.totalVoters,
    required this.turnoutPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.green),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$daysLeft day${daysLeft == 1 ? '' : 's'} left',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              Text(
                '$votedCount / $totalVoters voted',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // LinearProgressIndicator(
          //   value: turnoutPercentage / 100,
          //   backgroundColor: Colors.grey[200],
          //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          // ),
          const SizedBox(height: 8),
          Text(
            '${turnoutPercentage.toStringAsFixed(1)}% turnout',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
