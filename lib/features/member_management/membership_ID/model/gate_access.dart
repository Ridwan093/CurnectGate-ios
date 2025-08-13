import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'gate_access.freezed.dart';
part 'gate_access.g.dart';

@freezed
class GateAccess with _$GateAccess {
  const factory GateAccess({
    required bool enabled,
  }) = _GateAccess;

  factory GateAccess.fromJson(Map<String, dynamic> json) => _$GateAccessFromJson(json);

  factory GateAccess.safeFromJson(Map<String, dynamic>? json) {
    return GateAccess(
      enabled: NullSafetyHelper.safeBool(json?['enabled']),
    );
  }

  factory GateAccess.empty() => const GateAccess(enabled: false);
}
