import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/co_dropdown.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/securitybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValidateWorkOrderOtp extends ConsumerStatefulWidget {
  final String validateType;
  ValidateWorkOrderOtp({super.key, required this.validateType});

  @override
  ConsumerState<ValidateWorkOrderOtp> createState() =>
      _ValidateWorkOrderOtpState();
}

class _ValidateWorkOrderOtpState extends ConsumerState<ValidateWorkOrderOtp> {
  final _otpController = TextEditingController();
  final _noteController = TextEditingController();
  List<String> _accessType = ["Checkin", "Checkout"];

  @override
  Widget build(BuildContext context) {
    // final state = ref.read(oTpformProvider.notifier);
    final isLoading = ref.watch(oTpformProvider).isLoading;
    final notifiers = ref.read(oTpformProvider);
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
                    widget.validateType == "work"
                        ? "Validate work order"
                        : "Validate  OTP",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 18,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.validateType == "work"
                        ? "Valiate work order code to grant entry."
                        : "Valiate otp code to grant entry.",
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
                fieldType: FieldType.oTpCode,
                hintText: "(eg. #84758)",
                label: "Enter OTP",
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
              SizedBox(height: 10),
              CoDropdown(
                item: _accessType,
                onChanged: (value) {
                     ref.read(oTpformProvider.notifier).updateAccesType(value??"");
                  ref
                      .read(oTpformProvider.notifier)
                      .updateOTPCodeField(
                        field: 'Access',
                        isValid: value?.isNotEmpty ?? false,
                        errorMessage: '',
                      );
                },
                label: "Access Type",
                value:
                    _accessType.contains(notifiers.accessType)
                        ? notifiers.accessType
                        : null,
                errorKey: "Access Type",
              ),

              SizedBox(height: 10),
              ReusabelProfileForm(
                controller: _noteController,
                fieldType: FieldType.name,
                hintText: "(eg. arrived in time )",
                label: "Security note",
                fieldKey: "Security note",
                onChanged: (value) {
                  ref.read(oTpformProvider.notifier).updateSecurityNote(value);
                },
                onValidationChanged: (validation) {
                  ref
                      .read(oTpformProvider.notifier)
                      .updateOTPCodeField(
                        field: 'Security note',
                        isValid: validation.isValid,
                        errorMessage: validation.error,
                      );
                },
              ),
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
    // final isLoading = ref.watch(estateCodeSubmissionProvider).isLoading;

    return ActionSecurityButton(
      isLoading: formState.isLoading,
      label: 'Validate',
      onPressed:
          formState.otpallValid
              ? () {
                if (formState.accessType == "Checkin") {
                  providerState.chekinOtp(
                    context: context,
                    otpCode: formState.otpCode ?? "",
                    securityNote: formState.securityNoted ?? "",

                    ref: ref,
                  );
                } else {
                  providerState.checkOutOTP(
                    context: context,
                    otpCode: formState.otpCode ?? "",
                    securityNoted: formState.securityNoted ?? "",

                    ref: ref,
                  );
                }
                _noteController.clear();
                _otpController.clear();
              }
              : null,
    );
  }
}
