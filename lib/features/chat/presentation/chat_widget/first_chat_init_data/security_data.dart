import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/features/chat/data/chat_model/availableSecurity/security.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/admin_provider.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/security_provider.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/first_chat_init_data/widget/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecurityData extends ConsumerWidget {
  final String role;
  const SecurityData({super.key, required this.role});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final securityAsync = ref.watch(getAvailableSecurity);
    return securityAsync.when(
      data: (admin) {
        try {
          final user = admin?.data;
          return user != null
              ? _buildEstateAdminList(user.securityPersonnel)
              : EmptyBodys(message: "SecurityPersonnel not fund?");
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(getAvailableSecurity.notifier)
                    .refreshSecurity(context, ref),
            firstMessae: "Faile to load securityPersonnel?",
          );
        }
      },
      loading: () {
        try {
          final cachedAdmin = ref.read(getAvailableSecurity).value;
          return cachedAdmin?.data != null
              ? _buildEstateAdminList(
                cachedAdmin?.data?.securityPersonnel ?? [],
              )
              : Loadingstates();
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(getAdminProvider.notifier)
                    .refreshAdmin(context, ref),
            firstMessae: "Faile to load securityPersonnel?",
          );
        }
      },
      error: (error, stack) {
        try {
          // Handle session expiration
          if (error.toString().contains("Unauthorized")) {
            return Expiresessionbody();
          }

          // Try to show cached data
          final cachedAdmin = ref.read(getAvailableSecurity).value;
          if (cachedAdmin?.data != null) {
            return _buildEstateAdminList(
              cachedAdmin?.data?.securityPersonnel ?? [],
            );
          }

          // No cached data available
          return Builderroul(
            error: error.toString(),
            onTap:
                () => ref
                    .read(getAvailableSecurity.notifier)
                    .refreshSecurity(context, ref),
            firstMessae: "Faile to load securityPersonnel?",
          );
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(getAvailableSecurity.notifier)
                    .refreshSecurity(context, ref),
            firstMessae: "Faile to load securityPersonnel?",
          );
        }
      },
    );
  }

  Widget _buildEstateAdminList(List<SecurityPersonnel>? admins) {
    return Expanded(
      child: ListView.builder(
        itemCount: admins!.length,

        itemBuilder: (context, index) {
          final admin = admins[index];
          return UserCard(
            userName: admin.fullName ?? "",
            userRole: (admin.role ?? ""),
            estateName: admin.post ?? admin.roleBadge ?? "",
            url: admin.avatarUrl ?? "",
            isOnline: admin.onlineStatus,
            subtitle: admin.roleBadge ?? "",
            id: admin.id ?? 0,
          );
        },
      ),
    );
  }
}
