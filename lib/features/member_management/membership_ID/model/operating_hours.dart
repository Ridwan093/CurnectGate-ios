import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'operating_hours.freezed.dart';
part 'operating_hours.g.dart';

@freezed
class OperatingHours with _$OperatingHours {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory OperatingHours({
    @JsonKey(name: 'gate_open') String? gateOpen,
    @JsonKey(name: 'gate_close') String? gateClose,
  }) = _OperatingHours;

  factory OperatingHours.fromJson(Map<String, dynamic> json) =>
      _$OperatingHoursFromJson(json);

  factory OperatingHours.safeFromJson(Map<String, dynamic>? json) {
    return OperatingHours(
      gateOpen: NullSafetyHelper.safeString(json?['gate_open']),
      gateClose: NullSafetyHelper.safeString(json?['gate_close']),
    );
  }

  factory OperatingHours.empty() => const OperatingHours(
        gateOpen: "",
        gateClose: "",
      );

  factory OperatingHours.withDefaults() => const OperatingHours(
        gateOpen: '08:00',
        gateClose: '20:00',
      );
}