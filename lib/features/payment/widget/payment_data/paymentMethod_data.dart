import 'dart:developer';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/payment/provider/payment_method_provider.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/payment_method/payment_method_item.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/payment_method/payment_methods_data.dart';
import 'package:curnectgate/features/payment/state_model/state.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/validation_option/widget/featureNotavailableDialog.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentMethodData extends ConsumerWidget {
  final bool isMethodSelected;
  const PaymentMethodData({super.key, required this.isMethodSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashbordProviderAsync = ref.watch(getpaymentMethodProvider);
    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(getpaymentMethodProvider.notifier)
              .refreshPaymentmethod(context, ref),
      child: dashbordProviderAsync.when(
        data: (due) {
          try {
            final user = due?.data;
            return user != null
                ? _getList(user, ref, context, isMethodSelected)
                : EmptyBodys(message: "No payment data?");
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(getpaymentMethodProvider.notifier)
                      .refreshPaymentmethod(context, ref),
              firstMessae: "Faile to load payment method?",
            );
          }
        },
        loading: () {
          try {
            final cachedProfile = ref.read(getpaymentMethodProvider).value;
            return cachedProfile != null
                ? _getList(cachedProfile.data, ref, context, isMethodSelected)
                : Loadingstates();
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(getpaymentMethodProvider.notifier)
                      .refreshPaymentmethod(context, ref),
              firstMessae: "Faile to load payment method?",
            );
          }
        },
        error: (error, stack) {
          try {
            // Handle session expiration
            if (error.toString().contains("Unauthorized")) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref.read(authProvider.notifier).sessionExpire(context, ref);
              });
              return Expiresessionbody();
            }

            // Try to show cached data
            final cachedProfile = ref.read(getpaymentMethodProvider).value;
            if (cachedProfile?.data != null) {
              return _getList(
                cachedProfile?.data,
                ref,
                context,
                isMethodSelected,
              );
            }

            // No cached data available
            return Builderroul(
              error: error.toString(),
              onTap:
                  () => ref
                      .read(getpaymentMethodProvider.notifier)
                      .refreshPaymentmethod(context, ref),
              firstMessae: "Faile to payment method?",
            );
          } catch (e) {
            return Builderroul(
              error: e.toString(),
              onTap:
                  () => ref
                      .read(getpaymentMethodProvider.notifier)
                      .refreshPaymentmethod(context, ref),
              firstMessae: "Faile to load method?",
            );
          }
        },
      ),
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
    WidgetRef ref,
    bool isMethodSelected,
    BuildContext context,

    PaymentMethodItem e,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap:
                  isMethodSelected
                      ? () async {
                        // Navigate to next screen
                        final method = ref.read(paymentMethodProvider);

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

                          showUserBottomSheet(
                            context: context,
                            headertitle: e.secretKey ?? "",
                            headersubtitle: e.publicKey ?? "",
                            ref: ref,
                            bottom: BottomSheetView.fundingAmount,
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
}
