import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/tabState/memberid_provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DigitCodeTab extends ConsumerWidget {
  const DigitCodeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCode = ref.watch(accessCodeProvider);
    final isActive = ref.watch(cardStatusProvider);
    final size = MediaQuery.sizeOf(context);

    return Container(
      height: size.height,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 40),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // QR Code Placeholder (replace with actual QR widget)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_filled,
                      size: 20,
                      color: AppColors.instance.teal300,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Greenville.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontFamilies.bold,
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'ENTRY CODE',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontFamilies.bold,

                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black300,
                  ),
                ),
                SizedBox(height: 10),
                // Copyable Code Section
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: currentCode));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Code copied to clipboard'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 15,),
                      Text(
                        currentCode,
                        style:  TextStyle(
                          fontSize: 30,
                          fontWeight: FontFamilies.medium,

                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(width: 10),
                       Image.asset(AssetPaths.clipboard,height: 20,width: 20,)
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Priority Pass Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[400])),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.instance.grey300,
                      ),

                      child: Center(
                        child: Text(
                          'PRIORITY PASS',
                          style: TextStyle(
                            color: AppColors.instance.black300,
                            fontWeight: FontFamilies.bold,
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 10,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey[400])),
                  ],
                ),

                const SizedBox(height: 30),

                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontFamilies.bold,

                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black300,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'MR. JOHN BENJAMIN',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontFamilies.bold,

                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                  ),
                ),

                const SizedBox(height: 15),
                Text(
                  'Type',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontFamilies.bold,

                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black300,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Co-Owner',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontFamilies.bold,

                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 20),

                // Status Indicator
                Text(
                  'Status',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontFamilies.bold,

                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black300,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                       isActive? 'ACTIVE': "INACTIVE",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontFamilies.bold,

                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black600,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(width: 5),
                    CircleAvatar(
                      radius: 3,
                      backgroundColor:
                          isActive
                              ? AppColors.instance.teal500
                              : AppColors.instance.grey500,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
