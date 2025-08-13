// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/membership_ID/model/digital_member_id_response.dart';

import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final digitMemberIDprovider =
    AsyncNotifierProvider.autoDispose<GetDigitalID, DigitalMemberIdResponse?>(
      () {
        return GetDigitalID();
      },
    );

class GetDigitalID extends AutoDisposeAsyncNotifier<DigitalMemberIdResponse?> {
  @override
  Future<DigitalMemberIdResponse?> build() async {
    // First try to load from local storage
    final localDigitalID = await SharedPrefsService.getDigitalID();

    try {
      // Then try to fetch fresh data
      final token = await ref.watch(accessTokenProvider.future);

      if (token == null || token.isEmpty) {
        throw Exception("Unauthenticated");
      }

      final freshDigitalID = await ref
          .read(getApiServiceProvider)
          .getDigitalID(bearerToken: token);

      // Only update local storage if data is different
      if (localDigitalID?.toJson() != freshDigitalID.toJson()) {
        await SharedPrefsService.saveDigitalID(freshDigitalID);
      }

      return freshDigitalID;
    } catch (e) {
      // If error occurs, return local data if available
      log("${e}jhhjhhjdhjjdshjshdjshsjhdsjhdjshd");
      if (localDigitalID != null) {
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
        return localDigitalID;
      }
      rethrow;
    }
  }

  Future<void> refreshDigitalID(BuildContext context, WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final token = await ref.watch(accessTokenProvider.future);
        final freshDigitalID = await ref
            .read(getApiServiceProvider)
            .getDigitalID(bearerToken: token!);
        await SharedPrefsService.saveDigitalID(freshDigitalID);
        return freshDigitalID;
      } catch (e) {
        if (e.toString().contains(
          "Unauthenticated. Please login to continue.",
        )) {
          log(e.toString());
          ref.read(authProvider.notifier).seassionExpire(context, ref);
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

        final localDigitalID = await SharedPrefsService.getDigitalID();
        if (localDigitalID != null) return localDigitalID;
        rethrow;
      }
    });
  }
}
