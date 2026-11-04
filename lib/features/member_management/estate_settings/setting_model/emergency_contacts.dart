import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'emergency_contacts.freezed.dart';
part 'emergency_contacts.g.dart';

@freezed
class EmergencyContacts with _$EmergencyContacts {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EmergencyContacts({
    List<String>? police,
    List<String>? estateManagement,
    List<String>? fireAlarm,
    List<String>? ambulance,
  }) = _EmergencyContacts;

  factory EmergencyContacts.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactsFromJson(json);

  factory EmergencyContacts.safeFromJson(Map<String, dynamic>? json) {
    return EmergencyContacts(
      police:
          NullSafetyHelper.safeList(
            json?['police'],
          ).map((e) => e.toString()).toList() ,
      estateManagement:
          NullSafetyHelper.safeList(
            json?['estate_management'],
          ).map((e) => e.toString()).toList() ,
      fireAlarm:
          NullSafetyHelper.safeList(
            json?['fire_alarm'],
          ).map((e) => e.toString()).toList(),
      ambulance:
          NullSafetyHelper.safeList(
            json?['ambulance'],
          ).map((e) => e.toString()).toList() ,
    );
  }

  factory EmergencyContacts.empty() => const EmergencyContacts(
    police: [],
    estateManagement: [],
    fireAlarm: [],
    ambulance: [],
  );
}
