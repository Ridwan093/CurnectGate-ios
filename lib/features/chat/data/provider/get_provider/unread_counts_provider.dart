import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/features/chat/data/model/get_model/unread_counts_response.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final unreadCountsProvider =
    AsyncNotifierProvider.autoDispose<UnreadCountsNotifier, UnreadCountsData?>(
      UnreadCountsNotifier.new,
    );

class UnreadCountsNotifier extends AutoDisposeAsyncNotifier<UnreadCountsData?> {
  @override
  Future<UnreadCountsData?> build() async {
    // ✅ Load local first
    final local = await SharedPrefsService.getChatCount();

    try {
      final response = await ref.read(getApiServiceProvider).getUnreadCounts();

      if (response.success == true && response.data != null) {
        final fresh = response.data!;

        // ✅ Save only if changed
        if (local?.toJson().toString() != fresh.toJson().toString()) {
          await SharedPrefsService.saveChatCount(fresh);
        }

        return fresh;
      }

      return local; // fallback if API success false
    } catch (e) {
      log("❌ UnreadCounts error: $e");

      // ✅ fallback to cache
      if (local != null) {
        log("📦 Using cached unread counts");
        return local;
      }

      rethrow;
    }
  }

  // 🔄 Manual refresh (like your committee)
  Future<void> refreshCounts() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      try {
        final response =
            await ref.read(getApiServiceProvider).getUnreadCounts();

        if (response.success == true && response.data != null) {
          final fresh = response.data!;

          await SharedPrefsService.saveChatCount(fresh);

          return fresh;
        }

        // fallback
        final local = await SharedPrefsService.getChatCount();
        if (local != null) return local;

        throw Exception("No unread data available");
      } catch (e) {
        log("❌ Refresh failed: $e");

        final local = await SharedPrefsService.getChatCount();
        if (local != null) return local;

        rethrow;
      }
    });
  }
}
