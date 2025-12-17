import 'dart:developer';

import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/services/paystack_service.dart';
import 'package:curnectgate/features/payment/state_model/state.dart';
import 'package:curnectgate/features/payment/widget/buttom_sheet_widget/amout_fommat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FundWalletBottomSheet extends ConsumerStatefulWidget {
  final String private;
  final String puplic;
  FundWalletBottomSheet({
    super.key,
    required this.private,
    required this.puplic,
  });

  @override
  ConsumerState<FundWalletBottomSheet> createState() =>
      _FundWalletBottomSheetState();
}

class _FundWalletBottomSheetState extends ConsumerState<FundWalletBottomSheet> {
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  String generatePaymentRef(String estateName) {
    // 1️⃣ Short form of estate name (3–4 characters)
    final shortEstate =
        estateName
            .replaceAll(
              RegExp(r'[^A-Za-z0-9]'),
              '',
            ) // remove spaces & special chars
            .substring(0, estateName.length > 3 ? 3 : estateName.length)
            .toUpperCase();

    // 2️⃣ Create a short random code using timestamp base36

    final now = DateTime.now();
    final formatted =
        "${now.year}"
        "${now.month.toString().padLeft(2, '0')}"
        "${now.day.toString().padLeft(2, '0')}"
        "${now.hour.toString().padLeft(2, '0')}"
        "${now.minute.toString().padLeft(2, '0')}"
        "${now.second.toString().padLeft(2, '0')}"
        "${now.millisecond.toString().padLeft(3, '0')}"
        "${now.microsecond.toString().padLeft(6, '0')}";
    // final shortStamp = timestamp.toRadixString(36).toUpperCase();

    // 3️⃣ Build ref format: MAG-PAY-AB12C
    return "$shortEstate-PAY-$formatted";
  }

  // @override
  @override
  Widget build(BuildContext context) {
    bool isValidAmount = ref.watch(isAmountValidProvider);
    final authState = ref.watch(authProvider);
    final AppColors colors = AppColors.instance;
    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Info + Close
          Row(
            children: [
              const Text(
                "Fund Wallet",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, size: 24),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Text(
            "Enter the amount you want to add to your wallet",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 14,
              color: AppColors.instance.black300,
            ),
          ),
          const SizedBox(height: 20),

          // Amount Input
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyInputFormatter(),
            ],
            decoration: InputDecoration(
              labelText: "Amount",
              prefixText: amountController.text.isNotEmpty ? "₦ " : null,
              hintText: "Minimum ₦1,000",

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.black400),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.black400),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.error600),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.error600),
              ),
              hintStyle: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: colors.black300,
                fontSize: 13,
              ),
              labelStyle: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: colors.black300,
                fontSize: 13,
              ),

              errorStyle: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: colors.error600,
                fontSize: 12,
              ),
            ),
            onChanged: (value) {
              // Remove commas, store in provider
              String cleaned = value.replaceAll(',', '');
              ref.read(amountTextProvider.notifier).state = cleaned;

              // Optional: add commas while typing
              // String formatted = NumberFormat(
              //   '#,##0',
              // ).format(double.tryParse(cleaned) ?? 0);
              // amountController.value = amountController.value.copyWith(
              //   text: formatted,
              //   selection: TextSelection.collapsed(offset: formatted.length),
              // );
            },
          ),
          const SizedBox(height: 25),

          // Action button
          SizedBox(
            width: double.infinity,
            child: InkWell(
              onTap:
                  isValidAmount
                      ? () async {
                        // Continue to Paystack screen

                        // final amout = amountController.text.trim().toString();

                        String cleaned = amountController.text.replaceAll(
                          ',',
                          '',
                        );
                        log("Proceed with ₦${cleaned}");

                        final user = authState.user;

                        final estateName = user?['estate_name'] ?? "";

                        final refs = generatePaymentRef(estateName);

                        log(refs);

                        // context.pop();

                        await PaystackService().checkout(
                          ref: ref,
                          method: "card",
                          privateKey: widget.private,
                          publiceKey: widget.puplic,
                          context: context,
                          email: 'testuser@example.com',
                          amount: double.parse(cleaned), // ₦500
                          reference: refs,
                        );
                        // context.pop();
                      }
                      : null,
              child: Container(
                // width: size.width,
                height: 50,
                decoration: BoxDecoration(
                  color:
                      isValidAmount
                          ? AppColors
                              .instance
                              .black600 // Active
                          : AppColors.instance.grey400, // Disabled
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
