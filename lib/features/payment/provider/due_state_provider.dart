




// ================== STATE MANAGEMENT ==================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state_model/payment_model/due_model/outstanding_due.dart';
import 'due_payment_provider.dart';

final billsProvider = Provider<List<OutstandingDue>>((ref) {
  return ref.watch(paymentDueProvider).value?.data?.dues ?? [];
});

final selectedBillsProvider =
    StateNotifierProvider<SelectedBillsNotifier, Map<int, double>>((ref) {
      final response = ref.watch(paymentDueProvider).value;
      final data = response?.data;
      final minimum = response?.minimumPayableAmount ??
          data?.minimumPayableAmount ??
          data?.summary?.minimumPayableAmount;
      return SelectedBillsNotifier(
        minimumAmount: double.tryParse(minimum ?? '0') ?? 0,
      );
    });

class SelectedBillsNotifier extends StateNotifier<Map<int, double>> {
  final double minimumAmount;
  SelectedBillsNotifier({this.minimumAmount = 0}) : super({});

  void toggleBill(
    int id,
    double amount, {
    bool forceValue = false,
    bool targetValue = false,
  }) {
    if (forceValue) {
      if (targetValue) {
        state = {...state, id: amount};
      } else {
        state = {...state}..remove(id);
      }
      return;
    }

    if (state.containsKey(id)) {
      state = {...state}..remove(id);
    } else {
      state = {...state, id: amount};
    }
  }

  void updateAmount(int id, double amount) {
    if (state.containsKey(id)) {
      // Enforce minimum if minimumAmount > 0
      final finalAmount =
          (minimumAmount > 0 && amount < minimumAmount) ? minimumAmount : amount;
      state = {...state, id: finalAmount};
    }
  }

  void selectAll(List<OutstandingDue> bills) {
    final newState = <int, double>{};
    for (var bill in bills) {
      if (bill.id != null) {
        final totalAmount = double.tryParse(bill.amount ?? '0') ?? 0;
        newState[bill.id!] = totalAmount;
      }
    }
    state = newState;
  }

  void clearSelection() {
    state = {};
  }
}
