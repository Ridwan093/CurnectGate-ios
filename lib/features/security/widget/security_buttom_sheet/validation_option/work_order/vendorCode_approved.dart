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

class GrantVendorEntry extends ConsumerStatefulWidget {
  final String id;

  GrantVendorEntry({super.key, required this.id});

  @override
  ConsumerState<GrantVendorEntry> createState() => _DenyEntryState();
}

class _DenyEntryState extends ConsumerState<GrantVendorEntry> {
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
                    "Grant Entry",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 18,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Grant vendor first time entry.",
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
                controller: _securityNotedController,
                fieldType: FieldType.reason,
                hintText: "(eg. meet up with estate standand)",
                label: "Security notes",
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
      label: 'Grant Access',
      onPressed:
          _securityNotedController.text.isNotEmpty &&
                  _securityNotedController.text.length > 4
              ? () {
                log(_securityNotedController.text);
                providerState.allWorkersAccess(
                  context: context,
                  securityNote: _securityNotedController.text.trim(),
                  action: "grant",
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
