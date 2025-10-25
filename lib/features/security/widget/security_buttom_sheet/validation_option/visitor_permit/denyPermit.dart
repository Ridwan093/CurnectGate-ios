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

class DenyPermitEntry extends ConsumerStatefulWidget {
  final String id;
  DenyPermitEntry({super.key, required this.id});

  @override
  ConsumerState<DenyPermitEntry> createState() => _DenyEntryState();
}

class _DenyEntryState extends ConsumerState<DenyPermitEntry> {
  final _reasonEditinControler = TextEditingController();

  final _securityNotedController = TextEditingController();

  //455565
  @override
  Widget build(BuildContext context) {
    // final state = ref.read(oTpformProvider.notifier);
    // final notifiers = ref.read(oTpformProvider);
    final isLoading = ref.watch(oTpformProvider).isLoading;
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
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.close,
                        color: AppColors.instance.black600,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Flag Discrepancy",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 18,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Specifie the reason for  flag.",
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
                hintText: "(eg. not meet up with estate standand)",
                label: "Enter flag reason",
                fieldKey: "Reason",
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
              ReusabelProfileForm(
                controller: _securityNotedController,
                fieldType: FieldType.reason,
                hintText: "(eg. Invalide Otp)",
                label: "Enter discrepancy notes",
                fieldKey: "notes",
                onChanged: (value) {
                  ref.read(oTpformProvider.notifier).updateSecurityNote(value);
                },
                onValidationChanged: (validation) {
                  ref
                      .read(oTpformProvider.notifier)
                      .updateOTPCodeField(
                        field: 'notes',
                        isValid: validation.isValid,
                        errorMessage: validation.error,
                      );
                },
              ),

              _buildBottomAction(ref, context, widget.id),
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

  Widget _buildBottomAction(WidgetRef ref, BuildContext context, String id) {
    final formState = ref.watch(oTpformProvider);
    final providerState = ref.read(formProvider.notifier);
    // final isLoading = ref.watch(estateCodeSubmissionProvider).isLoading;

    return ActionSecurityButton(
      isLoading: formState.isLoading,
      label: 'Deny',
      onPressed:
          _securityNotedController.text.isNotEmpty &&
                  _securityNotedController.text.length > 19 &&
                  _reasonEditinControler.text.isNotEmpty &&
                  _reasonEditinControler.text.length > 19
              ? () {
                log(_securityNotedController.text);
                providerState.permitdenyEntry(
                  context: context,
                  denyReason: _reasonEditinControler.text.trim(),
                  securityNote: _securityNotedController.text.trim(),
                  id: id,
                  ref: ref,
                );

                _securityNotedController.clear();
                _reasonEditinControler.clear();
              }
              : null,
    );
  }
}
