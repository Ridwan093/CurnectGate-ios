import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'restriction_status_data.freezed.dart';
part 'restriction_status_data.g.dart';

@freezed
class RestrictionStatusData with _$RestrictionStatusData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory RestrictionStatusData({
    int? memberId,
    bool? isRestricted,
    bool? hasDigitalId,
    String? digitalIdStatus,
    dynamic restrictions,
  }) = _RestrictionStatusData;

  factory RestrictionStatusData.fromJson(Map<String, dynamic> json) =>
      _$RestrictionStatusDataFromJson(json);

  factory RestrictionStatusData.safeFromJson(
      Map<String, dynamic>? json) {
    return RestrictionStatusData(
      memberId: NullSafetyHelper.safeInt(json?['member_id']),
      isRestricted: NullSafetyHelper.safeBool(json?['is_restricted']),
      hasDigitalId: NullSafetyHelper.safeBool(json?['has_digital_id']),
      digitalIdStatus:
          NullSafetyHelper.safeString(json?['digital_id_status']),
      restrictions: json?['restrictions'],
    );
  }

  factory RestrictionStatusData.empty() =>
      const RestrictionStatusData(
        memberId: 0,
        isRestricted: false,
        hasDigitalId: false,
        digitalIdStatus: '',
        restrictions: null,
      );
}