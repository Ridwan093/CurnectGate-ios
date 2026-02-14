import 'dart:developer';

import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll/poll_item_summary.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll/polls_data.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VoteProgressCard extends ConsumerStatefulWidget {
  final PollsData? data;
  final bool canRoute;

  const VoteProgressCard({
    super.key,
    required this.data,
    required this.canRoute,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VoteProgressCardState();
}

String getTimeLeft(String closesAt) {
  final closeDate = DateTime.parse(closesAt).toLocal();
  final now = DateTime.now();

  final diff = closeDate.difference(now);

  if (diff.inDays >= 1) {
    return "${diff.inDays} days left";
  } else if (diff.inHours >= 1) {
    return "${diff.inHours} hours left";
  } else if (diff.inMinutes >= 1) {
    return "${diff.inMinutes} minutes left";
  } else {
    return "Closing soon";
  }
}

class _VoteProgressCardState extends ConsumerState<VoteProgressCard> {
  @override
  Widget build(BuildContext context) {
    final pollId = ref.watch(electionProvider).id;
    final data = widget.data?.polls ?? [];
    final filteredPolls =
        (!widget.canRoute && pollId.isNotEmpty)
            ? data.where((p) => p.id.toString() == pollId).toList()
            : data;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          filteredPolls.map((e) {
            final statues = e.status ?? "";
            if (statues.contains("closed")||statues.contains("scheduled") ) {
              return SizedBox();
            } else {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _buildItemContent(e, widget.canRoute),
              );
            }
          }).toList(),
    );
  }

  Widget _buildItemContent(PollItemSummary data, bool isRount) {
    final timeLeft = getTimeLeft(data.closesAt ?? "");

    return InkWell(
      onTap: () {
        ref.read(formProvider.notifier).updateGenrateMemberIdLoading(false);
        if (isRount) {
          // rout

          ref.read(electionProvider.notifier).addId(data.id.toString());
          context.pushNamed(
            AppRoutes.electionDasbord,
            extra: {"id": data.id.toString()},
          );
        } else {
          log("Nooo can Route Again ");
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.instance.teal100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blueGrey.shade100),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    data.title ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,
                    ),
                  ),
                ),
                _statusBadge(data.status ?? ""),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              data.description ?? "",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
              ),
            ),
            const SizedBox(height: 12),
            IntrinsicWidth(
              // Only as wide as content
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.access_time, size: 18),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(timeLeft, overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.people, size: 18),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      '${data.statistics?.totalVoted ?? 0} / ${data.statistics?.totalVoters ?? 0} voted',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: (data.statistics?.turnoutPercentage ?? 0) / 100,
                minHeight: 12,
                color: AppColors.instance.yellow500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${(data.statistics?.turnoutPercentage ?? 0).round()}% turnout',
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.instance.teal400,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: _statusColor(text),
          fontWeight: FontFamilies.medium,
          fontFamily: FontFamilies.interDisplay,

          fontSize: 12,
        ),
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case "active":
        return AppColors.instance.teal500;

      case "closed":
        return AppColors.instance.error500;
      default:
        return AppColors.instance.grey300;
    }
  }
}
