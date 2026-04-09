import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class Logcard extends ConsumerWidget {
  final String userName;
  final String entrytitle;
  final String? entrypath;
  final String entryType;
  final String entryTime;
  final String isAllow;

  Logcard({
    super.key,
    required this.entrytitle,
    required this.entryTime,
    required this.entryType,
    required this.entrypath,
    required this.userName,
    required this.isAllow,
  });
  String formatDateTime(String dateString, {String? timeZone}) {
    // Parse the ISO 8601 date string (UTC)
    DateTime dateTime = DateTime.parse(dateString);

    // Adjust for WAT (UTC+1) if specified
    if (timeZone == 'WAT') {
      dateTime = dateTime.add(const Duration(hours: 1));
    }

    // Create a DateFormat instance for date and time (e.g., Aug 19, 2025, 5:04 AM)
    final DateFormat formatter = DateFormat('MMM d, yyyy, h:mm a');

    // Format the date and time
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    String avatarUrl =
        'https://ui-avatars.com/api/?name=${Uri.encodeComponent(userName)}&background=8EC0C9&color=ffffff&size=128';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          width: size.width,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.instance.grey300),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: NetworkImage(avatarUrl),
                    ),
                    SizedBox(width: 12),
                    Container(
                      padding: EdgeInsets.only(
                        left: 6,
                        right: 6,
                        top: 3,
                        bottom: 3,
                      ),
                      decoration: BoxDecoration(
                        border:
                            entrytitle.toLowerCase().contains(isAllow)
                                ? null
                                : Border.all(
                                  color: AppColors.instance.error600,
                                ),
                        borderRadius: BorderRadius.circular(10),
                        color:
                            entrytitle.toLowerCase().contains(isAllow)
                                ? AppColors.instance.teal100
                                : AppColors.instance.error200,
                      ),
                      child: Center(
                        child: Text(
                          entrytitle,
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 10,
                            color:
                                entrytitle.toLowerCase().contains(isAllow)
                                    ? AppColors.instance.teal400
                                    : AppColors.instance.error600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              _buildDetailRow(title: "Name", value: userName),
              _buildDetailRow(
                title: "Type",
                value: entryType.replaceAll("_", " "),
              ),
              _buildDetailRow(
                title: "Time of Entry",
                value: formatDateTime(entryTime),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 13,
                color: AppColors.instance.black600,
              ),
            ),
          ),

          Text(
            value,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 13,
              color: AppColors.instance.black600,
            ),
          ),
        ],
      ),
    );
  }
}
