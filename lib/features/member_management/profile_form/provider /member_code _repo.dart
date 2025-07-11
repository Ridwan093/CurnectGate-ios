import 'dart:async';
import 'dart:developer';

import 'package:curnectgate/core/%20utils/api/api_Service.dart';
import 'package:curnectgate/core/%20utils/api/api_method.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/model/estate_code_validator_state.dart';
import 'package:curnectgate/features/member_management/screen/bottomSheet/validation_state.dart';
import 'package:curnectgate/features/member_management/widget/validator_widget.dart';
import 'package:curnectgate/features/userProfile/provider/validation_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final memberCodeRepositoryProvider = Provider(
  (ref) => AppApiMethod(ref.read(dioProvider)),
);
final memberCodeSubmissionProvider =
    AsyncNotifierProvider.autoDispose<MemberCodeSubmissionNotifier, void>(
      MemberCodeSubmissionNotifier.new,
    );

class MemberCodeSubmissionNotifier extends AutoDisposeAsyncNotifier<void> {
  Future<void> submitCode({
    required BuildContext context,
    required String estateCode,
    required String estateName,
    required String estateAddress,

    required String estateLogo,
  }) async {
    final formNotifier = ref.read(estateCodeFormProvider.notifier);
    final formState = ref.read(estateCodeFormProvider);
    final validationNotifier = ref.read(validationProvider.notifier);

    // Force validation check
    formNotifier.updateCode(formState.code, 6);
    final currentState = ref.read(estateCodeFormProvider);

    if (!currentState.isValid) return;

    state = const AsyncValue.loading();
    formNotifier.setLoading(true);

    try {
      // Show bottom sheet immediately
      if (context.mounted) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder:
              (context) => ValidationBottomSheet(
                memberCode: formState.code,

                estateLogo: estateLogo,
              ),
        );
      }

      // Perform validation
      await validationNotifier.validateMemberCode(
        formState.code,
        estateCode,
        estateName,
        context,
      );
      log(formState.code);
      final validationState = ref.read(validationProvider);
      if (validationState.status != ValidationStatus.success) {
        throw Exception(validationState.errorMessage);
      }

      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      if (context.mounted) {}
    } finally {
      formNotifier.setLoading(false);
      formNotifier.updateCode("", 0);
    }
  }

  @override
  FutureOr<void> build() {
    return null;
  }
}
