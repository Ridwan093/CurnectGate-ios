import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/core/%20utils/api/api_Service.dart';
import 'package:curnectgate/core/%20utils/api/api_method.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/model/estate_code_validator_state.dart';
import 'package:curnectgate/features/member_management/widget/customtoast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final estateCodeRepositoryProvider = Provider(
  (ref) => AppApiMethod(ref.read(dioProvider)),
);

final estateCodeSubmissionProvider =
    AsyncNotifierProvider.autoDispose<EstateCodeSubmissionNotifier, void>(
      EstateCodeSubmissionNotifier.new,
    );

class EstateCodeSubmissionNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> submitCode(BuildContext context) async {
    final formNotifier = ref.read(estateCodeFormProvider.notifier);
    final formState = ref.read(estateCodeFormProvider);
    if (formState.code.isEmpty) return;
    // Force validation check
    formNotifier.updateCode(formState.code, 10);
    final currentState = ref.read(estateCodeFormProvider);

    if (!currentState.isValid) return;

    state = const AsyncValue.loading();
    formNotifier.setLoading(true);

    try {
      final response = await ref
          .read(estateCodeRepositoryProvider)
          .submitEstateCode(formState.code);

      if (response['status'] == true) {
        formNotifier.clearApiError();
        formNotifier.setApiError('');

        if (context.mounted) {
          formNotifier.setApiError('');
          context.pushNamed(
            AppRoutes.confirmInfomation,
            extra: response['data'],
          );
          formNotifier.setLoading(false);
          state = const AsyncValue.data(null);
        }
        formNotifier.setLoading(false);
        state = const AsyncValue.data(null);
      } else {
        formNotifier.setApiError('Check your code and retry');
        state = AsyncValue.error(
          response['message'] ?? 'Invalid code',
          StackTrace.current,
        );
      }
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data?['message'] ?? 'Failed to validate estate code';
      if (e.error is SocketException) {
        formNotifier.setLoading(false);
        showCustomSuccessToast(
          context: context,
          message:
              "Network unavailable. Please check your internet connection.",
          color: AppColors.instance.error500,
          icon: Icons.close,
          iconColors: AppColors.instance.grey200,
          positionNumber: 70,
        );
        state = AsyncValue.error(e, StackTrace.current);
      }
      formNotifier.setLoading(false);
      formNotifier.setApiError(errorMessage);

      log(e.toString());
      state = AsyncValue.error(e, StackTrace.current);
    } catch (e, st) {
      formNotifier.setApiError('An unexpected error occurred');
      formNotifier.setLoading(false);
      state = AsyncValue.error(e, st);
    } finally {
      formNotifier.setLoading(false);
      formNotifier.updateCode("", 0);
      state = const AsyncValue.data(null);
      state = AsyncValue.error('', StackTrace.current);
    }
  }
}
