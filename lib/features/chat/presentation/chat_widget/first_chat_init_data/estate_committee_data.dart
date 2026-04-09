import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/features/chat/data/chat_model/availableCommitte/committee_member.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/comittee_provider.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/first_chat_init_data/widget/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EstateCommitteeData extends ConsumerWidget {
  final String role;
  const EstateCommitteeData({super.key, required this.role});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final committdataAsync = ref.watch(getCommitteeProvider);
    return committdataAsync.when(
      data: (committee) {
        try {
          final user = committee?.data;
          return user != null
              ? _buildEstateAdminList(user.members)
              : EmptyBodys(message: "Estate committe not fund?");
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(getCommitteeProvider.notifier)
                    .refreshCommitte(context, ref),
            firstMessae: "Faile to load committee?",
          );
        }
      },
      loading: () {
        try {
          final cachedAdmin = ref.read(getCommitteeProvider).value;
          return cachedAdmin?.data != null
              ? _buildEstateAdminList(cachedAdmin?.data!.members)
              : Loadingstates();
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(getCommitteeProvider.notifier)
                    .refreshCommitte(context, ref),
            firstMessae: "Faile to load committee?",
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
          final cachedAdmin = ref.read(getCommitteeProvider).value;
          if (cachedAdmin?.data != null) {
            return _buildEstateAdminList(cachedAdmin?.data!.members);
          }

          // No cached data available
          return Builderroul(
            error: error.toString(),
            onTap:
                () => ref
                    .read(getCommitteeProvider.notifier)
                    .refreshCommitte(context, ref),
            firstMessae: "Faile to load committee?",
          );
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(getCommitteeProvider.notifier)
                    .refreshCommitte(context, ref),
            firstMessae: "Faile to load committee?",
          );
        }
      },
    );
  }

  Widget _buildEstateAdminList(List<CommitteeMember>? admins) {
    return Expanded(
      child: ListView.builder(
        itemCount: admins!.length,

        itemBuilder: (context, index) {
          final admin = admins[index];
          return UserCard(
            userName: admin.fullName ?? "",
            userRole:
                (admin.position ?? "").isNotEmpty
                    ? (admin.position ?? "N/A")
                    : (admin.committeeRole ?? "N/A"),

            estateName: admin.committeeName ?? "",
            url: admin.avatarUrl ?? "",
            isOnline: admin.onlineStatus,
            subtitle: admin.roleBadge ?? "",
            id: admin.id ?? 0,
            commitRole: admin.role,
          );
        },
      ),
    );
  }
}
