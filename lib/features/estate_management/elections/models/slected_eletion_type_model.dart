import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll/poll_item_summary.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Reusable bottom sheet to select an active election
void showSelectElectionBottomSheet({
  required BuildContext context,
  required WidgetRef ref,
  required List<PollItemSummary>
  activePolls, // Pass your active polls list here
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          top: 16,
          left: 10,
          right: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Select Election",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 18,
                      fontWeight: FontFamilies.bold,
                      color: AppColors.instance.black600,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: AppColors.instance.black600),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // List of active polls
            if (activePolls.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    "No active elections",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: activePolls.length,
                itemBuilder: (context, index) {
                  final poll = activePolls[index];

                  return Card(
                    elevation: 0,
                    color: AppColors.instance.grey200,
                    // margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      minLeadingWidth: 0,
                      title: Text(
                        poll.title ?? "Untitled Election",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontWeight: FontWeight.w600,
                          color: AppColors.instance.black600,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        "${poll.description ?? 'No description'} • ${getTimeLeft(poll.closesAt ?? '')}",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.black400,
                          fontSize: 12,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.instance.black400,
                      ),
                      onTap: () {
                        final pollId = poll.id.toString();

                        // Save to Riverpod
                        ref.read(electionProvider.notifier).addId(pollId);

                        // Navigate
                        context.pushNamed(
                          AppRoutes.electionDasbord,
                          extra: {"id": pollId},
                        );

                        // Close bottom sheet
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              ),

            const SizedBox(height: 16),
          ],
        ),
      );
    },
  );
}

// Keep your getTimeLeft function here or import it
String getTimeLeft(String closesAt) {
  final closeDate = DateTime.parse(closesAt).toLocal();
  final now = DateTime.now();
  final diff = closeDate.difference(now);

  if (diff.isNegative) return "Closed";
  if (diff.inDays >= 1)
    return "${diff.inDays} day${diff.inDays > 1 ? 's' : ''} left";
  if (diff.inHours >= 1)
    return "${diff.inHours} hour${diff.inHours > 1 ? 's' : ''} left";
  if (diff.inMinutes >= 1) return "${diff.inMinutes} min left";
  return "Closing soon";
}
