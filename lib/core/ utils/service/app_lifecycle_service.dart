// services/app_lifecycle_service.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppLifecycleService extends WidgetsBindingObserver {
  final WidgetRef ref;

  AppLifecycleService(this.ref) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print("App resumed — refreshing chat list");
      // ref.read(conversationListProvider.notifier).refreshConversations();
    }
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}