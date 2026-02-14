import 'dart:developer';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/securitybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DeclineReason extends ConsumerStatefulWidget {
  final String isProperty;
  DeclineReason({super.key, required this.isProperty});

  @override
  ConsumerState<DeclineReason> createState() => _DenyEntryState();
}

class _DenyEntryState extends ConsumerState<DeclineReason> {
  final _reasonEditinControler = TextEditingController();

  final _securityNotedController = TextEditingController();

  //455565
  @override
  Widget build(BuildContext context) {
    // final state = ref.read(oTpformProvider.notifier);
    // final notifiers = ref.read(oTpformProvider);

    final isLoading =
        ref.watch(formProvider).termsAndCondintionLoading ?? false;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.close,
                        color: AppColors.instance.black600,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Decline agreement",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 18,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Specifie the reason for decline.",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 13,
                      color: AppColors.instance.black300,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25),
              ReusabelProfileForm(
                controller: _reasonEditinControler,
                fieldType: FieldType.reason,
                hintText:
                    "(eg. I need more time to review the terms with my lawyer)",
                label: "Enter reason",
                fieldKey: "oTpCode",
                onChanged: (value) {
                  ref.read(oTpformProvider.notifier).updateReason(value);
                },
                onValidationChanged: (validation) {
                  ref
                      .read(oTpformProvider.notifier)
                      .updateOTPCodeField(
                        field: 'Reason',
                        isValid: validation.isValid,
                        errorMessage: validation.error,
                      );
                },
              ),

              SizedBox(height: 10),

              _buildBottomAction(ref, context),
            ],
          ),
        ),
        if (isLoading) Positioned.fill(child: _buildOverlayLoading()),
      ],
    );
  }

  Widget _buildOverlayLoading() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Center(child: Loadingstates()),
    );
  }

  Widget _buildBottomAction(WidgetRef ref, BuildContext context) {
    final formState = ref.watch(oTpformProvider);
    final providerState = ref.read(formProvider.notifier);
    final isLoading = ref.read(formProvider).termsAndCondintionLoading ?? false;
    // final isLoading = ref.watch(estateCodeSubmissionProvider).isLoading;

    return ActionSecurityButton(
      isLoading: isLoading,
      label: 'Decline',
      onPressed:
          _reasonEditinControler.text.isNotEmpty
              ? () {
                log(_securityNotedController.text);
                if (widget.isProperty.contains("property")) {
                  providerState.rejectAgreement(
                    context: context,
                    isProperty: true,
                    reason: formState.reason ?? "",
                    ref: ref,
                  );
                } else {
                  providerState.rejectAgreement(
                    context: context,
                    isProperty: false,
                    reason: formState.reason ?? "",
                    ref: ref,
                  );
                }

                _securityNotedController.clear();
                _reasonEditinControler.clear();
              }
              : null,
    );
  }
}
