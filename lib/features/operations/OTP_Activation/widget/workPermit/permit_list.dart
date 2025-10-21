import 'package:curnectgate/features/operations/OTP_Activation/model/Work_permit/clearance_permit_data.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/workPermit/workPermit_card.dart';
import 'package:flutter/widgets.dart';

class BuildPermitlist extends StatelessWidget {
  final ClearancePermitData? otp;
  const BuildPermitlist({super.key, required this.otp});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: otp?.permits?.length,
      itemBuilder: (BuildContext context, int index) {
        final generatedLists = otp?.permits![index];
        return WorkpermitCard(generatedLists!);
      },
    );
  }
}
