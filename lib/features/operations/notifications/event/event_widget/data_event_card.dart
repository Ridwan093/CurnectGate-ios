import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/calendar_event_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/calendar_user_rsvp_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DataEventCard extends ConsumerWidget {
  final CalendarEvent event;

  final Function(bool)? onGoing;
  final VoidCallback? onTap;

  const DataEventCard({
    super.key,
    required this.event,

    this.onGoing,
    this.onTap,
  });

  String? formatDateFromString(String? dateTimeString) {
    if (dateTimeString == null) return null;
    final dateTime = DateTime.tryParse(dateTimeString);
    if (dateTime == null) return null;
    return DateFormat('MMM d, yyyy').format(dateTime);
  }

  String truncateText(String? text, int maxLength) {
    if (text == null || text.isEmpty) return '';
    return text.length <= maxLength
        ? text
        : '${text.substring(0, maxLength - 3)}...';
  }

  bool isUserGoing(dynamic userRsvp) {
    if (userRsvp == null) return false;

    // If userRsvp is a map (from JSON)
    if (userRsvp is Map<String, dynamic>) {
      final response = userRsvp['response']?.toString().toLowerCase();
      return response != null && response == 'going';
    }

    // If userRsvp is a CalendarUserRsvp object
    if (userRsvp is CalendarUserRsvp) {
      return userRsvp.response != null &&
          userRsvp.response!.toLowerCase() == 'going';
    }

    return false;
  }

  // Check if user RSVP is "not_going"
  bool isUserNotGoing(dynamic userRsvp) {
    if (userRsvp == null) return false;

    if (userRsvp is Map<String, dynamic>) {
      final response = userRsvp['response']?.toString().toLowerCase();
      return response != null && response == 'not_going';
    }

    if (userRsvp is CalendarUserRsvp) {
      return userRsvp.response != null &&
          userRsvp.response!.toLowerCase() == 'not_going';
    }

    return false;
  }

  bool isAddedToCalendar(dynamic userRsvp) {
    // If userRsvp is null, return false
    if (userRsvp == null) return false;

    // If userRsvp is a map (from JSON)
    if (userRsvp is Map<String, dynamic>) {
      return userRsvp['added_to_calendar'] == true;
    }

    // If userRsvp is a CalendarUserRsvp object
    if (userRsvp is CalendarUserRsvp) {
      return userRsvp.addedToCalendar == true;
    }

    return false;
  }

  String truncateWithEllipsis(String text, {int maxLength = 50}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength).trim()}...';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formprvider = ref.read(formProvider.notifier);
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
                      truncateText(event.title ?? "", 30),

                      style: TextStyle(
                        fontWeight: FontFamilies.bold,
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildEventcontent(
                      icon: Icons.access_time,
                      title:
                          formatDateFromString(event.startDatetime ?? "") ?? "",
                    ),
                    const SizedBox(height: 10),
                    _buildEventcontent(
                      icon: Icons.location_on_outlined,
                      title: truncateText(event.description ?? "", 30),
                    ),

                    const SizedBox(height: 8),
                    if (isUserNotGoing(event.userRsvp)) ...[
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
                              _buildEventConfirmButton(
                                showActions: isUserGoing(event.userRsvp),
                                onPressed: () {
                                  if (isUserGoing(event.userRsvp)) {
                                  } else {
                                    formprvider.rsvpEvent(
                                      context: context,
                                      goingNotGoin: "going",
                                      reason: "no reason",
                                      id: event.id.toString(),
                                      ref: ref,
                                    );
                                  }
                                },
                                title: "Yes",
                              ),
                              _buildEventConfirmButton(
                                showActions: false,

                                onPressed: () {
                                  if (isUserGoing(event.userRsvp)) {
                                  } else {
                                    formprvider.rsvpEvent(
                                      context: context,
                                      goingNotGoin: "not_going",
                                      reason: "no reason",
                                      id: event.id.toString(),
                                      ref: ref,
                                    );
                                  }
                                },
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

  Widget _buildEventConfirmButton({
    required bool showActions,
    required String title,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(5),
        height: 35,
        width: showActions ? 70 : 50,
        decoration: BoxDecoration(
          color:
              showActions
                  ? AppColors.instance.teal300
                  : AppColors.instance.grey400,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child:
              showActions
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
}
