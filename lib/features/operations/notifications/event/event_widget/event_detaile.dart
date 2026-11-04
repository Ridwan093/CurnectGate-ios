import 'dart:developer';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/show_event_dec_from_host.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/calendar_event_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/calendar_user_rsvp_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/share_event.dart';
import 'package:curnectgate/features/operations/notifications/provider/activity_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class EventDetaile extends ConsumerWidget {
  CalendarEvent data;
  EventDetaile({super.key, required this.data});
  // Check if user RSVP is "going"
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
    final notifier = ref.watch(reminderProvider);

    final formprvider = ref.read(formProvider.notifier);
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) {
          ref.read(isPopProvider.notifier).state = false; // Reset on pop
        }
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        ref.read(isPopProvider.notifier).state = false;
                        context.pop();
                      },
                      child: Text(
                        "Close",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.black600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),

                Image.asset(AssetPaths.eventblue, height: 50, width: 50),

                const SizedBox(height: 20),
                Text(
                  truncateWithEllipsis(data.title ?? "", maxLength: 30),
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                  ),
                ),
                const SizedBox(height: 8),
                _buildEventDetailTile(
                  icon: Icons.access_time,
                  child: const SizedBox(),
                  text: data.duration ?? "",
                  isRichText: false,
                ),
                const SizedBox(height: 16),
                _buildEventDetailTile(
                  icon: Icons.person_3_outlined,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontWeight: FontFamilies.medium,
                            color: AppColors.instance.black400,
                          ),
                          text: "Hosted by ",
                        ),
                        TextSpan(
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontWeight: FontFamilies.bold,
                            color: AppColors.instance.black600,
                          ),
                          text: data.createdBy,
                        ),
                      ],
                    ),
                  ),
                  text: '',
                  isRichText: true,
                ),
                const SizedBox(height: 16),
                _buildEventDetailTile(
                  icon: Icons.calendar_month,
                  child: const SizedBox(),
                  text:
                      "${DateFormat('hh:mm a').format(DateTime.parse(data.startDatetime ?? ""))}, "
                      "${DateFormat('MMM dd, yyyy').format(DateTime.parse(data.startDatetime ?? ""))}",
                  isRichText: false,
                ),
                const SizedBox(height: 16),
                _buildEventDetailTile(
                  icon: Icons.location_on_outlined,
                  child: const SizedBox(),
                  text: data.location ?? "",
                  isRichText: false,
                ),
                // const SizedBox(height: 10),
                // if (isUserNotGoing(data.userRsvp)) ...[
                //   Text(
                //     "You cancelled this event",
                //     style: TextStyle(
                //       fontFamily: FontFamilies.interDisplay,
                //       fontSize: 12,
                //       fontWeight: FontFamilies.bold,
                //       color: AppColors.instance.error600,
                //     ),
                //   ),
                // ] else ...[
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Going?",
                //       style: TextStyle(
                //         fontFamily: FontFamilies.interDisplay,
                //         color: AppColors.instance.black600,
                //         fontWeight: FontFamilies.medium,
                //       ),
                //     ),
                //     Row(
                //       children: [
                //         _buildEventConfirmButton(
                //           showActions: isUserGoing(data.userRsvp),
                //           onPressed: () {
                //             if (isUserGoing(data.userRsvp)) {
                //             } else {
                //               formprvider.rsvpEvent(
                //                 context: context,
                //                 goingNotGoin: "going",
                //                 reason: "no reason",
                //                 id: data.id.toString(),
                //                 ref: ref,
                //               );
                //             }
                //           },
                //           title: "Yes",
                //         ),
                //         _buildEventConfirmButton(
                //           showActions: false,

                //           onPressed: () {
                //             if (isUserGoing(data.userRsvp)) {
                //             } else {
                //               formprvider.rsvpEvent(
                //                 context: context,
                //                 goingNotGoin: "not_going",
                //                 reason: "no reason",
                //                 id: data.id.toString(),
                //                 ref: ref,
                //               );
                //             }
                //           },
                //           title: "No",
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
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
                        // YES Button – always enabled
                        _buildEventConfirmButton(
                          title: "Yes",
                          isSelected: isUserGoing(data.userRsvp),
                          onPressed: () {
                            if (!isUserGoing(data.userRsvp)) {
                              formprvider.rsvpEvent(
                                context: context,
                                goingNotGoin: "going",
                                reason: "no reason",
                                id: data.id.toString(),
                                ref: ref,
                              );
                            }
                          },
                        ),
                        const SizedBox(width: 12),
                        // NO Button – always enabled
                        _buildEventConfirmButton(
                          title: "No",
                          isSelected: isUserNotGoing(data.userRsvp),
                          onPressed: () {
                            if (!isUserNotGoing(data.userRsvp)) {
                              formprvider.rsvpEvent(
                                context: context,
                                goingNotGoin: "not_going",
                                reason: "no reason",
                                id: data.id.toString(),
                                ref: ref,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ShowEventDecFromHost(
                  descriptionFromHost: data.eventDescriptionFromHost ?? "",
                ),
                const SizedBox(height: 24),
                _buildDetailActions(
                  ref,
                  context,
                  isAddedToCalendar(data.userRsvp),
                  data,
                ),
              ],
            ),
          ),
          if (notifier.isLoading) Positioned.fill(child: _buildcontainer()),
        ],
      ),
    );
  }

  Widget _buildcontainer() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Center(child: Loadingstates()),
    );
  }

  /// somthing like ismuted or the state was not close was happend
  Widget _buildEventDetailTile({
    required IconData icon,
    required Widget child,
    required String text,
    required bool isRichText,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.instance.black300),
        const SizedBox(width: 8),
        isRichText
            ? child
            : Flexible(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.instance.black400,
                ),
              ),
            ),
      ],
    );
  }

  Widget _buildDetailActions(
    WidgetRef ref,
    BuildContext context,
    bool addedToCalendar,
    CalendarEvent data,
  ) {
    final form = ref.read(formProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            child: TextButton(
              onPressed:
                  () => shareEvent(
                    title: data.title ?? "",
                    description: data.description ?? "",
                    startDateTime: data.startDatetime ?? "",
                    endDateTime: data.endDatetime ?? "",
                    location: data.location ?? "",
                    venue: data.venue ?? "",
                  ),
              child: Text(
                "Share event",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  color: AppColors.instance.black600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 2,
            child: _buildAddToCalendarButton(
              () {
                log(addedToCalendar.toString());
                if (isUserGoing(data.userRsvp)) {
                  if (addedToCalendar == false) {
                    form.addToCCalender(
                      context: context,

                      id: data.id.toString(),
                      ref: ref,
                    );
                  }
                } else {
                  showCustomSuccessToast(
                    context: context,
                    message:
                        "Please RSVP 'Yes' or 'No' before adding to your calendar.",
                    color: AppColors.instance.grey200, // Fallback to grey200
                    icon: Icons.warning,
                    iconColors: AppColors.instance.black600,
                    positionNumber: 70,

                    duration: Duration(seconds: 4), // If supported
                  );
                }
              },

              context,
              addedToCalendar,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventConfirmButton({
    required String title,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppColors.instance.teal300
                  : AppColors.instance.grey400,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.instance.teal500 : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color:
                    isSelected
                        ? AppColors.instance.black600
                        : AppColors.instance.black600,
                fontSize: 14,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Icon(
                Icons.check_circle,
                size: 18,
                color: AppColors.instance.black600,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAddToCalendarButton(
    VoidCallback onPressed,
    BuildContext context,

    bool canAddTocallender,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: MediaQuery.sizeOf(context).width / 2,
        decoration: BoxDecoration(
          color:
              !canAddTocallender
                  ? AppColors.instance.black600
                  : AppColors.instance.black100,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              !canAddTocallender ? Icons.add : Icons.done,
              color:
                  !canAddTocallender
                      ? AppColors.instance.grey200
                      : AppColors.instance.black600,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                'Add to Calendar',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.medium,
                  color:
                      !canAddTocallender
                          ? AppColors.instance.grey200
                          : AppColors.instance.black600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
