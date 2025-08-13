class TimeagoModel {
  final DateTime createdAt;

  TimeagoModel(this.createdAt);

  String get timeAgo => formatTimeAgo(createdAt);
}

String formatTimeAgo(DateTime dateTime) {
  final now = DateTime.now().toUtc();
  final diff = now.difference(dateTime);

  if (diff.inSeconds < 60) {
    return 'Just now';
  } else if (diff.inMinutes < 60) {
    return '${diff.inMinutes}m ago';
  } else if (diff.inHours < 24) {
    return '${diff.inHours}h ago';
  } else if (diff.inDays == 1) {
    return 'Yesterday';
  } else if (diff.inDays < 7) {
    return '${diff.inDays}d ago';
  } else {
    return '${_monthAbbr(dateTime.month)} ${dateTime.day}';
  }
}

String _monthAbbr(int month) {
  const months = [
    '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  return months[month];
}
