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
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.instance.black400.withOpacity(0.04),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(color: AppColors.instance.grey300.withOpacity(0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.instance.teal100.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.how_to_vote_outlined,
                    color: AppColors.instance.teal400,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.black600,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        data.description ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 13,
                          color: AppColors.instance.black400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _statusBadge(data.status ?? ""),
              ],
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.instance.grey200.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.timer_outlined, size: 16, color: Colors.orange),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      timeLeft,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange.shade700,
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 16,
                    color: AppColors.instance.grey400.withOpacity(0.3),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  Icon(Icons.people_outline, size: 16, color: AppColors.instance.black400),
                  const SizedBox(width: 6),
                  Text(
                    '${data.statistics?.totalVoted ?? 0} / ${data.statistics?.totalVoters ?? 0}',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.instance.black500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Turnout',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 12,
                    color: AppColors.instance.black400,
                  ),
                ),
                Text(
                  '${(data.statistics?.turnoutPercentage ?? 0).round()}%',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.instance.teal500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: (data.statistics?.turnoutPercentage ?? 0) / 100,
                minHeight: 8,
                backgroundColor: AppColors.instance.grey300.withOpacity(0.6),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.instance.teal400),
              ),
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
