import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'estate_admin.dart';

part 'estate_admins_data.freezed.dart';
part 'estate_admins_data.g.dart';

@freezed
class EstateAdminsData with _$EstateAdminsData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EstateAdminsData({
    List<EstateAdmin>? admins,
    int? count,
  }) = _EstateAdminsData;

  factory EstateAdminsData.fromJson(Map<String, dynamic> json) =>
      _$EstateAdminsDataFromJson(json);

  factory EstateAdminsData.safeFromJson(Map<String, dynamic>? json) {
    return EstateAdminsData(
      admins: NullSafetyHelper.safeMapList(json?['admins'])
          .map((e) => EstateAdmin.safeFromJson(e))
          .toList(),
      count: NullSafetyHelper.safeInt(json?['count']),
    );
  }

  factory EstateAdminsData.empty() =>
      const EstateAdminsData(admins: [], count: 0);
}
