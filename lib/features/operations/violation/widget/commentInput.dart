import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/customSwitch.dart';
import 'package:curnectgate/features/operations/violation/report_provider/report_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Commentinput extends ConsumerWidget {
  final Animation<Offset> slideAnimation2;
  final Animation<double> fadeAnimation2;
  final AnimationController animationController2;
  Commentinput({
    super.key,
    required this.animationController2,
    required this.fadeAnimation2,
    required this.slideAnimation2,
  });
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(reportProvider).commentValid;
    final isLoading = ref.watch(formProvider).commentLoading;
    final formproviders = ref.read(formProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 👇 Slide + Fade animated switch (only if comment is not empty)
          AnimatedBuilder(
            animation: animationController2,
            builder: (context, child) {
              return Visibility(
                visible: isValid,
                child: FadeTransition(
                  opacity: fadeAnimation2,
                  child: SlideTransition(
                    position: slideAnimation2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mark as internal comment",
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            color: AppColors.instance.black600,
                            fontWeight: FontFamilies.light,
                          ),
                        ),
                        CustomSwitch(
                          value:
                              ref
                                  .watch(reportProvider)
                                  .report
                                  .isCommentInternal ??
                              false,
                          onChanged: (val) {
                            ref
                                .read(reportProvider.notifier)
                                .setCommentInternal(val);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 8),

          // 👇 Comment Input
          TextField(
            controller: _commentController,
            decoration: InputDecoration(
              hintText: 'Write a comment...',
              border: InputBorder.none,
              suffixIconConstraints: BoxConstraints(
                maxWidth: 100,
                maxHeight: 100,
              ),
              suffixIcon:
                  isLoading
                      ? SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: AppColors.instance.yellow500,
                        ),
                      )
                      : isValid
                      ? IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () async {
                   formproviders
                              .makeACommentonReport(context: context, ref: ref);
                          _commentController.clear();
                                                },
                      )
                      : null,
            ),
            onChanged: (value) {
              ref.read(reportProvider.notifier).setcomment(value);

              // Trigger animation when text appears
              if (value.trim().isNotEmpty) {
                animationController2.forward();
              } else {
                animationController2.reverse();
              }
            },
            maxLines: 3,
            minLines: 1,
          ),
        ],
      ),
    );
  }
}
