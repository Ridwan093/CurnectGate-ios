import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/securitybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DenyEventEntry extends ConsumerStatefulWidget {
  final String rawMap;
  final int eventId;

  const DenyEventEntry({
    super.key,
    required this.rawMap,
    required this.eventId,
  });

  @override
  ConsumerState<DenyEventEntry> createState() => _DenyEventEntryState();
}

class _DenyEventEntryState extends ConsumerState<DenyEventEntry> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _plateController = TextEditingController();
  final _countController = TextEditingController();
  final _pointController = TextEditingController();
  final _notesController = TextEditingController();
  final _reasonController = TextEditingController();
  final ValueNotifier<bool> _isFormValid = ValueNotifier(false);

  void _validateForm() {
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();
    final reason = _reasonController.text.trim();
    _isFormValid.value =
        name.length > 1 && phone.length >9 && reason.length >4;
  }

  @override
  void initState() {
    super.initState();
    _countController.text = "1";
    _nameController.addListener(_validateForm);
    _phoneController.addListener(_validateForm);
    _reasonController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _nameController.removeListener(_validateForm);
    _phoneController.removeListener(_validateForm);
    _reasonController.removeListener(_validateForm);
    _nameController.dispose();
    _phoneController.dispose();
    _plateController.dispose();
    _countController.dispose();
    _pointController.dispose();
    _notesController.dispose();
    _reasonController.dispose();
    _isFormValid.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(oTpformProvider).isLoading;

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Deny Entry",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 18,
                      color: AppColors.instance.error500,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, color: AppColors.instance.black400),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "Enter details and reason for denying entry",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 13,
                  color: AppColors.instance.black300,
                ),
              ),
              const SizedBox(height: 20),
              ReusabelProfileForm(
                controller: _nameController,
                fieldType: FieldType.name,
                hintText: "Enter guest name",
                label: "Guest Name",
                fieldKey: "guest_name",
              ),
              const SizedBox(height: 16),
              ReusabelProfileForm(
                controller: _phoneController,
                fieldType: FieldType.phone,
                hintText: "Enter guest phone",
                label: "Guest Phone",
                fieldKey: "guest_phone",
              ),
              const SizedBox(height: 16),
              ReusabelProfileForm(
                controller: _plateController,
                fieldType: FieldType.name,
                hintText: "Enter vehicle plate number",
                label: "Vehicle Plate Number",
                fieldKey: "vehicle_plate",
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ReusabelProfileForm(
                      controller: _countController,
                      fieldType: FieldType.year,
                      hintText: "0",
                      label: "Guest Count",
                      fieldKey: "guest_count",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ReusabelProfileForm(
                      controller: _pointController,
                      fieldType: FieldType.none,
                      hintText: "Main Gate",
                      label: "Access Point",
                      fieldKey: "access_point",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ReusabelProfileForm(
                controller: _reasonController,
                fieldType: FieldType.reason,
                hintText: "Reason for denying access...",
                label: "Denial Reason",
                fieldKey: "denial_reason",
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              ReusabelProfileForm(
                controller: _notesController,
                fieldType: FieldType.none,
                hintText: "Security notes...",
                label: "Security Notes",
                fieldKey: "security_notes",
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              ValueListenableBuilder<bool>(
                valueListenable: _isFormValid,
                builder: (context, isValid, _) {
                  return ActionSecurityButton(
                    isLoading: isLoading,
                    label: "Deny Entry",
                    onPressed:
                        isValid
                            ? () {
                              ref
                                  .read(formProvider.notifier)
                                  .denyEventEntry(
                                    context: context,
                                    id: widget.eventId,
                                    guestName: _nameController.text,
                                    guestPhone: _phoneController.text,
                                    vehiclePlate: _plateController.text,
                                    guestCount:
                                        int.tryParse(_countController.text) ??
                                        1,
                                    accessPoint: _pointController.text,
                                    securityNotes: _notesController.text,
                                    denialReason: _reasonController.text,
                                    ref: ref,
                                  );
                            }
                            : null,
                  );
                },
              ),
              const SizedBox(height: 10),
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
}
