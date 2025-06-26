import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/screen/selected_paymentReview.dart';
import 'package:curnectgate/features/payment/state_model/state.dart';
import 'package:curnectgate/features/payment/state_model/state_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DuePaymentSelection extends ConsumerWidget {
  const DuePaymentSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final duePayments = ref.watch(duePaymentsProvider);
    final hasSelection = duePayments.any((payment) => payment.isSelected);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: _buildBottonsheet(ref, context, hasSelection),
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
    BuildContext context,
    bool hasSelection,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap:
                  hasSelection
                      ? () {
                        final selectedPayments =
                            ref
                                .read(duePaymentsProvider)
                                .where((p) => p.isSelected)
                                .toList();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => SelectedReview(
                                  selectedPayments: selectedPayments,
                                ),
                          ),
                        );
                      }
                      : null,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color:
                      hasSelection
                          ? AppColors.instance.black600
                          : AppColors.instance.grey400,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: Colors.white,

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
                "2:Review",
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
    final duePayments = ref.watch(duePaymentsProvider);
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
              "Select Due to Payment",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
            ),
            SizedBox(height: 13),
            _buildNotifyerBox(),
            ...duePayments.map(
              (payment) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _buildPaymentItem(payment, ref),
              ),
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
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Wallet",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  wordSpacing: 2,
                  color: AppColors.instance.black600,
                ),
              ),
              Text(
                "₦97,989",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  wordSpacing: 2,
                  color: AppColors.instance.black300,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                style: BorderStyle.solid,
                color: AppColors.instance.grey300,
              ),
            ),

            child: Icon(
              Icons.arrow_forward,
              color: AppColors.instance.black600,
              size: 12,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Your Total due",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  wordSpacing: 2,
                  color: AppColors.instance.black600,
                ),
              ),
              Text(
                "₦85,174",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  wordSpacing: 2,
                  color: AppColors.instance.black300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentItem(DuePaymentModel payment, WidgetRef ref) {
    return InkWell(
      onTap:
          () =>
              ref.read(duePaymentsProvider.notifier).togglePayment(payment.id),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.instance.grey300,
          borderRadius: BorderRadius.circular(10),
          border:
              payment.isSelected
                  ? Border.all(color: AppColors.instance.black600, width: 2)
                  : null,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.instance.teal300,

            child: Center(child: Image.asset(payment.iconPath, width: 15)),
          ),
          title: Text(
            payment.title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
              fontSize: 14,
            ),
          ),
          trailing:
              payment.isSelected
                  ? Icon(
                    Icons.radio_button_checked,

                    color: AppColors.instance.black600,
                    size: 20,
                  )
                  : Icon(
                    Icons.radio_button_unchecked,
                    color: AppColors.instance.black300,
                    size: 20,
                  ),
          subtitle: Text(
            payment.subtitle,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.light,
              color: AppColors.instance.black400,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}
