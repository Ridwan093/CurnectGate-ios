import 'package:curnectgate/features/operations/OTP_Activation/model/Work_permit/clearance_permit_data.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/permitSearch_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/workPermit/permit_history_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildPermitlist extends ConsumerWidget {
  final ClearancePermitData? otp;
  const BuildPermitlist({super.key, required this.otp});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permits = ref.watch(filteredPermitProvider(otp!));

    if (permits.isEmpty) {
      return const Center(child: Text("No permits found"));
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: permits.length,
      itemBuilder: (BuildContext context, int index) {
        final generatedLists = permits[index];
        return WorkpermitCard(generatedLists);
      },
    );
  }
}
