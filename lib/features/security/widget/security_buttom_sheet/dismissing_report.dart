import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/co_dropdown.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DismissingReport extends ConsumerStatefulWidget {
  final String title;
  final String reportBy;
  final int id;
  DismissingReport({
    super.key,
    required this.id,
    required this.reportBy,
    required this.title,
  });

  @override
  ConsumerState<DismissingReport> createState() => _DismissingReportState();
}

class _DismissingReportState extends ConsumerState<DismissingReport> {
  final _noteController = TextEditingController();
  List<String> reason = [
    "Insuficient Evidenc",
    "False Report",
    "Reported in Error",
    "Security Not Responsible",
  ];
  @override
  void dispose() {
    super.dispose();
    _noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(oTpformProvider);
    final notifer = ref.watch(oTpformProvider.notifier);
    final form = ref.read(formProvider.notifier);

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                        notifer.resetForm();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 20,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  Text(
                    widget.reportBy,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 12,
                      color: AppColors.instance.black300,
                    ),
                  ),
                  SizedBox(height: 24),
                  if (widget.title.toString().toLowerCase().contains(
                    "resovled",
                  )) ...[
                    ReusabelProfileForm(
                      controller: _noteController,
                      fieldType: FieldType.reason,
                      hintText: "(eg. Violation resolved.)",
                      label: "Note",
                      fieldKey: "Note",
                      onChanged: (value) {},
                      onValidationChanged: (validation) {
                        // ref
                        //     .read(oTpformProvider.notifier)
                        //     .updateOTPCodeField(
                        //       field: 'Location',
                        //       isValid: validation.isValid,
                        //       errorMessage: validation.error,
                        //     );
                      },
                    ),
                  ] else
                    CoDropdown(
                      item: reason,
                      label: "Select a reason",
                      onChanged: (value) {
                        notifer.updateReason(value ?? "");
                      },
                      value:
                          reason.contains(state.reason) ? state.reason : null,
                      errorKey: "Reason",
                    ),

                  SizedBox(height: 30),
                  if (widget.title.toString().toLowerCase().contains(
                    "resovled",
                  )) ...[
                    _buildCommentButton(
                      onTap:
                          _noteController.text.isNotEmpty &&
                                  _noteController.text.length > 19
                              ? () {
                                if (_noteController.text.isNotEmpty &&
                                    _noteController.text.length > 19) {
                                  form.resolvedViolation(
                                    context: context,
                                    reason: _noteController.text,
                                    id: widget.id.toString(),
                                    ref: ref,
                                  );
                                }
                                _noteController.clear();
                              }
                              : null,
                      child:
                          state.isLoading
                              ? Loadingstates()
                              : Text(
                                'Submit${widget.id.toString()}',
                                style: TextStyle(
                                  fontFamily: FontFamilies.interDisplay,
                                  color: AppColors.instance.grey200,
                                  fontWeight: FontFamilies.bold,
                                ),
                              ),
                    ),
                  ] else
                    _buildCommentButton(
                      onTap:
                          state.resonaValid
                              ? () {
                                form.dismissedViolation(
                                  context: context,
                                  reason: state.reason ?? "",
                                  id: widget.id.toString(),
                                  ref: ref,
                                );
                              }
                              : null,
                      child:
                          state.isLoading
                              ? Loadingstates()
                              : Text(
                                'Submit',
                                style: TextStyle(
                                  fontFamily: FontFamilies.interDisplay,
                                  color: AppColors.instance.grey200,
                                  fontWeight: FontFamilies.bold,
                                ),
                              ),
                    ),
                ],
              ),
            ],
          ),
        ),
        if (state.isLoading) Positioned.fill(child: _buildOverlayLoading()),
      ],
    );
  }

  Widget _buildOverlayLoading() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Center(child: Loadingstates()),
    );
  }

  Widget _buildCommentButton({
    required Widget child,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap != null ? onTap : null,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color:
              onTap != null
                  ? AppColors.instance.black600
                  : AppColors.instance.grey300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: child),
      ),
    );
  }
}
