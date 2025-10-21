import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'biometric_device.freezed.dart';
part 'biometric_device.g.dart';

@freezed
class BiometricDevice with _$BiometricDevice {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory BiometricDevice({
    String? token,
    String? lastUsed,
    Map<String, dynamic>? deviceInfo,
    String? registeredAt,
  }) = _BiometricDevice;

  factory BiometricDevice.fromJson(Map<String, dynamic> json) =>
      _$BiometricDeviceFromJson(json);

  factory BiometricDevice.fromSafeJson(Map<String, dynamic>? json) {
    if (json == null) return BiometricDevice.empty();
    return BiometricDevice(
      token: NullSafetyHelper.safeString(json['token']),
      lastUsed: NullSafetyHelper.safeString(json['last_used']),
      deviceInfo: NullSafetyHelper.safeMap(json['device_info']),
      registeredAt: NullSafetyHelper.safeString(json['registered_at']),
    );
  }

  factory BiometricDevice.empty() => const BiometricDevice(
        token: null,
        lastUsed: null,
        deviceInfo: null,
        registeredAt: null,
      );
}
