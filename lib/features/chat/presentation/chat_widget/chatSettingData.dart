import 'package:curnectgate/features/chat/data/provider/get_provider/get_chat_settings.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/chatSetting_content.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/chat_skeletor_widget.dart';
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
          if (ress?.settings != null) {
            var setting = ress?.settings;
            return ChatsettingContent(id: id, settings: setting!);
          } else {
            return Text("Empty");
          }
        } catch (e) {
          return Text(e.toString());
        }
      },
      loading: () {
        return ChatSettingsSkeleton();
      },
      error: (error, stack) {
        try {
          // Handle session expiration
          if (error.toString().contains("Unauthorized")) {
            return ChatSettingsSkeleton();
          }
          // Try to show cached data
          final cachedetting = ref.read(getChatSettings(id)).value;
          if (cachedetting?.data?.settings != null) {
            final data = cachedetting?.data?.settings;
            return ChatsettingContent(id: id, settings: data!);
          }

          // No cached data available
          return Text("");
        } catch (e) {
          return Text(e.toString());
        }
      },
    );
  }
}
