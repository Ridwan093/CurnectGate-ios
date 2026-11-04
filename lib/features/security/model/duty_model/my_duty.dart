import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'my_duty.freezed.dart';
part 'my_duty.g.dart';

@freezed
class MyDuty with _$MyDuty {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory MyDuty({
    String? dutyStatus,
    dynamic shift,
    String? lastCheckIn,
    String? lastCheckOut,
    bool? accessToPortal,
    dynamic securityShift,
    dynamic securityRole,
    dynamic securityPost,
  }) = _MyDuty;

  factory MyDuty.fromJson(Map<String, dynamic> json) =>
      _$MyDutyFromJson(json);

  factory MyDuty.safeFromJson(Map<String, dynamic>? json) {
    return MyDuty(
      dutyStatus: NullSafetyHelper.safeString(json?['duty_status']),
      shift: json?['shift'],
      lastCheckIn:
          NullSafetyHelper.safeString(json?['last_check_in']),
      lastCheckOut:
          NullSafetyHelper.safeString(json?['last_check_out']),
      accessToPortal:
          NullSafetyHelper.safeBool(json?['access_to_portal']),
      securityShift: json?['security_shift'],
      securityRole: json?['security_role'],
      securityPost: json?['security_post'],
    );
  }
}