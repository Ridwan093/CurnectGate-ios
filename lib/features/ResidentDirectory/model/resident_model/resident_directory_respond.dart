// resident_directory_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'resident_directory_data.dart';


part 'resident_directory_respond.freezed.dart';
part 'resident_directory_respond.g.dart';

@freezed
class ResidentDirectoryResponse with _$ResidentDirectoryResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ResidentDirectoryResponse({
     bool? status,
     String? message,
     int? code,
     ResidentDirectoryData? data,
  }) = _ResidentDirectoryResponse;

  factory ResidentDirectoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ResidentDirectoryResponseFromJson(json);

  factory ResidentDirectoryResponse.fromSafeJson(Map<String, dynamic> json) {
    return ResidentDirectoryResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: NullSafetyHelper.safeModel(
        json['data'],
        ResidentDirectoryData.fromSafeJson,
        ResidentDirectoryData.empty(),
      )!,
    );
  }

  factory ResidentDirectoryResponse.empty() =>  ResidentDirectoryResponse(
        status: false,
        message: '',
        code: 0,
        data: ResidentDirectoryData.empty(),
      );
}
