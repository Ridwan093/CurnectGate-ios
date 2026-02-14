import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';


part 'gateaccess.freezed.dart';
part 'gateaccess.g.dart';

// Simple nested models
@freezed
class GateAccess with _$GateAccess {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory GateAccess({bool? enabled}) = _GateAccess;

  factory GateAccess.fromJson(Map<String, dynamic> json) =>
      _$GateAccessFromJson(json);

  factory GateAccess.fromSafeJson(Map<String, dynamic> json) {
    return GateAccess(enabled: NullSafetyHelper.safeBool(json['enabled']));
  }

  factory GateAccess.empty() => const GateAccess(enabled: null);
}