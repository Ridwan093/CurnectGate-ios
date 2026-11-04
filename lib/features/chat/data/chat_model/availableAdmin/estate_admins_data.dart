import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'estate_admin.dart';

part 'estate_admins_data.freezed.dart';
part 'estate_admins_data.g.dart';

@freezed
class EstateAdminsData with _$EstateAdminsData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EstateAdminsData({
    List<EstateAdmin>? admins,
    int? count,
    String? role,
    String? roleBadge,
  }) = _EstateAdminsData;

  factory EstateAdminsData.fromJson(Map<String, dynamic> json) =>
      _$EstateAdminsDataFromJson(json);

  factory EstateAdminsData.safeFromJson(Map<String, dynamic>? json) {
    final adminsJson = json?['admins'] as List<dynamic>?;
    return EstateAdminsData(
      admins:
          adminsJson != null
              ? adminsJson
                  .map(
                    (e) => EstateAdmin.safeFromJson(e as Map<String, dynamic>),
                  )
                  .toList()
              : [],

      count: NullSafetyHelper.safeInt(json?['count']),
      role: NullSafetyHelper.safeString(json?['role']),
      roleBadge: NullSafetyHelper.safeString(json?['role_badge']),
    );
  }

  factory EstateAdminsData.empty() =>
      const EstateAdminsData(admins: [], count: 0, role: null, roleBadge: null);
}
