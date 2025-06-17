

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';

import 'package:curnectgate/features/member_management/screen/bottomSheet/member_Digital_buttomSeet.dart';
import 'package:curnectgate/features/member_management/screen/membership_ID/DigitCodeTab.dart';
import 'package:curnectgate/features/member_management/screen/membership_ID/QRCodeTab.dart';
import 'package:curnectgate/features/member_management/tabState/memberid_provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DigitalCardScreen extends ConsumerWidget {
  const DigitalCardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(tabIndexProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Digital Membership Card',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontFamilies.medium,
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              ref.read(bottomSheetTypeProvider.notifier).state =
                  BottomSheetType.settings;
              ref.read(bottomSheetProvider.notifier).state = true;
              showBottomSheets(context, ref);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab Bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: AnimatedContainer(
                    height: 40,
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color:
                          tabIndex == 0
                              ? AppColors.instance.yellow500
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      onPressed:
                          () => ref.read(tabIndexProvider.notifier).state = 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'QR Code',
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,

                              color:
                                  tabIndex == 0
                                      ? AppColors.instance.black600
                                      : AppColors.instance.black600,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.qr_code,
                            size: 17,
                            color: AppColors.instance.black600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: AnimatedContainer(
                    height: 40,
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color:
                          tabIndex == 1
                              ? AppColors.instance.yellow500
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      onPressed:
                          () => ref.read(tabIndexProvider.notifier).state = 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '5-Digit Code',
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              color:
                                  tabIndex == 1
                                      ? AppColors.instance.black600
                                      : AppColors.instance.black600,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Image.asset(
                            AssetPaths.otpCode,
                            height: 15,
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Tab Content
          Expanded(
            child: IndexedStack(
              index: tabIndex,
              children: const [QRCodeTab(), DigitCodeTab()],
            ),
          ),
        ],
      ),
    );
  }

}
