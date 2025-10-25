import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/work_drop_down.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/securitybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VendorAccessDeny extends ConsumerStatefulWidget {
  final String otpCode;
  VendorAccessDeny({super.key, required this.otpCode});

  @override
  ConsumerState<VendorAccessDeny> createState() => _DenyEntryState();
}

class _DenyEntryState extends ConsumerState<VendorAccessDeny> {
  final _reasonEditinControler = TextEditingController();

  final _dec = TextEditingController();

  //455565

  final _listofReason = [
    "Rude",
    "Aggressive",
    "Intoxicated",
    "No id",
    "Suspicious",
    "Other",
  ];
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
                    "Deny Access",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 18,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Specifie the reason for deny access.",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 13,
                      color: AppColors.instance.black300,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25),
              WorkDropDown(
                workTypes: _listofReason,
                label: "Reason",
                onChanged: (value) {
                  ref
                      .read(oTpformProvider.notifier)
                      .updateReason(
                        value.toString().contains("no id")
                            ? "no_id"
                            : value?.toLowerCase() ?? "",
                      );
                },
              ),
              SizedBox(height: 10),
              ReusabelProfileForm(
                controller: _dec,
                fieldType: FieldType.reason,
                hintText: "(eg. Invalide Otp)",
                label: "Enter description",
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

              _buildBottomAction(ref, context, widget.otpCode),
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
      label: 'Deny Access',
      onPressed:
          _dec.text.isNotEmpty &&
                  _dec.text.length > 19 &&
                  formState.reason != null
              ? () {
                providerState.vendorAccessCodeDeny(
                  context: context,
                  reason: reason(formState.reason.toString().toLowerCase()),
                  dec: _dec.text.trim(),
                  otpCode: id,
                  ref: ref,
                );

                _dec.clear();
                _reasonEditinControler.clear();
              }
              : null,
    );
  }

  String reason(String reason) {
    switch (reason.toLowerCase()) {
      case "no id":
        return "no_id";

      default:
        return reason;
    }
  }
}
