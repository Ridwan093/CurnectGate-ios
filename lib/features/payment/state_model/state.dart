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
final amountTextProvider = StateProvider<String>((ref) => '');

/// Computed provider to check if amount is valid (>= 1000)
final isAmountValidProvider = Provider<bool>((ref) {
  final text = ref.watch(amountTextProvider);
  final amount = double.tryParse(text.replaceAll(',', '')) ?? 0.0;
  return amount >= 1000;
});
final selectedDueIdsProvider =
    StateNotifierProvider<SelectedDueIdsNotifier, List<int>>((ref) {
  return SelectedDueIdsNotifier();
});

class SelectedDueIdsNotifier extends StateNotifier<List<int>> {
  SelectedDueIdsNotifier() : super([]);

  void toggleSelection(int id) {
    if (state.contains(id)) {
      state = List.from(state)..remove(id);
    } else {
      state = List.from(state)..add(id);
    }
  }

  bool isSelected(int id) => state.contains(id);
}
