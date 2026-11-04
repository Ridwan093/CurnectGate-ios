import 'package:curnectgate/features/operations/OTP_Activation/model/Work_permit/clearance_permit_data.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/Work_permit/permit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final permitSearchProvider =
    StateNotifierProvider<PermitSearchNotifier, String>((ref) {
      return PermitSearchNotifier();
    });

class PermitSearchNotifier extends StateNotifier<String> {
  PermitSearchNotifier() : super('');

  void updateQuery(String value) {
    state = value.trim().toLowerCase();
  }

  void clear() => state = '';
}

final filteredPermitProvider =
    Provider.family<List<Permit>, ClearancePermitData>((ref, data) {
      final query = ref.watch(permitSearchProvider);

      final list = data.permits ?? [];

      if (query.isEmpty) return list;

      return list.where((item) {
        final name = (item.guestName ?? '').toLowerCase();
        final phone = (item.guestPhoneNumber ?? '').toLowerCase();
        final code = (item.visitorOtp?.otpCode ?? '').toLowerCase();

        return name.contains(query) ||
            phone.contains(query) ||
            code.contains(query);
      }).toList();
    });
