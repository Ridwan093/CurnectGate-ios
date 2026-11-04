import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/securitybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValidateWorkOrders extends ConsumerStatefulWidget {
  final String validateType;
  ValidateWorkOrders({super.key, required this.validateType});

  @override
  ConsumerState<ValidateWorkOrders> createState() =>
      _ValidateWorkOrderOtpState();
}

class _ValidateWorkOrderOtpState extends ConsumerState<ValidateWorkOrders> {
  final _otpController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final state = ref.read(oTpformProvider.notifier);
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
                    widget.validateType == "workers"
                        ? "Worker Access Code"
                        : "Vendor Access Code",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 18,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.validateType == "workers"
                        ? "Enter the worker access code to manage movement"
                        : "Enter the vendor access code to manage movement",
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
                controller: _otpController,
                fieldType: FieldType.vendorOtp,
                hintText: "(eg. #84758)",
                label: "Vendor Access Code",
                fieldKey: "oTpCode",
                onChanged: (value) {
                  ref.read(oTpformProvider.notifier).updateOtpCode(value);
                },
                onValidationChanged: (validation) {
                  ref
                      .read(oTpformProvider.notifier)
                      .updateOTPCodeField(
                        field: 'OTPCode',
                        isValid: validation.isValid,
                        errorMessage: validation.error,
                      );
                },
              ),
              if (widget.validateType == "vendor") ...[
                SizedBox(height: 10),
                ReusabelProfileForm(
                  controller: _noteController,
                  fieldType: FieldType.phone,
                  hintText: "(eg. 234908784783 )",
                  label: "Vendor Phone",
                  fieldKey: "Phone",
                  onChanged: (value) {
                    ref.read(oTpformProvider.notifier).updatePhone(value);
                  },
                  onValidationChanged: (validation) {
                    ref
                        .read(oTpformProvider.notifier)
                        .updateOTPCodeField(
                          field: 'Phone',
                          isValid: validation.isValid,
                          errorMessage: validation.error,
                        );
                  },
                ),
              ],

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
    // final providerState = ref.read(formProvider.notifier);
    // final isLoading = ref.watch(estateCodeSubmissionProvider).isLoading;

    return ActionSecurityButton(
      isLoading: formState.isLoading,
      label: 'Validate',
      onPressed: _click(widget.validateType),
    );
  }

  VoidCallback? _click(String valid) {
    final formState = ref.watch(oTpformProvider);
    final providerState = ref.read(formProvider.notifier);
    switch (valid.toLowerCase()) {
      case "vendor":
        return formState.vendorCodeValid
            ? () {
              providerState.validateVendorUsingOTP(
                otpCode: _otpController.text.trim(),
                vendochekc: "1",
                context: context,
                requestData: {
                  "vendor_access_code": _otpController.text.trim(),
                  "vendor_phone": _noteController.text.trim(),
                },
                ref: ref,
              );
              _noteController.clear();
              _otpController.clear();
            }
            : null;

      case "workers":
        return formState.workersValid
            ? () {
              providerState.validateVendorUsingOTP(
                otpCode: _otpController.text.trim(),
                vendochekc: "2",
                context: context,
                requestData: {"access_code": _otpController.text.trim()},
                ref: ref,
              );
              _noteController.clear();
            }
            : null;
      default:
    }
    return null;
  }
}
