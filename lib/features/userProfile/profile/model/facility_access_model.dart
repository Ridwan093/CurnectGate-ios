import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_access_model.freezed.dart';
part 'facility_access_model.g.dart';

@freezed
class FacilityAccess with _$FacilityAccess {
  const factory FacilityAccess({
    @Default(false) bool enabled,
  }) = _FacilityAccess;

  factory FacilityAccess.fromJson(Map<String, dynamic> json) =>
      _$FacilityAccessFromJson(json);


}
