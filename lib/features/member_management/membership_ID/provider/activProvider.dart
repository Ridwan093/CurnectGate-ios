// Create a selector provider that only rebuilds when the status changes
import 'package:curnectgate/features/member_management/membership_ID/provider/getDigitalIDProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isCardActiveProvider = Provider<bool>((ref) {
  return ref.watch(digitMemberIDprovider.select(
    (asyncValue) => asyncValue.maybeWhen(
      data: (digit) => digit?.data.digitalId?.status == "active",
      orElse: () => false,
    ),
  ));
});