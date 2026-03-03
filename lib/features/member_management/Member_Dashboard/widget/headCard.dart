import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/models/slected_eletion_type_model.dart';
import 'package:curnectgate/features/estate_management/elections/provider/poll_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/votingSettingCheck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// desili1887@badfist.com
/// siyaf87150@badfist.com
/// narow43831@besenica.com
/// bajodo5925@besenica.com
/// jerel47960@besenica.com
class Headcard extends ConsumerWidget {
  Headcard({super.key});

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollAsync = ref.watch(pollProvider);
    final authState = ref.watch(authProvider);

    final user = authState.user;
    final fullname = authState.fullname ?? "";
    final memberID = user?["member_code"] ?? "";
    final estateName = user?['estate_name'] ?? "";

    // Extract first and last word logic
    String firstWord = "";
    // ignore: unused_local_variable
    String lastWord = "";

    if (estateName.trim().isNotEmpty) {
      final parts = estateName.trim().split(RegExp(r"\s+"));
      final containsEstate = parts.contains("Estate");

      if (containsEstate) {
        lastWord = "ESTATE";
        final filtered = parts.where((w) => w != "Estate").toList();
        firstWord = filtered.isNotEmpty ? "${filtered.first}." : "";
      } else {
        firstWord = parts.isNotEmpty ? "${parts.first}." : "";
        lastWord =
            parts.length > 1
                ? parts.last.toUpperCase()
                : parts.first.toUpperCase();
      }
    }

    // Detect screen size
    final size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.height < 700;

    return Column(
      children: [
        // Top teal section
        Material(
          color: AppColors.instance.teal400,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: Padding(
            padding: EdgeInsets.all(isSmallScreen ? 10 : 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        firstWord,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: isSmallScreen ? 22 : 26,
                          color: AppColors.instance.grey200,
                          fontWeight: FontFamilies.bold,
                        ),
                      ),
                      Text(
                        "ESTATE",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: isSmallScreen ? 13 : 15,
                          letterSpacing: isSmallScreen ? 6 : 8,
                          color: AppColors.instance.grey400,
                          fontWeight: FontFamilies.medium,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Image.asset(
                        AssetPaths.qrCode,
                        width: isSmallScreen ? 35 : 40,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        memberID,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: isSmallScreen ? 10 : 11,
                          color: AppColors.instance.grey200,
                          fontWeight: FontFamilies.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Bottom section
        Material(
          elevation: 4,
          color: AppColors.instance.teal200.withOpacity(0.9),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(12),
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
            decoration: BoxDecoration(
              color: AppColors.instance.teal400.withOpacity(0.8),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MEMBER",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: isSmallScreen ? 13 : 14,
                          color: AppColors.instance.grey400,
                          fontWeight: FontFamilies.medium,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        fullname,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: isSmallScreen ? 17 : 19,
                          color: AppColors.instance.grey200,
                          fontWeight: FontFamilies.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Voting icon
                Votingsettingcheck(
                  child: pollAsync.when(
                    data: (data) {
                      final polls = data?.data?.polls ?? [];
                      final activePolls =
                          polls
                              .where(
                                (p) => (p.status ?? "").toLowerCase().contains(
                                  'active',
                                ),
                              )
                              .toList();

                      if (activePolls.isEmpty) {
                        return const SizedBox.shrink();
                      }

                      return InkWell(
                        onTap: () {
                          final activePolls =
                              polls
                                  .where(
                                    (p) =>
                                        p.status?.toLowerCase().contains(
                                          'active',
                                        ) ==
                                        true,
                                  )
                                  .toList();

                          if (activePolls.isNotEmpty) {
                            showSelectElectionBottomSheet(
                              context: context,
                              ref: ref,
                              activePolls: activePolls,
                            );
                          }
                        },
                        child: Icon(
                          Icons.how_to_vote,
                          color: AppColors.instance.yellow500,
                          size: isSmallScreen ? 26 : 30,
                        ),
                      );
                    },
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
