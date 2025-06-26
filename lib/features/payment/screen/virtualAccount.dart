import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/widget/customtoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VirtualAccount extends ConsumerWidget {
  const VirtualAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.instance.black600),
        ),
      ),
      body: _buildbody(size, ref, context),
    );
  }

  Widget _buildbody(Size size, WidgetRef ref, BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 4,
            color: AppColors.instance.grey300,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.instance.teal300,
              child: Center(
                child: Icon(
                  Icons.account_balance,
                  size: 20,
                  color: AppColors.instance.black600,
                ),
              ),
            ),

            SizedBox(height: 20),
            Text(
              "Virtual Account Number",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
            ),
            SizedBox(height: 13),
            _buildNotifyerBox(),
            SizedBox(height: 20),
            _buildPaymentClick(
              context: context,
              title: "Wema Bank",
              subtitle: "00000000000",

              onTap: () {},
              iconPath: '',
            ),
            SizedBox(height: 10),
            _buildPaymentClick(
              context: context,
              title: "Sterlin Bank",
              subtitle: "000000000",
              iconPath: AssetPaths.navCreditCardFilled,

              onTap: () {},
            ),
            SizedBox(height: 10),
            _buildPaymentClick(
              context: context,
              title: "Moniepoint Microfinace Bank",
              subtitle: "000000000",
              iconPath: AssetPaths.navCreditCardFilled,

              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotifyerBox() {
    return Text(
      "Make a naira transfer to this account number and your Curnectgate wallet wiil be funded immedatel",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: FontFamilies.interDisplay,
        fontSize: 12,

        color: AppColors.instance.black300,
      ),
    );
  }

  Widget _buildPaymentClick({
    required String iconPath,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.instance.grey300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          trailing: IconButton(
            icon: Icon(
              Icons.content_copy,
              size: 18,
              color: AppColors.instance.teal300,
            ),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: title));

              showCustomSuccessToast(
                context: context,
                message: "Copied",
                color: AppColors.instance.teal300,
                icon: Icons.check_circle,
                iconColors: AppColors.instance.black600,
                positionNumber: 40,
              );
            },
          ),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
              fontSize: 10,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
