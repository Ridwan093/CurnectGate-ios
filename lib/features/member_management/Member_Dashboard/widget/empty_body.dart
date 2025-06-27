import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/vewMoreButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmptyBody extends ConsumerWidget {
  final String imagepath;

  final String emptyMessag;

  final String buttonTexe;
  final VoidCallback onTap;
  const EmptyBody({
    super.key,
    required this.onTap,
    required this.imagepath,
    required this.emptyMessag,
    required this.buttonTexe,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 150,
            width: size.width,
            decoration: BoxDecoration(
              color: AppColors.instance.grey300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Image.asset(imagepath, height: 80, width: 80),
                SizedBox(height: 10),
                Text(
                  emptyMessag,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black300,
                    fontSize: 13,
                    fontWeight: FontFamilies.medium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ViewMoreButton(buttontext: buttonTexe, onTap: onTap),
        ],
      ),
    );
  }
}
