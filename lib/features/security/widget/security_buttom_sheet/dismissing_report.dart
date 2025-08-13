import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/work_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DismissingReport extends ConsumerWidget {
  final String title;
  final String reportBy;
  final int id;
  DismissingReport({
    super.key,
    required this.id,
    required this.reportBy,
    required this.title,
  });
  List<String> reason = [
    "Insuficient Evidenc",
    "False Report",
    "Reported in Error",
    "Security Not Responsible",
  ];

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
              Text(
                reportBy,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 12,
                  color: AppColors.instance.black300,
                ),
              ),
              SizedBox(height: 24),
              WorkDropDown(
                onChanged: (value) {},
                label: "Select a reason",
                workTypes: reason,
              ),
              SizedBox(height: 15),

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
            'Submit',
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
}
