import 'package:curnectgate/features/operations/OTP_Activation/model/permit_model/active_otp_data.dart'
    show ActiveOtpData;
import 'package:curnectgate/features/operations/OTP_Activation/widget/workPermit/workPermit_card.dart';
import 'package:flutter/widgets.dart';

class BuildPermitlist extends StatelessWidget {
  final ActiveOtpData? otp;
  const BuildPermitlist({super.key, required this.otp});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: otp?.otps?.length,
      itemBuilder: (BuildContext context, int index) {
        final generatedLists = otp?.otps![index];
        return WorkpermitCard(generatedLists!);
      },
    );
  }
}
