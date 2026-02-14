import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/resv_model/rsvp_event_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class RsvpDataEventCard extends ConsumerWidget {
  final RsvpEventHistory event;

  final Function(bool)? onGoing;
  final VoidCallback? onTap;

  const RsvpDataEventCard({
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
    return (userRsvp as String?)?.trim().toLowerCase() == 'going';
  }

  bool isUserNotGoing(dynamic userRsvp) {
    return (userRsvp as String?)?.trim().toLowerCase() == 'not_going';
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
                      truncateText(event.event?.title ?? "", 30),

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
                          formatDateFromString(
                            event.event?.startDatetime ?? "",
                          ) ??
                          "",
                    ),
                    const SizedBox(height: 10),
                    _buildEventcontent(
                      icon: Icons.location_on_outlined,
                      title: truncateText(event.event?.description ?? "", 30),
                    ),

                    const SizedBox(height: 8),
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
                              isSelected: isUserGoing(event.response),
                              onPressed: () {
                                if (!isUserGoing(event.response)) {
                                  formprvider.rsvpEvent(
                                    context: context,
                                    goingNotGoin: "going",
                                    reason: "no reason",
                                    id: (event.event?.id ?? 0).toString(),
                                    ref: ref,
                                  );
                                }
                              },
                            ),
                            const SizedBox(width: 12),
                            // NO Button – always enabled
                            _buildEventConfirmButton(
                              title: "No",
                              isSelected: isUserNotGoing(event.response),
                              onPressed: () {
                                if (!isUserNotGoing(event.response)) {
                                  formprvider.rsvpEvent(
                                    context: context,
                                    goingNotGoin: "not_going",
                                    reason: "no reason",
                                    id: (event.event?.id ?? 0).toString(),
                                    ref: ref,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
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
        Flexible(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              fontWeight: FontFamilies.medium,
              color: AppColors.instance.black300,
            ),
          ),
        ),
      ],
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
        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 35,
        width: isSelected ? 70 : 50,
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
          mainAxisAlignment: MainAxisAlignment.center,
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
              Flexible(
                child: Icon(
                  Icons.check_circle,
                  size: 18,
                  color: AppColors.instance.black600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // Widget _buildEventConfirmButton({
  //   required bool showActions,
  //   required String title,
  //   required VoidCallback onPressed,
  // }) {
  //   return InkWell(
  //     onTap: onPressed,
  //     child: Container(
  //       margin: EdgeInsets.all(5),
  //       height: 35,
  //       width: showActions ? 70 : 50,
  //       decoration: BoxDecoration(
  //         color:
  //             showActions
  //                 ? AppColors.instance.teal300
  //                 : AppColors.instance.grey400,
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       child: Center(
  //         child:
  //             showActions
  //                 ? Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       title,
  //                       style: TextStyle(
  //                         fontFamily: FontFamilies.interDisplay,
  //                         fontWeight: FontFamilies.bold,
  //                         color: AppColors.instance.black600,
  //                       ),
  //                     ),
  //                     SizedBox(width: 5),
  //                     Icon(
  //                       Icons.done,
  //                       size: 12,
  //                       color: AppColors.instance.black600,
  //                     ),
  //                   ],
  //                 )
  //                 : Text(
  //                   title,
  //                   style: TextStyle(
  //                     fontFamily: FontFamilies.interDisplay,
  //                     fontWeight: FontFamilies.bold,
  //                     color: AppColors.instance.black600,
  //                   ),
  //                 ),
  //       ),
  //     ),
  //   );
  // }
}
