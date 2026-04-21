import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/securitybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VendorAccessCodeCheckIn extends ConsumerStatefulWidget {
  final String otpCode;
  VendorAccessCodeCheckIn({super.key, required this.otpCode});

  @override
  ConsumerState<VendorAccessCodeCheckIn> createState() =>
      _ValidateWorkOrderOtpState();
}

class _ValidateWorkOrderOtpState
    extends ConsumerState<VendorAccessCodeCheckIn> {
  final _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final state = ref.read(oTpformProvider.notifier);
    final isLoading = ref.watch(oTpformProvider).isLoading;
    // final notifiers = ref.read(oTpformProvider);
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
                    "Check In Worker",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 18,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Confirm check-in worker",
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
                controller: _noteController,
                fieldType: FieldType.none,
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
                        field: 'note',
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
      onPressed: () {
        providerState.vendorAccessCodeCheckIn(
          context: context,
          otpCode: widget.otpCode,
          securityNote: formState.securityNoted ?? "",
          override_time_window: false,

          ref: ref,
        );

        _noteController.clear();
      },
    );
  }
}
