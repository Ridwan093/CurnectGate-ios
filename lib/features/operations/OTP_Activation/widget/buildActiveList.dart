import 'package:curnectgate/features/operations/OTP_Activation/model/otp_data.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/ActivitOtp_card.dart';
import 'package:flutter/widgets.dart';

class Buildactivelist extends StatelessWidget {
  final OtpData? otp;
  const Buildactivelist({super.key, required this.otp});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: otp?.otps.length,
      itemBuilder: (BuildContext context, int index) {
        final generatedLists = otp?.otps[index];
        return ActivitOtpCard(generated: generatedLists!);
      },
    );
  }
}
