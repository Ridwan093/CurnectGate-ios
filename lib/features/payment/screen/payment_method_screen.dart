import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/payment/state_model/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentMethodScreen extends ConsumerWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final selectedMethod = ref.watch(paymentMethodProvider);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: _buildBottonsheet(
          ref,
          selectedMethod != PaymentMethod.none,
          context,
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.instance.black600),
        ),
      ),
      body: _buildbody(size, ref),
    );
  }

  Widget _buildBottonsheet(
    WidgetRef ref,
    bool isMethodSelected,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap:
                  isMethodSelected
                      ? () {
                        // Navigate to next screen
                        final method = ref.read(paymentMethodProvider);

                        if (method == PaymentMethod.bankTransfer) {
                          log('Selected method: $method');
                          showUserBottomSheet(
                            context: context,
                            headertitle: "Funding with bank transfer?",
                            headersubtitle: "",
                            ref: ref,
                            bottom: BottomSheetView.fundingWithbankTransfer,
                          );
                        }
                        // Navigator.push(...);
                      }
                      : null,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color:
                      isMethodSelected
                          ? AppColors.instance.black600
                          : AppColors.instance.grey400,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color:
                          isMethodSelected
                              ? Colors.white
                              : AppColors.instance.black300,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Next step:",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "2:information",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildbody(Size size, WidgetRef ref) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select a transfer method",
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
              title: "Bank Transfer",
              subtitle: "Transfer to your virtual account number",
              iconPath: '',
              isSelected:
                  ref.watch(paymentMethodProvider) ==
                  PaymentMethod.bankTransfer,
              onTap: () {
                ref.read(paymentMethodProvider.notifier).state =
                    PaymentMethod.bankTransfer;
              },
            ),
            SizedBox(height: 10),
            _buildPaymentClick(
              title: "Debit/Credit card",
              subtitle: "Fund with cards in your currency",
              iconPath: AssetPaths.navCreditCardFilled,
              isSelected:
                  ref.watch(paymentMethodProvider) == PaymentMethod.debitCard,
              onTap: () {
                ref.read(paymentMethodProvider.notifier).state =
                    PaymentMethod.debitCard;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotifyerBox() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: AppColors.instance.grey300,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.error_outline, color: AppColors.instance.black300),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              "Upon completion of your profile setup, we have created a vitual account number just for you, select either by bank transfer or debit / credit card",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 12,
                wordSpacing: 2,
                color: AppColors.instance.black300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentClick({
    required String iconPath,
    required String title,
    required bool isSelected,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,

        decoration: BoxDecoration(
          color: AppColors.instance.grey300,
          border:
              isSelected
                  ? Border.all(color: AppColors.instance.black500, width: 2)
                  : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.instance.teal300,
            child: Center(
              child:
                  iconPath.isEmpty
                      ? Icon(
                        Icons.account_balance,
                        size: 15,
                        color: AppColors.instance.black600,
                      )
                      : Image.asset(iconPath, width: 15),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.light,
              color: AppColors.instance.black300,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
