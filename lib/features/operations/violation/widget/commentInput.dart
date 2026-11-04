import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/customSwitch.dart';
import 'package:curnectgate/features/operations/violation/report_provider/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Commentinput extends ConsumerWidget {
  final int id;
  final Animation<Offset> slideAnimation2;
  final Animation<double> fadeAnimation2;
  final AnimationController animationController2;
  Commentinput({
    super.key,
    required this.animationController2,
    required this.fadeAnimation2,
    required this.slideAnimation2,
    required this.id,
  });
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(reportProvider).commentValid;
    final isLoading = ref.watch(formProvider).commentLoading;
    final formproviders = ref.read(formProvider.notifier);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Internal comment switch
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isValid
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: FadeTransition(
                      opacity: fadeAnimation2,
                      child: SlideTransition(
                        position: slideAnimation2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.instance.yellow500.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.instance.yellow500.withOpacity(0.2),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.lock_outline, size: 16, color: AppColors.instance.yellow500),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Internal comment",
                                    style: TextStyle(
                                      fontFamily: FontFamilies.interDisplay,
                                      color: AppColors.instance.yellow500,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Transform.scale(
                                scale: 0.7,
                                child: CustomSwitch(
                                  value: ref.watch(reportProvider).report.isCommentInternal ?? false,
                                  onChanged: (val) {
                                    ref.read(reportProvider.notifier).setCommentInternal(val);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),

          // Input Area
          Container(
            decoration: BoxDecoration(
              color: AppColors.instance.grey200.withOpacity(0.5),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.instance.black100),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    maxLines: 4,
                    minLines: 1,
                    onChanged: (value) {
                      ref.read(reportProvider.notifier).setcomment(value);
                      if (value.trim().isNotEmpty) {
                        animationController2.forward();
                      } else {
                        animationController2.reverse();
                      }
                    },
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 14,
                      color: AppColors.instance.black600,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      hintStyle: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 14,
                        color: AppColors.instance.black300,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, left: 8),
                  child: isLoading
                      ? SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.instance.teal500,
                          ),
                        )
                      : GestureDetector(
                          onTap: isValid
                              ? () async {
                                  formproviders.makeACommentonReport(
                                    id: id.toString(),
                                    context: context,
                                    ref: ref,
                                  );
                                  _commentController.clear();
                                  ref.read(reportProvider.notifier).setcomment("");
                                  animationController2.reverse();
                                }
                              : null,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isValid ? AppColors.instance.teal500 : AppColors.instance.black200,
                            ),
                            child: const Icon(
                              Icons.send_rounded,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
