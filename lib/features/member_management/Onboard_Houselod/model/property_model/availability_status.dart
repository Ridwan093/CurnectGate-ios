import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'availability_status.freezed.dart';
part 'availability_status.g.dart';

@freezed
class AvailabilityStatus with _$AvailabilityStatus {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory AvailabilityStatus({
    @JsonKey(name: 'is_available') required bool isAvailable,
    @JsonKey(name: 'reason') String? reason,
    @JsonKey(name: 'available_from') String? availableFrom,
  }) = _AvailabilityStatus;

  factory AvailabilityStatus.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityStatusFromJson(json);

  factory AvailabilityStatus.safeFromJson(Map<String, dynamic>? json) =>
      AvailabilityStatus(
        isAvailable: NullSafetyHelper.safeBool(json?['is_available']),
        reason: json?['reason'] as String?,
        availableFrom: json?['available_from'] as String?,
      );
}
