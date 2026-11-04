// Provider for your API class
import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/chat/data/model/get_model/conversation_settings_response.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getChatSettings = AsyncNotifierProvider.autoDispose
    .family<ChatSettingsNotifier, ConversationSettingsResponse?, int>(
      () => ChatSettingsNotifier(),
    );

class ChatSettingsNotifier
    extends AutoDisposeFamilyAsyncNotifier<ConversationSettingsResponse?, int> {
  @override
  Future<ConversationSettingsResponse?> build(int id) async {
    final localChatSetting =
        await SharedPrefsService.getChatSettings(); // ✅ FIXED

    try {
      final freshChatSettings = await ref
          .read(getApiServiceProvider)
          .getChatSettings(id.toString());

      if (localChatSetting?.toJson() != freshChatSettings.toJson()) {
        await SharedPrefsService.saveChatSettings(freshChatSettings); // ✅ FIXED
      }

      return freshChatSettings;
    } catch (e) {
      if (localChatSetting != null) {
        log("$e → USING LOCAL CACHE");
        return localChatSetting;
      }
      rethrow;
    }
  }

  Future<void> refreshChatSetting(
    BuildContext context,
    WidgetRef ref,
    int id,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final freshAdmin = await ref
            .read(getApiServiceProvider)
            .getChatSettings(id.toString());
        await SharedPrefsService.saveChatSettings(freshAdmin);
        return freshAdmin;
      } catch (e) {
        if (e.toString().contains(
          "Unauthenticated. Please login to continue.",
        )) {
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

        final localAdmin = await SharedPrefsService.getChatSettings();
        if (localAdmin != null) return localAdmin;
        rethrow;
      }
    });
  }
}
