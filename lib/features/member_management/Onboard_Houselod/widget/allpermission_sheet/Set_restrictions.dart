import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SetRestrictions extends ConsumerWidget {
  final String username;
  final int id;
  const SetRestrictions({super.key, required this.id, required this.username});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
              Text(
                "Set digital id restriction",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 20,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Add or remove digital id restriction from houseHold",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  color: AppColors.instance.black300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          _buildRestrictionWidget(
            title: "Add restriction",
            onTap: () {
              context.pop();
              showUserBottomSheet(
                context: context,
                headertitle: "",
                headersubtitle: "",
                ref: ref,
                bottom: BottomSheetView.addRestrictions,
                id: id,
              );
            },
            imagePaths: '',
          ),
          const SizedBox(height: 5),
          _buildRestrictionWidget(
            title: "Remove restriction",
            onTap: () {
              context.pop();
              showUserBottomSheet(
                context: context,
                headertitle: username,
                headersubtitle: "",
                ref: ref,
                bottom: BottomSheetView.removedRestrictions,
                id: id,
              );
            },
            imagePaths: AssetPaths.removedrestriction,
          ),
        ],
      ),
    );
  }

  Widget _buildRestrictionWidget({
    required String title,
    required VoidCallback onTap,
    String imagePaths = '',
  }) {
    return Container(
      height: 100,
      color: AppColors.instance.grey300,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: AppColors.instance.grey400,
          child:
              imagePaths.isEmpty
                  ? Center(
                    child: Icon(Icons.add, color: AppColors.instance.black600),
                  )
                  : Image.asset(imagePaths, width: 20),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
