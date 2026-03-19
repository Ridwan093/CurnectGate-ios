import 'package:curnectgate/features/chat/data/provider/get_provider/get_chat_settings.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/chatSetting_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatSettingsData extends ConsumerWidget {
  final int id;

  const ChatSettingsData({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatSettings = ref.watch(getChatSettings(id));

    return chatSettings.when(
      data: (res) {
        try {
          final ress = res?.data;
          if (ress != null) {
            var setting = ress.settings;
            return ChatsettingContent(id: id, settings: setting);
          } else {
            return ChatsettingContent(id: id, settings: null);
          }
        } catch (e) {
          return ChatsettingContent(id: id, settings: null);
        }
      },
      loading: () {
        return ChatsettingContent(id: id, settings: null);
      },
      error: (error, stack) {
        try {
          // Handle session expiration
          if (error.toString().contains("Unauthorized")) {
            return ChatsettingContent(id: id, settings: null);
          }
          // Try to show cached data
          final cachedetting = ref.read(getChatSettings(id)).value;
          if (cachedetting?.data != null) {
            final data = cachedetting?.data;
            return ChatsettingContent(id: id, settings: data?.settings);
          }

          // No cached data available
          return ChatsettingContent(id: id, settings: null);
        } catch (e) {
          return ChatsettingContent(id: id, settings: null);
        }
      },
    );
  }
}
