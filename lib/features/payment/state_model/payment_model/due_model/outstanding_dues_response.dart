import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'outstanding_dues_data.dart';


part 'outstanding_dues_response.freezed.dart';
part 'outstanding_dues_response.g.dart';

@freezed
class OutstandingDuesResponse with _$OutstandingDuesResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory OutstandingDuesResponse({
    bool? status,
    String? message,
    int? code,
    OutstandingDuesData? data,
  }) = _OutstandingDuesResponse;

  factory OutstandingDuesResponse.fromJson(Map<String, dynamic> json) =>
      _$OutstandingDuesResponseFromJson(json);

  factory OutstandingDuesResponse.safeFromJson(Map<String, dynamic>? json) {
    return OutstandingDuesResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: OutstandingDuesData.safeFromJson(json?['data']),
    );
  }

  factory OutstandingDuesResponse.empty() => OutstandingDuesResponse(
        status: false,
        message: '',
        code: 0,
        data: OutstandingDuesData.empty(),
      );
}

 
    
    
     