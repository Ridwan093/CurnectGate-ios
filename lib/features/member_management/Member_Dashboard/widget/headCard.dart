import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/estate_management/elections/provider/poll_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/votingSettingCheck.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
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
  String firstWord = "";
  String lastWord = "";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollAsync = ref.watch(pollProvider);
    final authState = ref.watch(authProvider);

    final user = authState.user;
    final fullname = authState.fullname;
    final memberID = user?["member_code"] ?? "";
    final estateName = user?['estate_name'] ?? "";

    String firstWord = "";
    String lastWord = "";

    if (estateName.trim().isNotEmpty) {
      final parts = estateName.trim().split(RegExp(r"\s+"));

      final containsEstate = parts.contains("Estate");

      if (containsEstate) {
        lastWord = "Estate";

        final filtered = parts.where((w) => w != "Estate").toList();

        firstWord = filtered.isNotEmpty ? filtered.first : "";
      } else {
        firstWord = parts.first;
        lastWord = parts.length > 1 ? parts.last : parts.first;
      }
    }

    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Material(
          color: AppColors.instance.teal400,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(12),
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.instance.teal400,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$firstWord.",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 25,
                        color: AppColors.instance.grey200,
                        fontWeight: FontFamilies.bold,
                      ),
                    ),
                    Text(
                      lastWord.toUpperCase(),
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 14,
                        wordSpacing: 10,
                        letterSpacing: 10,
                        color: AppColors.instance.grey400,
                        fontWeight: FontFamilies.medium,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(AssetPaths.qrCode, width: 40, height: 40),
                    SizedBox(height: 10),
                    _memberID(memberID),
                  ],
                ),
              ],
            ),
          ),
        ),
        Material(
          elevation: 3,
          color: AppColors.instance.teal200.withOpacity(.9),
          // ignore: deprecated_member_use
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(12),
            height: 100,
            width: size.width,
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: AppColors.instance.teal400.withOpacity(.8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "MEMBER",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 14,

                          color: AppColors.instance.grey400,
                          fontWeight: FontFamilies.medium,
                        ),
                      ),
                      Text(
                        fullname ?? "",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 19,
                          color: AppColors.instance.grey200,
                          fontWeight: FontFamilies.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                Votingsettingcheck(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: pollAsync.when(
                      data: (data) {
                        if (data?.data != null &&
                            data!.data!.polls!.isNotEmpty) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:
                                data.data!.polls!
                                    .map(
                                      (e) => InkWell(
                                        onTap: () {
                                          ref
                                              .read(formProvider.notifier)
                                              .updateGenrateMemberIdLoading(
                                                false,
                                              );
                                          ref
                                              .read(electionProvider.notifier)
                                              .addId(e.id.toString());
                                          context.pushNamed(
                                            AppRoutes.electionDasbord,
                                            extra: {"id": e.id.toString()},
                                          );
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context) => ElectionPage()),
                                          // );
                                        },
                                        child: Icon(
                                          Icons.how_to_vote,
                                          color: AppColors.instance.yellow500,
                                          size: 30,
                                        ),
                                      ),
                                    )
                                    .toList(),
                          );
                        }
                        return null;
                      },
                      error: (err, stack) {
                        return SizedBox.shrink();
                      },
                      loading: () {
                        return SizedBox.shrink();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _memberID(String memberId) {
    return Text(
      memberId,
      style: TextStyle(
        fontFamily: FontFamilies.interDisplay,
        fontSize: 11,
        color: AppColors.instance.grey200,
        fontWeight: FontFamilies.bold,
      ),
    );
  }
}
