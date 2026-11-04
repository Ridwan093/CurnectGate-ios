import 'package:curnectgate/core/local_store/getUserprofile_file_provider.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/chat/services/reverb_service.dart';
import 'package:curnectgate/features/member_management/tabState/tab_state.dart';
import 'package:curnectgate/features/signOut/provider/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/signOut/provider/logOut_provider.dart';

class Expiresessionbody extends ConsumerWidget {
  const Expiresessionbody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Your session has expired"),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final state = ref.read(authProvider);
              ReverbService.disconnect();
              await state.clearAuthData();

              await ref.read(profilePicProvider.notifier).clearAllProfilePics();
              ref.read(tabStateProvider.notifier).resetToMainTab();
              // 3. Navigate to login screen
              if (context.mounted) {
                context.goNamed(AppRoutes.signIN);
              }

              ref.read(sessionExpiredProvider.notifier).reset();
            },
            /* your login logic */
            child: Text(
              "Login Again",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
