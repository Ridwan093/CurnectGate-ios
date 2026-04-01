import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'estate_admins_data.dart';

part 'estate_admins_response.freezed.dart';
part 'estate_admins_response.g.dart';

@freezed
class EstateAdminsResponse with _$EstateAdminsResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EstateAdminsResponse({
    bool? success,
    String? message,
    EstateAdminsData? data,
  }) = _EstateAdminsResponse;

  factory EstateAdminsResponse.fromJson(Map<String, dynamic> json) =>
      _$EstateAdminsResponseFromJson(json);

  factory EstateAdminsResponse.safeFromJson(Map<String, dynamic>? json) {
    return EstateAdminsResponse(
      success: NullSafetyHelper.safeBool(json?['success']),
      message: NullSafetyHelper.safeString(json?['message']),
      data: NullSafetyHelper.safeModel(
        json?['data'],
        EstateAdminsData.safeFromJson,
        EstateAdminsData.empty(),
      ),
    );
  }

  factory EstateAdminsResponse.empty() =>
      const EstateAdminsResponse(success: false, message: '', data: null);
}
