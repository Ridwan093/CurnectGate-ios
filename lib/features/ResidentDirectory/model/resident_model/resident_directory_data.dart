
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'directory_filters_model.dart';
import 'directory_summary_model.dart';
import 'resident_list_model.dart';


part 'resident_directory_data.freezed.dart';
part 'resident_directory_data.g.dart';





@freezed
class ResidentDirectoryData with _$ResidentDirectoryData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ResidentDirectoryData({
     ResidentList? residents,
     DirectorySummary? summary,
     DirectoryFilters? filtersApplied,
  }) = _ResidentDirectoryData;

  factory ResidentDirectoryData.fromJson(Map<String, dynamic> json) =>
      _$ResidentDirectoryDataFromJson(json);

  factory ResidentDirectoryData.fromSafeJson(Map<String, dynamic> json) {
    return ResidentDirectoryData(
      residents: NullSafetyHelper.safeModel(
        json['residents'],
        ResidentList.fromSafeJson,
        ResidentList.empty(),
      )!,
      summary: NullSafetyHelper.safeModel(
        json['summary'],
        DirectorySummary.fromSafeJson,
        DirectorySummary.empty(),
      )!,
      filtersApplied: NullSafetyHelper.safeModel(
        json['filters_applied'],
        DirectoryFilters.fromSafeJson,
        DirectoryFilters.empty(),
      )!,
    );
  }

  factory ResidentDirectoryData.empty() =>  ResidentDirectoryData(
        residents: ResidentList.empty(),
        summary: DirectorySummary.empty(),
        filtersApplied: DirectoryFilters.empty(),
      );
}