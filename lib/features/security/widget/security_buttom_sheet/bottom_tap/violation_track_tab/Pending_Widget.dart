import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/violation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PendingWidget extends ConsumerWidget {
  const PendingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        ParkingViolationCard(
          imageUrl:
              "https://www.arrivealive.mobi/ckfinder/userfiles/images/Packing-The-Vehicle-Safely-For-The-Road-Trip/Packing%20vehicle%20for%20rollover.JPG",
          violationType: "Improper Parking by On-duty Security Staff",
          reportedBy: "Anonymous",

          resolutionType: "Awareness",
          date: "July 8, 2025",
          onDismiss: () {
            // Handle dismiss action
            showUserBottomSheet(
              context: context,
              headertitle: "Dismiss this violation?",
              headersubtitle:
                  "Select reason for dismissing this violation report",
              ref: ref,
              bottom: BottomSheetView.securitydismissViolation,
            );
          },
          onAccept: () {
            // Handle accept action
            print("Violation accepted");
          },
        ),
        ParkingViolationCard(
          violationType: "Vehicle parked in a restricted area.",
          reportedBy: "Awareness",
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIZPWe7sclajIslxOjPULiJ33ZuxbUJOYdMDJHPxkK2577qFEfMoWPpbJ3hwCX7t4oV_s&usqp=CAU",
          resolutionType: "Anonymouse",
          date: "July 8, 2025",
          onDismiss: () {
            // Handle dismiss action

            showUserBottomSheet(
              context: context,
              headertitle: "Dismiss this violation?",
              headersubtitle:
                  "Select reason for dismissing this violation report",
              ref: ref,
              bottom: BottomSheetView.securitydismissViolation,
            );
          },
          onAccept: () {
            // Handle accept action
          },
        ),
      ],
    );
  }
}
