import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/workPermit/permit_History_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ✅ Check-in OTP Tab
class CheckInOtpTab extends ConsumerStatefulWidget {
  const CheckInOtpTab({super.key});

  @override
  ConsumerState<CheckInOtpTab> createState() => _CheckInOtpTabState();
}

class _CheckInOtpTabState extends ConsumerState<CheckInOtpTab> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return _buildBody(size, ref, context);
  }

  Widget _buildBody(Size size, WidgetRef ref, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Align(
        //   alignment: Alignment.topRight,
        //   child: InkWell(
        //     onTap: () {
        //       context.pop();
        //     },
        //     child: Text(
        //       "Close",
        //       style: TextStyle(
        //         fontFamily: FontFamilies.interDisplay,
        //         fontSize: 14,
        //         color: AppColors.instance.teal400,
        //       ),
        //     ),
        //   ),
        // ),
        // SizedBox(height: 40),
        Text(
          "Permit History",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 18,
            color: AppColors.instance.black600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "View all visitor OTPs that include permit access.",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 13,
            color: AppColors.instance.black300,
          ),
        ),

        Expanded(child: _buildContent(size, context, ref)),
      ],
    );
  }

  Widget _buildContent(Size size, BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),

        const SizedBox(height: 23),

        Expanded(child: PermitData()),
      ],
    );
  }
}
