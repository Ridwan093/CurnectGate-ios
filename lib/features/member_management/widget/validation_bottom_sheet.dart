// validation_bottom_sheet.dart
import 'package:curnectgate/features/member_management/screen/bottomSheet/validation_notifier.dart';
import 'package:curnectgate/features/member_management/screen/bottomSheet/validation_state.dart';
import 'package:curnectgate/features/member_management/widget/bottomsheet.dart';
import 'package:curnectgate/features/member_management/widget/error_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/widget/success_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValidationBottomSheet extends ConsumerWidget {
  final String memberCode;

  const ValidationBottomSheet({super.key, required this.memberCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(validationProvider);
    final notifier = ref.read(validationProvider.notifier);

    // Start validation when sheet opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.status == ValidationStatus.initial) {
        notifier.validateMemberCode(memberCode);
      }
    });

    return _buildContent(state, notifier, context);
  }

  Widget _buildContent(
    ValidationState state,
    ValidationNotifier notifier,
    BuildContext context,
  ) {
    switch (state.status) {
      case ValidationStatus.initial:
      case ValidationStatus.loading:
        return showValidationBottomSheet(context);
      case ValidationStatus.success:
        return buildSuccessContent(state.memberAddress!, context);
      case ValidationStatus.error:
        return buildErrorContent(state.errorMessage!, notifier, context);
    }
  }
}
