import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportCard extends ConsumerWidget {
  const ReportCard({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: (){
         showUserBottomSheet(
          context: context,
          headertitle: "Report violation",
          headersubtitle: "Report issues like noise, parking, or misconduct",
          ref: ref,
          bottom: BottomSheetView.resolutionTime,
        );
      },
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 1,
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: AppColors.instance.grey300,
            borderRadius: BorderRadius.circular(5),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderRow(),
                _buildReportdiscription("Car parked across my..."),
                _buildAnonymouswidget(),
                SizedBox(height: 15),
                _buildCarReportImage(size),
                SizedBox(height: 10),
                _resolvedMark(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarReportImage(Size size) {
    return Container(
      height: 100,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd9_hrYPsmUzcN3xn7jFzU-MQJX_5k5Uqj-JmmEcnQXYcZHx6umVCyAf68yIfQ_2fF2Xs&usqp=CAU",
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildReportdiscription(String description) {
    return Text(
      description,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: AppColors.instance.black300,
        fontFamily: FontFamilies.interDisplay,
      ),
    );
  }

  Widget _buildAnonymouswidget() {
    return Row(
      children: [
        Image.asset(AssetPaths.anonymous, height: 30, width: 20),
        SizedBox(width: 5),
        Text(
          "Anonymous",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black500,
          ),
        ),
      ],
    );
  }

  Widget _resolvedMark(Size size) {
    return Container(
      height: 40,
      width: size.width,

      decoration: BoxDecoration(
        color: AppColors.instance.teal200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Mark as resolved",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black500,
              fontWeight: FontFamilies.bold,
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.done, color: AppColors.instance.black500),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Improper parking at Block 57",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
            fontWeight: FontFamilies.bold,
          ),
        ),
        _buildpendingIcon(),
      ],
    );
  }

  Widget _buildpendingIcon() {
    return Stack(
      children: [
        Icon(Icons.error_outline, color: AppColors.instance.black600),

        Positioned(
          right: 0,
          top: 3,

          child: CircleAvatar(
            radius: 3,
            backgroundColor: AppColors.instance.yellow500,
          ),
        ),
      ],
    );
  }
}
