import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentSuccessSheet extends StatelessWidget {
  final String message;
  final bool isError;
  const PaymentSuccessSheet({
    super.key,
    required this.message,
    required this.isError,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure bottom inset support (keyboard, safe area)

    return SafeArea(
      top: false,
      child: Material(
        // preserve material look inside modal
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animated icon
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color:
                    isError
                        ? AppColors.instance.error500
                        : AppColors.instance.teal500,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.instance.teal300.withOpacity(0.18),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Icon(
                isError ? Icons.error : Icons.check_rounded,
                size: 52,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 18),

            Text(
              "Payment initiated",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 18,
                fontWeight: FontFamilies.medium,
                color: AppColors.instance.black600,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black300,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  context.pop();
                  // play reverse if you want a closing animation, then call onDone
                  // _ctrl.reverse().then((_)(){});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.instance.black600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                 isError?"Re-try" : "Done",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.instance.grey200,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
