// tab_state.dart
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/features/payment/state_model/state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: constant_identifier_names
enum WalletTab { All, Due, Deposit }

final tabProvider = StateProvider<WalletTab>((ref) => WalletTab.All);

enum PaymentMethod { bankTransfer, debitCard, none }

final paymentMethodProvider = StateProvider<PaymentMethod>(
  (ref) => PaymentMethod.none,
);

final duePaymentsProvider =
    StateNotifierProvider<DuePaymentsNotifier, List<DuePaymentModel>>((ref) {
      return DuePaymentsNotifier();
    });

class DuePaymentsNotifier extends StateNotifier<List<DuePaymentModel>> {
  DuePaymentsNotifier()
    : super([
        DuePaymentModel(
          id: '1',
          title: 'Water bill',
          amount: '₦32,587',
          subtitle: 'May 2 2025',
          iconPath: AssetPaths.waterDrop,
        ),
        DuePaymentModel(
          id: '2',
          title: 'Service Fee',
          amount: '₦10,000',
          subtitle: 'April 2, 2024',
          iconPath: AssetPaths.serviceFee,
        ),
        DuePaymentModel(
          id: '3',
          title: 'Maintenance Fee',
          amount: '₦10,000',
          subtitle: 'April 2, 2024',
          iconPath: AssetPaths.maintenance,
        ),
        DuePaymentModel(
          id: '4',
          title: 'Light Fee',
          amount: '₦32,587',
          subtitle: 'April 2, 2024',
          iconPath: AssetPaths.navCreditCardFilled,
        ),
      ]);

  void togglePayment(String id) {
    state =
        state.map((payment) {
          if (payment.id == id) {
            return payment.copyWith(isSelected: !payment.isSelected);
          }
          return payment;
        }).toList();
  }
}

extension DuePaymentExtension on DuePaymentModel {
  DuePaymentModel copyWith({bool? isSelected}) {
    return DuePaymentModel(
      id: id,
      title: title,
      amount: amount,
      subtitle: subtitle,
      iconPath: iconPath,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
