import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/state_model/state.dart';
import 'package:curnectgate/features/payment/widget/payment_data/paymentMethod_data.dart';
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
        height: 90,
        child: PaymentMethodData(
          isMethodSelected: selectedMethod != PaymentMethod.none,
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
            SizedBox(height: 10),
            //
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
            // PaystackCardPayment(),
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

  // Widget _buildPaymentClick({
  //   required String iconPath,
  //   required String title,
  //   required bool isSelected,
  //   required String subtitle,
  //   required VoidCallback onTap,
  // }) {
  //   return InkWell(
  //     onTap: onTap,
  //     child: Container(
  //       height: 70,

  //       decoration: BoxDecoration(
  //         color: AppColors.instance.grey300,
  //         border:
  //             isSelected
  //                 ? Border.all(color: AppColors.instance.black500, width: 2)
  //                 : null,
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: ListTile(
  //         leading: CircleAvatar(
  //           backgroundColor: AppColors.instance.teal300,
  //           child: Center(
  //             child:
  //                 iconPath.isEmpty
  //                     ? Icon(
  //                       Icons.account_balance,
  //                       size: 15,
  //                       color: AppColors.instance.black600,
  //                     )
  //                     : Image.asset(iconPath, width: 15),
  //           ),
  //         ),
  //         title: Text(
  //           title,
  //           style: TextStyle(
  //             fontFamily: FontFamilies.interDisplay,
  //             fontWeight: FontFamilies.bold,
  //             color: AppColors.instance.black600,
  //             fontSize: 14,
  //           ),
  //         ),
  //         subtitle: Text(
  //           subtitle,
  //           style: TextStyle(
  //             fontFamily: FontFamilies.interDisplay,
  //             fontWeight: FontFamilies.light,
  //             color: AppColors.instance.black300,
  //             fontSize: 12,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildPaymentClick({
    required String iconPath,
    required String title,
    required bool isSelected,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        // Remove fixed height — let it adapt
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.instance.grey300,
          border:
              isSelected
                  ? Border.all(color: AppColors.instance.black500, width: 2)
                  : Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(12),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: AppColors.instance.black500.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                  : null,
        ),
        child: Row(
          children: [
            // Icon
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.instance.teal300,
              child:
                  iconPath.isEmpty
                      ? Icon(
                        Icons.account_balance,
                        size: 20,
                        color: AppColors.instance.black600,
                      )
                      : Image.asset(iconPath, width: 24, height: 24),
            ),

            const SizedBox(width: 16),

            // Text content — takes remaining space safely
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontWeight.bold,
                      color: AppColors.instance.black600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontWeight.w500,
                      color: AppColors.instance.black400,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            // Optional: arrow or indicator if needed
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColors.instance.teal400,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
