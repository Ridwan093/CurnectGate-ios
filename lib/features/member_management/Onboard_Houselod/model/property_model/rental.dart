import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'rental.freezed.dart';
part 'rental.g.dart';

@freezed
class Rental with _$Rental {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory Rental({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'start_date') required String startDate,
    // Add other rental properties as needed
  }) = _Rental;

  factory Rental.fromJson(Map<String, dynamic> json) =>
      _$RentalFromJson(json);

  factory Rental.safeFromJson(Map<String, dynamic>? json) =>
      Rental(
        id: NullSafetyHelper.safeInt(json?['id']),
        startDate: NullSafetyHelper.safeString(json?['start_date']),
        // Initialize other properties
      );
}