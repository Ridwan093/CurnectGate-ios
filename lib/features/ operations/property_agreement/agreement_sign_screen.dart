import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/property_agreement/widget/agreement_data.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

class AgreementSignScreen extends ConsumerStatefulWidget {
  const AgreementSignScreen({super.key});

  @override
  ConsumerState<AgreementSignScreen> createState() =>
      _AgreementSignScreenState();
}

class _AgreementSignScreenState extends ConsumerState<AgreementSignScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 6,
    penColor: Colors.black,
    strokeCap: StrokeCap.square,
    strokeJoin: StrokeJoin.bevel,
    exportBackgroundColor: Colors.transparent,
  );
  final ValueNotifier<bool> _canSubmitNotifier = ValueNotifier(false);
  void _validateForm() {
    final hasName = _nameController.text.trim().isNotEmpty;
    final hasSignature = _signatureController.isNotEmpty;

    _canSubmitNotifier.value = hasName && hasSignature;
  }

  Future<File> uint8ListToFile(Uint8List bytes) async {
    final directory = await getTemporaryDirectory();
    final filePath =
        '${directory.path}/signature_${DateTime.now().millisecondsSinceEpoch}.png';

    final file = File(filePath);
    return await file.writeAsBytes(bytes);
  }

  Future<String?> getSignatureBase64() async {
    final bytes = await _signatureController.toPngBytes(
      height: 200,
      width: 200,
    );

    if (bytes == null || bytes.isEmpty) return null;

    return base64Encode(bytes);
  }

  int selectedTab = 0;
  @override
  void initState() {
    super.initState();

    _nameController.addListener(_validateForm);
    _signatureController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _nameController.removeListener(_validateForm);
    _signatureController.removeListener(_validateForm);

    _canSubmitNotifier.dispose();
    _nameController.dispose();
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        ref.watch(formProvider).termsAndCondintionLoading ?? false;
    return Scaffold(
      backgroundColor: AppColors.instance.grey200,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(AssetPaths.terms, height: 70, width: 70),
                    const SizedBox(height: 20),

                    Text(
                      "Take a look at the property agreement below. We value transparency, and always want you to choose the option that’s best for you.",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.medium,
                        fontSize: 15,
                        color: AppColors.instance.black500,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // 📄 Sub Header
                    Text(
                      "Property agreement",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                        fontSize: 18,
                        color: AppColors.instance.black600,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 📜 Agreement Body
                    AgreementData(),

                    const SizedBox(height: 30),

                    Container(
                      height: 70,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.instance.grey300,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          _buildTabButton("Type your\n name", 0),
                          _buildTabButton("Draw your\n signature", 1),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 📋 Tab Content
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child:
                          selectedTab == 0
                              ? _buildTypeNameTab()
                              : _buildDrawSignatureTab(),
                    ),

                    const SizedBox(height: 40),

                    // 🔘 Buttons
                    Column(
                      children: [
                        ValueListenableBuilder<bool>(
                          valueListenable: _canSubmitNotifier,
                          builder: (context, canSubmit, _) {
                            return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed:
                                    canSubmit
                                        ? () async {
                                          final base64Signature =
                                              await getSignatureBase64();

                                          ref
                                              .read(formProvider.notifier)
                                              .signAgreement(
                                                context: context,
                                                signatur: base64Signature ?? "",
                                                fullName:
                                                    _nameController.text.trim(),
                                                ref: ref,
                                              );
                                        }
                                        : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.instance.black600,
                                  foregroundColor: AppColors.instance.grey200,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  "Accept",
                                  style: TextStyle(
                                    fontFamily: FontFamilies.interDisplay,
                                    fontWeight: FontFamilies.medium,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              showUserBottomSheet(
                                context: context,
                                headertitle: "property",
                                headersubtitle: "",
                                ref: ref,
                                bottom: BottomSheetView.termsAndCondition,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.instance.grey200,
                              foregroundColor: AppColors.instance.black600,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Decline",
                              style: TextStyle(
                                fontFamily: FontFamilies.interDisplay,
                                fontWeight: FontFamilies.medium,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isLoading) Positioned.fill(child: _loadingBody()),
        ],
      ),
    );
  }

  Widget _loadingBody() {
    return Container(
      color: AppColors.instance.grey300.withOpacity(.8),
      child: Loadingstates(),
    );
  }

  // Custom Tab Button
  Widget _buildTabButton(String label, int index) {
    final bool isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: AnimatedContainer(
          height: 70,
          // margin: EdgeInsets.all(8.0),
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? AppColors.instance.grey200
                    : AppColors.instance.grey300,
            borderRadius: BorderRadius.circular(10),

            boxShadow:
                isSelected
                    ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ]
                    : [],
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight:
                  isSelected ? FontFamilies.medium : FontFamilies.medium,
              fontSize: 14,
              color:
                  isSelected
                      ? AppColors.instance.black600
                      : AppColors.instance.black400,
            ),
          ),
        ),
      ),
    );
  }

  // Type Name Tab
  Widget _buildTypeNameTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      key: const ValueKey("typeNameTab"),
      children: [
        Text(
          "Type your name",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 14,
            color: AppColors.instance.black600,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _nameController,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.medium,
            fontSize: 15,
            color: AppColors.instance.black600,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: AppColors.instance.black300),
            filled: true,
            fillColor: AppColors.instance.grey300,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.instance.grey200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.instance.black600),
            ),
          ),
        ),
      ],
    );
  }

  // Draw Signature Tab
  Widget _buildDrawSignatureTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      key: const ValueKey("drawSignatureTab"),
      children: [
        Text(
          "Draw your signature",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 14,
            color: AppColors.instance.black600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 70,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: AppColors.instance.black500,

            borderRadius: BorderRadius.circular(12),
          ),
          child: Signature(
            controller: _signatureController,
            backgroundColor: AppColors.instance.grey300,
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              _signatureController.clear();
              _validateForm();
            },
            child: Text(
              "Clear",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.medium,
                fontSize: 14,
                color: AppColors.instance.black400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
