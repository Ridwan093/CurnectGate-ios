import 'dart:convert';
import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

class GetYourCodeScreen extends ConsumerStatefulWidget {
  final String? accessCode;
  final String? title;
  final String? share;
  const GetYourCodeScreen({
    super.key,
    this.title = "",
    this.accessCode = "",
    this.share = "",
  });

  @override
  ConsumerState<GetYourCodeScreen> createState() =>
      _WorkRequestVendorCodeState();
}

List<String> extractWorkerAccessCodes(Map<String, dynamic> json) {
  try {
    final workers = json['workers'] as List;
    return workers
        .whereType<Map<String, dynamic>>()
        .map((worker) => worker['access_code'] as String? ?? '')
        .where((code) => code.isNotEmpty)
        .toList();
  } catch (e) {
    return [];
  }
}

String extractVendorAccessCode(Map<String, dynamic> json) {
  try {
    return json['vendor_access_code'] as String? ?? '';
  } catch (e) {
    return '';
  }
}

class _WorkRequestVendorCodeState extends ConsumerState<GetYourCodeScreen> {
  bool isCopied = false;

  @override
  Widget build(BuildContext context) {
    List<String> accessCodes = [];
    String vendorCode = "";
    if (widget.title!.toLowerCase().contains("your visitor access code")) {
    } else {
      final Map<String, dynamic> extractedData = jsonDecode(
        widget.title ??
            ""
                "",
      );
      accessCodes = extractWorkerAccessCodes(extractedData);
      vendorCode = extractVendorAccessCode(extractedData);
    }

    // final accessCodes = extractWorkerAccessCodes(extractedData);
    // final vendorCode = extractVendorAccessCode(extractedData);
    return Scaffold(
      bottomNavigationBar: SafeArea(
        top: false,
        child: ActionButton(
          label: "Got it",
          onPressed: () {
            // if (widget.title!.contains("Your visitor access code")) {
            //   Navigator.pop(context);
            //   // Navigator.push(
            //   //   context,
            //   //   MaterialPageRoute(
            //   //     builder:
            //   //         (context) => MainNavigationScreen(mainPage: VendorLog()),
            //   //   ),
            //   // );
            // } else {
            //   log(widget.title.toString());
            // }

            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.title!.contains("Your visitor access code")) ...[
              _buildSuccessContainer(),
            ] else ...[
              ///DESINGE THIS TO MEET THE OHTER CODE SUB WORKERS CODE
              _buildSuccessContainerEvendor(
                title: "Your vendor access code:",
                subCodes: accessCodes,
                mainCode: vendorCode,
              ),
            ],
          ],
        ),
      ),
    );
  }

  // Widget _buildSuccessContainerEvendor() {
  //   return Column(
  //     children: [
  //       const SizedBox(height: 100),
  //       Container(
  //         height: 75,
  //         width: 75,
  //         decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //           border: Border.all(
  //             width: 1.5,
  //             style: BorderStyle.solid,
  //             color: AppColors.instance.teal500,
  //           ),
  //         ),
  //         child: Center(
  //           child: Icon(
  //             Icons.check_circle,
  //             size: 60,
  //             color: AppColors.instance.teal500,
  //           ),
  //         ),
  //       ),
  //       const SizedBox(height: 25),
  //       Text(
  //         widget.title!,
  //         textAlign: TextAlign.center,
  //         style: TextStyle(
  //           fontFamily: FontFamilies.interDisplay,
  //           color: AppColors.instance.black600,
  //           fontWeight: FontFamilies.bold,
  //           fontSize: 20,
  //         ),
  //       ),
  //       const SizedBox(height: 10),
  //       Text(
  //         widget.accessCode!,
  //         textAlign: TextAlign.center,
  //         style: TextStyle(
  //           fontFamily: FontFamilies.interDisplay,
  //           color: AppColors.instance.black600,
  //           fontWeight: FontFamilies.bold,
  //           fontSize: 35,
  //         ),
  //       ),
  //       const SizedBox(height: 20),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           _buildCopyButton(),
  //           const SizedBox(width: 30),
  //           _buildShareButton(),
  //         ],
  //       ),
  //     ],
  //   );
  // }
  Widget _buildSuccessContainerEvendor({
    required String title,
    required String mainCode,
    List<String>? subCodes, // 👈 Multiple sub worker codes
  }) {
    final hasSubCodes = subCodes != null && subCodes.isNotEmpty;

    return SingleChildScrollView(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          const SizedBox(height: 100),

          // ✅ Success Circle
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1.5,
                style: BorderStyle.solid,
                color: AppColors.instance.teal500,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.check_circle,
                size: 60,
                color: AppColors.instance.teal500,
              ),
            ),
          ),

          const SizedBox(height: 25),

          // ✅ Title
          const SizedBox(height: 25),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            mainCode,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
              fontSize: 35,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCopyButton(mainCode),
              const SizedBox(width: 30),
              _buildShareButtons(mainCode, "Here is your vendor code:"),
            ],
          ),
          if (hasSubCodes) ...[
            const SizedBox(height: 30),

            // Divider or heading
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "Sub Worker Codes:",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 14,
                      color: AppColors.instance.black600,
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    _shareAllCodes(subCodes);
                  },
                  child: Text(
                    "Share all",

                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 12,
                      color: AppColors.instance.black600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // ✅ Display all sub-codes
            Container(
              padding: EdgeInsets.all(12),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: AppColors.instance.grey300,

                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.spaceAround,
                children:
                    subCodes.map((code) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.instance.teal300),
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.instance.grey300,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              code,
                              style: TextStyle(
                                fontFamily: FontFamilies.interDisplay,
                                color: AppColors.instance.black600,
                                fontWeight: FontFamilies.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () => _copyToClipboard(code),
                              child: Icon(
                                Icons.copy,
                                size: 16,
                                color: AppColors.instance.teal400,
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () => _shareCode(code),
                              child: Icon(
                                Icons.share,
                                size: 16,
                                color: AppColors.instance.teal400,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSuccessContainer() {
    return Column(
      children: [
        const SizedBox(height: 100),
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.5,
              style: BorderStyle.solid,
              color: AppColors.instance.teal500,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.check_circle,
              size: 60,
              color: AppColors.instance.teal500,
            ),
          ),
        ),
        const SizedBox(height: 25),
        Text(
          widget.title!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
            fontWeight: FontFamilies.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.accessCode!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
            fontWeight: FontFamilies.bold,
            fontSize: 35,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCopyButton(widget.accessCode!),
            const SizedBox(width: 30),
            _buildShareButtons(widget.accessCode ?? "", widget.share ?? ""),
          ],
        ),
      ],
    );
  }

  void _copyToClipboard(String code) {
    Clipboard.setData(ClipboardData(text: code));
    showCustomSuccessToast(
      positionNumber: 50,
      context: context,
      message: "Copied",
      color: AppColors.instance.teal300,
      icon: Icons.check_circle,
      iconColors: AppColors.instance.black600,
    );
    // You can show a snackbar if you like
  }

  void _shareAllCodes(List<String> codes) {
    if (codes.isEmpty) return;

    final message = 'Here is your work codes:\n${codes.join('\n')}';
    // ignore: deprecated_member_use
    Share.share(message);
  }

  void _shareCode(String code) {
    // Use Share.share(code) if you have `share_plus` package
    // ignore: deprecated_member_use
    Share.share("Here is your work code: ${code}");
  }

  Widget _buildCopyButton(String code) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Clipboard.setData(ClipboardData(text: code));
            setState(() {
              isCopied = true;
            });

            showCustomSuccessToast(
              positionNumber: 50,
              context: context,
              message: "Copied",
              color: AppColors.instance.teal300,
              icon: Icons.check_circle,
              iconColors: AppColors.instance.black600,
            );
            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) {
                setState(() {
                  isCopied = false;
                });
              }
            });
          },
          borderRadius: BorderRadius.circular(25),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.instance.grey300,
            ),
            child: Center(
              child: Icon(
                isCopied ? Icons.check : Icons.copy,
                color: AppColors.instance.black500,
                size: 24,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Copy",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
          ),
        ),
      ],
    );
  }

  Widget _buildShareButtons(String code, String share) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // ignore: deprecated_member_use
            log(share + code);
            Share.share("$share $code");
          },
          borderRadius: BorderRadius.circular(25),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.instance.grey300,
            ),
            child: Center(
              child: Image.asset(
                AssetPaths.share,
                height: 24,
                width: 24,
                color: AppColors.instance.black500,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Share",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
          ),
        ),
      ],
    );
  }
}
