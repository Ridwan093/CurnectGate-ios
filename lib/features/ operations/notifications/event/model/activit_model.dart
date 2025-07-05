

enum ActivityStatus { granted, denied, completed, pending }

class ActivityItem {
  final String title;
  final String subtitle;
  final String time;
  final String date;
  final String actualDate;
  final ActivityStatus status;

  ActivityItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.status,
    required this.actualDate,
    required this.date,
  });
}
