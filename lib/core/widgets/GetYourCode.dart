import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_screen/vendor_log.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/member_management/screen/main_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class GetYourCodeScreen extends ConsumerStatefulWidget {
  final String? accessCode;
  final String? title;
  final String? share;
  const GetYourCodeScreen({
    super.key,
    this.title = "Your vendor access code:",
    this.accessCode = "3456GAT",
    this.share = "Here's m vendor access code: ",
  });

  @override
  ConsumerState<GetYourCodeScreen> createState() =>
      _WorkRequestVendorCodeState();
}

class _WorkRequestVendorCodeState extends ConsumerState<GetYourCodeScreen> {
  bool isCopied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.title == "Your vendor access code:") ...[
              _buildSuccessContainer(),
            ] else ...[
              ///DESINGE THIS TO MEET THE OHTER CODE SUB WORKERS CODE
              _buildSuccessContainerEvendor(
                title: "",
                subCodes: [],
                mainCode: "",
              ),
            ],

            ActionButton(
              label: "Got it",
              onPressed: () {
                if (widget.title == "Your vendor access code:") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              MainNavigationScreen(mainPage: VendorLog()),
                    ),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
            ),
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

          // ✅ Main Access Code
          Text(
            mainCode,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.teal500,
              fontWeight: FontFamilies.bold,
              fontSize: 35,
            ),
          ),

          const SizedBox(height: 20),

          // ✅ Copy & Share Row for main code
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCopyButtons(""),
              const SizedBox(width: 30),
              _buildShareButton(""),
            ],
          ),

          if (hasSubCodes) ...[
            const SizedBox(height: 30),

            // Divider or heading
            Text(
              "Sub Worker Codes",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.medium,
                fontSize: 16,
                color: AppColors.instance.black500,
              ),
            ),
            const SizedBox(height: 10),

            // ✅ Display all sub-codes
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
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
                        color: AppColors.instance.teal500,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            code,
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              color: AppColors.instance.teal500,
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
            _buildCopyButton(),
            const SizedBox(width: 30),
            _buildShareButton(""),
          ],
        ),
      ],
    );
  }

  Widget _buildCopyButtons(String code) {
    return IconButton(
      onPressed: () => _copyToClipboard(code),
      icon: const Icon(Icons.copy),
      color: AppColors.instance.teal400,
    );
  }

  Widget _buildShareButton(String code) {
    return IconButton(
      onPressed: () => _shareCode(code),
      icon: const Icon(Icons.share),
      color: AppColors.instance.teal400,
    );
  }

  void _copyToClipboard(String code) {
    Clipboard.setData(ClipboardData(text: code));
    // You can show a snackbar if you like
  }

  void _shareCode(String code) {
    // Use Share.share(code) if you have `share_plus` package
  }

  Widget _buildCopyButton() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Clipboard.setData(ClipboardData(text: widget.accessCode!));
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

  Widget _buildShareButtons() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Share.share("${widget.share} ${widget.accessCode}");
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
