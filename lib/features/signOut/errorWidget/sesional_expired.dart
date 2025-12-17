// session_expiry_listener.dart

import 'dart:developer';

// import 'package:curnectgate/core/local_store/share_prefrence.dart'; // your shared prefs
// where sessionExpiredProvider is defined
import 'package:curnectgate/core/navigation/app_rout.dart';
import 'package:curnectgate/features/signOut/provider/authProvider.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // session_expiry_listener.dart

// session_expiry_listener.dart

class SessionExpiryListener extends ConsumerWidget {
  final Widget child;

  const SessionExpiryListener({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<bool>(sessionExpiredProvider, (previous, isExpired) {
      if (isExpired &&
          (previous == false || previous == null) &&
          context.mounted) {
        log("🟢 Session expired detected → showing dialog in next frame");

        // Small delay to ensure MaterialApp is fully ready
        Future.microtask(() async {
          final navContext = navigatorKey.currentContext;
          if (navContext == null || !navContext.mounted) return;

          ref.read(authProvider.notifier).sessionExpire(navContext, ref);
        });

        // ref.read(sessionExpiredProvider.notifier).reset();
      }
    });

    return child;
  }
}
