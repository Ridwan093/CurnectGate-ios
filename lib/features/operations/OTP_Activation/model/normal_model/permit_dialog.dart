import 'package:curnectgate/features/operations/OTP_Activation/model/Work_permit/permit.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/workPermit/permitDetailsDialog.dart';
import 'package:flutter/material.dart';

Future<void> showPermitDetailsDialog({
  required BuildContext context,
  required Permit permit,
}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Permit Details",
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) => const SizedBox.shrink(),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      );

      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.15),
            end: Offset.zero,
          ).animate(curved),
          child: PermitDetailsDialog(permit: permit),
        ),
      );
    },
  );
}
