import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/securitybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Validateotp extends ConsumerWidget {
  const Validateotp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
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
                  child: Icon(Icons.close, color: AppColors.instance.black600),
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Validate OTP",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 18,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Valiate access code to grant entry.",
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
            fieldType: FieldType.oTpCode,
            hintText: "(eg. #84758)",
            label: "Enter OTP",
            fieldKey: "oTpCode",
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
          _buildBottomAction(ref, context),
        ],
      ),
    );
  }

  Widget _buildBottomAction(WidgetRef ref, BuildContext context) {
    final formState = ref.watch(oTpformProvider);
    // final isLoading = ref.watch(estateCodeSubmissionProvider).isLoading;

    return ActionSecurityButton(
      label: 'Validate',
      onPressed:
          formState.allValid
              ? () {
                Navigator.pop(context);
                showUserBottomSheet(
                  context: context,
                  headertitle: "",
                  headersubtitle: "",
                  ref: ref,
                  bottom: BottomSheetView.valdationConfrm,
                );
              }
              : null,
    );
  }
}
