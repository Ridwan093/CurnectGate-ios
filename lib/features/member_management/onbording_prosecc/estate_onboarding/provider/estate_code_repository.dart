import 'dart:async';
import 'dart:developer';

import 'package:curnectgate/core/%20utils/api/api_Service.dart';
import 'package:curnectgate/core/%20utils/api/api_method.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/model/error.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/model/estate_code_validator_state.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
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
        formNotifier.clearApiError(); // ✅ correct

        if (context.mounted) {
          showCustomSuccessToast(
            context: context,
            message: response["message"],
            color: AppColors.instance.teal300,
            icon: Icons.check_circle,
            iconColors: AppColors.instance.grey200,
            positionNumber: 70,
          );

          context.pushNamed(
            AppRoutes.confirmInfomation,
            extra: response['data'],
          );
        }

        state = const AsyncValue.data(null);
      } else {
        log(response['message'].toString());
        formNotifier.setApiError(response['message'] ?? 'Invalid code');
        state = AsyncValue.error(response['message'], StackTrace.current);
      }
    } on DioException catch (e) {
      final errorMessage = mapDioErrorToMessage(e);
      formNotifier.setApiError(errorMessage);

      formNotifier.setApiError(errorMessage);
      state = AsyncValue.error(e, StackTrace.current);
    } catch (e, st) {
      formNotifier.setApiError('An unexpected error occurred');
      state = AsyncValue.error(e, st);
    } finally {
      formNotifier.setLoading(false);
    }
  }
}
