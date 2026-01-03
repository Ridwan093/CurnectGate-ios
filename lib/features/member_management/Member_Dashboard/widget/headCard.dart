import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/estate_management/elections/provider/poll_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/votingSettingCheck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// desili1887@badfist.com
/// siyaf87150@badfist.com
/// narow43831@besenica.com
/// bajodo5925@besenica.com
/// jerel47960@besenica.com
class Headcard extends ConsumerWidget {
  Headcard({super.key});

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
                        lastWord,
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
                      if (data?.data != null && data!.data!.polls!.isNotEmpty) {
                        return InkWell(
                          onTap: () {
                            final pollId =
                                data.data!.polls!.first.id.toString();
                            ref.read(electionProvider.notifier).addId(pollId);
                            context.pushNamed(
                              AppRoutes.electionDasbord,
                              extra: {"id": pollId},
                            );
                          },
                          child: Icon(
                            Icons.how_to_vote,
                            color: AppColors.instance.yellow500,
                            size: isSmallScreen ? 26 : 30,
                          ),
                        );
                      }
                      return const SizedBox.shrink();
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
