import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/violation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Investigation extends ConsumerWidget {
  const Investigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        ParkingViolationCard(
          isInvestigation: true,
          imageUrl:
              "https://www.arrivealive.mobi/ckfinder/userfiles/images/Packing-The-Vehicle-Safely-For-The-Road-Trip/Packing%20vehicle%20for%20rollover.JPG",
          violationType: "Improper Parking by On-duty Security Staff",
          reportedBy: "Anonymous",

          resolutionType: "Anonymous",
          date: "July 8, 2025",
          onDismiss: () {
            // Handle dismiss action
            print("Violation dismissed");
          },
          onAccept: () {
            context.pop();
            // Handle accept action
            showUserBottomSheet(
              context: context,
              headertitle: "Improper Parking by On-duty Security Staff",
              headersubtitle: "Report By Anonymous",
              ref: ref,
              bottom: BottomSheetView.securityCommentMaker,
            );
          },
        ),
        ParkingViolationCard(
          isInvestigation: true,
          violationType: "Vehicle parked in a restricted area.",
          reportedBy: "Awareness",
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIZPWe7sclajIslxOjPULiJ33ZuxbUJOYdMDJHPxkK2577qFEfMoWPpbJ3hwCX7t4oV_s&usqp=CAU",
          resolutionType: "Anonymouse",
          date: "July 8, 2025",
          onDismiss: () {
            // Handle dismiss action
          },
          onAccept: () {
            context.pop();
            showUserBottomSheet(
              context: context,
              headertitle: "Violations",
              headersubtitle: "Track violation residents",
              ref: ref,
              bottom: BottomSheetView.securityCommentMaker,
            );
          },
        ),
      ],
    );
  }
}
