// board_position_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'board_position_model.freezed.dart';
part 'board_position_model.g.dart';

@freezed
class BoardPosition with _$BoardPosition {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory BoardPosition({
     int? id,
     String? title,
     DateTime? termStartDate,
     DateTime? termEndDate,
     int? termNumber,
  }) = _BoardPosition;

  factory BoardPosition.fromJson(Map<String, dynamic> json) =>
      _$BoardPositionFromJson(json);

  factory BoardPosition.fromSafeJson(Map<String, dynamic> json) {
    return BoardPosition(
      id: NullSafetyHelper.safeInt(json['id']),
      title: NullSafetyHelper.safeString(json['title']),
      termStartDate: NullSafetyHelper.safeDateTime(json['term_start_date']),
      termEndDate: NullSafetyHelper.safeDateTime(json['term_end_date']),
      termNumber: NullSafetyHelper.safeInt(json['term_number']),
    );
  }

  factory BoardPosition.empty() => BoardPosition(
        id: 0,
        title: '',
        termStartDate: DateTime.now(),
        termEndDate: DateTime.now(),
        termNumber: 0,
      );
}