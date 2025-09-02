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

class AddLocationAndAccesType extends ConsumerStatefulWidget {
  final String qrCodeToken;
  final String accessType;

  AddLocationAndAccesType({
    super.key,
    required this.accessType,
    required this.qrCodeToken,
  });

  @override
  ConsumerState<AddLocationAndAccesType> createState() =>
      _AddLocationAndAccesTypeState();
}

class _AddLocationAndAccesTypeState
    extends ConsumerState<AddLocationAndAccesType> {


  final _locationController = TextEditingController();
  List<String> _accessType = [
    "Gate entry",
    "Gate exit",
    "Facility access",
    "Checkin",
    "Checkout",
  ];

  @override
  Widget build(BuildContext context) {
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
                    "Add Validate Info",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 18,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "provide more info about the entry",
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
                controller: _locationController,
                fieldType: FieldType.name,
                hintText: "(eg. Main Gate)",
                label: "Location",
                fieldKey: "Location",
                onChanged: (value) {
                  ref.read(oTpformProvider.notifier).updateLocation(value);
                },
                onValidationChanged: (validation) {
                  ref
                      .read(oTpformProvider.notifier)
                      .updateOTPCodeField(
                        field: 'Location',
                        isValid: validation.isValid,
                        errorMessage: validation.error,
                      );
                },
              ),
              SizedBox(height: 10),
              CoDropdown(
                item: _accessType,
                onChanged: (value) {
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

              _buildBottomAction(ref, context, widget.qrCodeToken),
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

  Widget _buildBottomAction(
    WidgetRef ref,
    BuildContext context,
    String qrCodedata,
  ) {
    final formState = ref.watch(oTpformProvider);
    final forms = ref.read(formProvider.notifier);
    // final isLoading = ref.watch(estateCodeSubmissionProvider).isLoading;

    return ActionSecurityButton(
      isLoading: formState.isLoading,
      label: 'Validate',
      onPressed:
          formState.validateMain
              ? () {
                forms.scanQRCode(
                  context: context,
                  qrCodeData: qrCodedata,
                  accessTypes: formState.accessType ?? "",
                  location: formState.locationAccess ?? "",
                  ref: ref,
                );
                _locationController.clear();
              }
              : null,
    );
  }
}
