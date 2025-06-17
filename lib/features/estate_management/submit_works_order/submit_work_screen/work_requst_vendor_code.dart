import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_screen/vendor_log.dart';
import 'package:curnectgate/features/member_management/screen/main_navigation_screen.dart';
import 'package:curnectgate/features/member_management/widget/customtoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class WorkRequestVendorCode extends ConsumerStatefulWidget {
  const WorkRequestVendorCode({super.key});

  @override
  ConsumerState<WorkRequestVendorCode> createState() =>
      _WorkRequestVendorCodeState();
}

class _WorkRequestVendorCodeState extends ConsumerState<WorkRequestVendorCode> {
  bool isCopied = false;
  final String accessCode = "3456GAT";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSuccessContainer(),
            ActionButton(
              label: "Got it",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            MainNavigationScreen(mainPage: VendorLog()),
                  ),
                );
              },
            ),
          ],
        ),
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
          "Your vendor access code:",
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
          accessCode,
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
            _buildShareButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildCopyButton() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Clipboard.setData(ClipboardData(text: accessCode));
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

  Widget _buildShareButton() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Share.share("Here's my vendor access code: $accessCode");
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
