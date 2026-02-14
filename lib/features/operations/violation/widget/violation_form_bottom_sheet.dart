import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/operations/violation/report_provider/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ViolationFormBottomSheet extends ConsumerWidget {
  final String title;
  final String subtitle;
  final double? titlefontSize;
  final double? subtitlefontSize;
  final Widget widget;
  const ViolationFormBottomSheet({
    super.key,
    required this.title,
    required this.subtitle,
    required this.widget,
    this.subtitlefontSize = 12,
    this.titlefontSize = 20,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportNotifer = ref.read(reportProvider.notifier);
    final size = MediaQuery.sizeOf(context);
    final repor = ref.read(formProvider.notifier);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      context.pop();
                      repor.updateReportLoading(false);
                      reportNotifer.resetState();
                    },
                    child: Text(
                      "Close",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 14,
                        color: AppColors.instance.teal400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    fontSize: titlefontSize,
                    color: AppColors.instance.black600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: subtitlefontSize,
                    color: AppColors.instance.black300,
                  ),
                ),
              ],
            ),

            Expanded(child: widget),
          ],
        ),
      ),
    );
  }
}
