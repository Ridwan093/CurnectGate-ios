// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/property_model/property_response.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final propertyIdProvider =
    AsyncNotifierProvider.autoDispose<PropertyIDNotifier, PropertyResponse?>(
      () {
        return PropertyIDNotifier();
      },
    );

class PropertyIDNotifier extends AutoDisposeAsyncNotifier<PropertyResponse?> {
  @override
  Future<PropertyResponse?> build() async {
    // First try to load from local storage
    final localproperty = await SharedPrefsService.getProperty();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshproperty = await ref
          .read(getApiServiceProvider)
          .getProperty(bearerToken: token);

      // Only update local storage if data is different
      if (localproperty?.toJson() != freshproperty.toJson()) {
        await SharedPrefsService.saveProperty(freshproperty);
      }

      return freshproperty;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
      if (localproperty != null) {
        log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
        // Show error toast but still return local data
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text('Using cached data: ${e.toString()}'),
        //       duration: const Duration(seconds: 2),
        //     ),
        //   );
        // });
        return localproperty;
      }
      rethrow;
    }
  }

  Future<void> refreshProperty(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final freshproperty = await ref
            .read(getApiServiceProvider)
            .getProperty(bearerToken: token!);
        await SharedPrefsService.saveProperty(freshproperty);
        return freshproperty;
      } catch (e) {
        if (e is DioException && e.response?.statusCode == 401) {
          log(e.toString());
          ref.read(authProvider.notifier).sessionExpire(context, ref);
        } else if (e.toString().contains("The connection errored")) {
          log(e.toString());
          showCustomSuccessToast(
            context: context,
            message: 'Connection failed. Please check your network',
            color: AppColors.instance.error500,
            icon: Icons.error,
            iconColors: AppColors.instance.grey300,
            positionNumber: 72,
          );
        }

        final localproperty = await SharedPrefsService.getProperty();
        if (localproperty != null) return localproperty;
        rethrow;
      }
    });
  }
}
