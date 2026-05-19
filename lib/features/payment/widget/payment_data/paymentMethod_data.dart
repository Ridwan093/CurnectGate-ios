import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/provider/payment_method_provider.dart';
import 'package:curnectgate/features/payment/screen/fund_wallet_page.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/payment_method/payment_method_item.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/payment_method/payment_methods_data.dart';
import 'package:curnectgate/features/payment/state_model/state.dart';
import 'package:curnectgate/features/payment/widget/payment_data/payment_not_available.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/validation_option/widget/featureNotavailableDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentMethodData extends ConsumerWidget {
  final bool isMethodSelected;
  const PaymentMethodData({super.key, required this.isMethodSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashbordProviderAsync = ref.watch(getpaymentMethodProvider);
    return dashbordProviderAsync.when(
      data: (due) {
        try {
          final user = due?.data;
          return user != null
              ? _getList(user, ref, context, isMethodSelected)
              : _buildErrorState(context, ref, "No payment data?");
        } catch (e) {
          return _buildErrorState(context, ref, e.toString());
        }
      },
      loading: () {
        try {
          return _buildLoadingState(context);
        } catch (e) {
          return _buildErrorState(context, ref, e.toString());
        }
      },
      error: (error, stack) {
        try {
          // Handle session expiration
          if (error.toString().contains("Unauthorized")) {
            return _buildErrorState(context, ref, error.toString());
          }

          // Try to show cached data

          return _buildErrorState(context, ref, error.toString());
        } catch (e) {
          return _buildErrorState(context, ref, e.toString());
        }
      },
    );
  }

  /// PRO STYLE LOADING: Shows a disabled "Continue" button with a shimmer-like color
  Widget _buildLoadingState(BuildContext context) {
    return _buildBottonsheet(
      null, // No ref needed for loading
      false, // Disabled
      context,
      PaymentMethodItem.empty().copyWith(name: "Loading..."),
      isLoading: true,
    );
  }

  /// PRO STYLE ERROR: Shows a disabled button with a small retry nudge
  Widget _buildErrorState(BuildContext context, WidgetRef ref, String error) {
    return _buildBottonsheet(
      ref,
      false, // Disabled
      context,
      PaymentMethodItem.empty().copyWith(name: "Error loading"),
      error: error,
    );
  }

  Widget _getList(
    PaymentMethodsData? data,
    WidgetRef ref,
    BuildContext context,
    bool isMethodSelected,
  ) {
    final listData = data?.paymentMethods;
    return SingleChildScrollView(
      child: Column(
        children: [
          ...listData!.map(
            (e) => _buildBottonsheet(ref, isMethodSelected, context, e),
          ),
        ],
      ),
    );
  }

  Widget _buildBottonsheet(
    WidgetRef? ref,
    bool isMethodSelected,
    BuildContext context,
    PaymentMethodItem e, {
    String? error,
    bool isLoading = false,
  }) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap:
                    isMethodSelected && !isLoading && error == null
                        ? () async {
                          final method = ref!.read(paymentMethodProvider);

                          if (method == PaymentMethod.bankTransfer) {
                            log('Selected method: $method');

                            showFuturNotAvailableDialog(context, method.name);
                            // showUserBottomSheet(
                            //   context: context,
                            //   headertitle: "Funding with bank transfer?",
                            //   headersubtitle: "",
                            //   ref: ref,
                            //   bottom: BottomSheetView.fundingWithbankTransfer,
                            // );
                          } else {
                            // final ref =
                            //     'TEST_REF_${DateTime.now().millisecondsSinceEpoch}';
                            // await PaystackService().checkout(
                            //   context: context,
                            //   email: 'testuser@example.com',
                            //   amount: 500, // ₦500
                            //   reference: ref,
                            // );
                            if (e.publicKey!.contains(
                                  "pk_test_sample_public_key_here",
                                ) &&
                                e.secretKey!.contains(
                                  "sk_test_sample_secret_key_here",
                                )) {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder:
                                    (_) => const PaymentNotConfiguredDialog(),
                              );
                            } else {
                              // Navigate to the premium Fund Wallet page
                              // Reset amount state so the page starts fresh
                              ref.read(amountTextProvider.notifier).state = '';
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => FundWalletPage(method: e),
                                ),
                              );
                            }
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
                    child:
                        isLoading
                            ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.instance.black300,
                              ),
                            )
                            : Text(
                              error != null ? "Continue" : "Continue",
                              style: TextStyle(
                                fontFamily: FontFamilies.interDisplay,
                                color:
                                    isMethodSelected && error == null
                                        ? Colors.white
                                        : AppColors.instance.black300,
                                fontSize: 14,
                              ),
                            ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Information Column: Shows next step or Error message if present
            Expanded(
              flex: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (error != null) ...[
                    GestureDetector(
                      onTap:
                          () => ref!
                              .read(getpaymentMethodProvider.notifier)
                              .refreshPaymentmethod(context, ref),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.refresh,
                            size: 14,
                            color: AppColors.instance.error600,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Retry",
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              color: AppColors.instance.error600,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    Text(
                      "Next step:",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black300,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "2:information",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black300,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
