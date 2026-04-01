import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/features/chat/data/chat_model/availableAdmin/estate_admin.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/admin_provider.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/first_chat_init_data/widget/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EstateAdminData extends ConsumerWidget {
  final String role;
  const EstateAdminData({super.key, required this.role});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final admindataAsync = ref.watch(getAdminProvider);
    return admindataAsync.when(
      data: (admin) {
        try {
          final user = admin?.data;
          return user != null
              ? _buildEstateAdminList(user.admins)
              : EmptyBodys(message: "Estate admin not fund?");
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(getAdminProvider.notifier)
                    .refreshAdmin(context, ref),
            firstMessae: "Faile to load estate admin?",
          );
        }
      },
      loading: () {
        try {
          final cachedAdmin = ref.read(getAdminProvider).value;
          return cachedAdmin?.data != null
              ? _buildEstateAdminList(cachedAdmin?.data!.admins)
              : Loadingstates();
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(getAdminProvider.notifier)
                    .refreshAdmin(context, ref),
            firstMessae: "Faile to load estate admin?",
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
          final cachedAdmin = ref.read(getAdminProvider).value;
          if (cachedAdmin?.data != null) {
            return _buildEstateAdminList(cachedAdmin?.data!.admins);
          }

          // No cached data available
          return Builderroul(
            error: error.toString(),
            onTap:
                () => ref
                    .read(getAdminProvider.notifier)
                    .refreshAdmin(context, ref),
            firstMessae: "Faile to load estate admin?",
          );
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(getAdminProvider.notifier)
                    .refreshAdmin(context, ref),
            firstMessae: "Faile to load estate admin?",
          );
        }
      },
    );
  }

  Widget _buildEstateAdminList(List<EstateAdmin>? admins) {
    return Expanded(
      child: ListView.builder(
        itemCount: admins!.length,
        // separatorBuilder:
        //     (context, index) => Container(
        //       height: 1,
        //       margin: const EdgeInsets.symmetric(vertical: 12),
        //       color: AppColors.instance.grey200,
        //     ),
        itemBuilder: (context, index) {
          final admin = admins[index];
          return UserCard(
            userName: admin.fullName ?? "",
            userRole: (admin.role ?? ""),
            estateName: admin.fullName ?? "",
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
