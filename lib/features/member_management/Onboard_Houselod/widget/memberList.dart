import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/household_member.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Memberlist extends ConsumerWidget {
  final List<HouseholdMember> housemember;
  const Memberlist({super.key, required this.housemember});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: housemember.length,
      itemBuilder: (BuildContext context, int index) {
        final userinfo = housemember[index];
        return _buildListContent(userinfo, context, ref);
      },
    );
  }

  Widget _buildListContent(
    HouseholdMember userinfo,
    BuildContext context,
    WidgetRef ref,
  ) {
    String avatarUrl =
        'https://ui-avatars.com/api/?name=${Uri.encodeComponent(userinfo.fullName ?? "")}&background=8EC0C9&color=ffffff&size=128';
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 7),
      color: AppColors.instance.grey300,
      child: ListTile(
        onTap: () {
          showUserBottomSheet(
            context: context,
            headertitle: userinfo.fullName ?? "",
            headersubtitle: userinfo.role ?? "",
            ref: ref,
            bottom: BottomSheetView.permissions,
            id: userinfo.id,
          );
          ref
              .watch(notificationProviders.notifier)
              .updateID(userinfo.id.toString());
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            userinfo.mediaUrl == null ? avatarUrl : userinfo.mediaUrl ?? "",
          ),
        ),
        title: Text(
          "${userinfo.firstname} ${userinfo.lastname}",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 15,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black600,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.instance.black600,
          size: 16,
        ),
        subtitle: Text(
          userinfo.role ?? "",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 12,
            fontWeight: FontFamilies.medium,
            color: AppColors.instance.black300,
          ),
        ),
      ),
    );
  }
}
