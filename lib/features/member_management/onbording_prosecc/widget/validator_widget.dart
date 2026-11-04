// validation_bottom_sheet.dart
import 'package:curnectgate/features/member_management/membership_ID/bottomSheet/validation_state.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/MemberLoding_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/error_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/success_bottom_sheet.dart';
import 'package:curnectgate/features/userProfile/provider/validation_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValidationBottomSheet extends ConsumerWidget {
  final String memberCode;

  final String estateLogo;

  const ValidationBottomSheet({
    super.key,
    required this.memberCode,

    required this.estateLogo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(validationProvider);

    switch (state.status) {
      case ValidationStatus.loading:
        return showValidationBottomSheet(context);

      case ValidationStatus.success:
        return buildSuccessContent(
          role: state.role ?? "",
          address: state.memberAddress ?? "",
          estateCode: state.estateCode ?? "",
          digitalID: state.digitalID ?? "",
          memberCode: memberCode,
          estateLogo: estateLogo,
          estateName: state.memerHouseName ?? "",
          

          firstName: state.firstName ?? "",
          lastName: state.lastName?? "",
          userEmail: state.userEmail ?? "",
          userPhone: state.userPhoneNumber ?? "",

          context: context,
        );
      case ValidationStatus.error:
        return buildErrorContent(
          state.errorMessage ?? 'Validation Failed',
          context,
        );
      default:
        return showValidationBottomSheet(context);
    }
  }
}
