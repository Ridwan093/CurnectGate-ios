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
    @JsonKey(name: 'gate_open') required String? gateOpen,
    @JsonKey(name: 'gate_close') required String? gateClose,
  }) = _OperatingHours;

  factory OperatingHours.fromJson(Map<String, dynamic> json) =>
      _$OperatingHoursFromJson(json);

  factory OperatingHours.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return OperatingHours(
        gateOpen: null,
        gateClose: null,
      );
    }
    return OperatingHours(
      gateOpen: json['gate_open'] as String?,
      gateClose: json['gate_close'] as String?,
    );
  }
}