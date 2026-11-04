import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

void shareEvent({
  required String title,
  required String description,
  required String startDateTime,
  required String endDateTime,
  required String location,
  required String venue,
  String? eventImageUrl,
}) {
  // Format the date and time nicely
  final startDate = DateTime.parse(startDateTime).toLocal();
  final endDate = DateTime.parse(endDateTime).toLocal();
  final formattedDate = DateFormat('MMM dd, yyyy').format(startDate);
  final formattedStartTime = DateFormat('h:mm a').format(startDate);
  final formattedEndTime = DateFormat('h:mm a').format(endDate);

  // Create the share message
  final shareText = '''
📅 *${title}*
📝 ${description}
📅 Date: ${formattedDate}
🕒 Time: ${formattedStartTime} - ${formattedEndTime}
📍 Location: ${location}, ${venue}
${eventImageUrl != null ? '🌐 Event Image: $eventImageUrl' : ''}
Join us for this event! 🎉
''';

  // Share the text
  // ignore: deprecated_member_use
  Share.share(
    shareText,
    subject: title, // Subject for email or other apps
  );
}
