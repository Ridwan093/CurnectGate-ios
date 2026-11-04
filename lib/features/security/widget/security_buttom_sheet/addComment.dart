import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/limitTextfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Addcomment extends ConsumerWidget {
  final String title;
  final String reportBy;
  final String date;
  const Addcomment({
    super.key,
    required this.date,
    required this.reportBy,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 20,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                reportBy,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 12,
                  color: AppColors.instance.black300,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 12,
                  color: AppColors.instance.black300,
                ),
              ),
              SizedBox(height: 15),
              _buildSetInternalComment(),
              SizedBox(height: 15),
              LimitedTextField(
                maxLength: 500,
                hintText: 'Enter your comment here...',
                maxLines: 5,
              ),
              SizedBox(height: 30),
              _buildCommentButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommentButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.instance.black600,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Add comment',
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.grey200,
              fontWeight: FontFamilies.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSetInternalComment() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.instance.grey300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Set internal comment",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                    fontSize: 14,
                    fontWeight: FontFamilies.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Chose whether the comment is visible to Admin only or to the public.",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black300,
                    fontSize: 12,
                    fontWeight: FontFamilies.bold,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 0,
            child: Switch(
              focusColor: AppColors.instance.teal300,
              thumbColor: WidgetStatePropertyAll(Colors.white),
              inactiveThumbColor: AppColors.instance.grey500,
              activeColor: AppColors.instance.teal300,
              value: true,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
