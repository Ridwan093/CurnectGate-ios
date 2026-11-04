// directory_filters_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'directory_filters_model.freezed.dart';
part 'directory_filters_model.g.dart';

@freezed
class DirectoryFilters with _$DirectoryFilters {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory DirectoryFilters({
     String? search,
     bool? committeeMember,
     bool? boardMember,
  }) = _DirectoryFilters;

  factory DirectoryFilters.fromJson(Map<String, dynamic> json) =>
      _$DirectoryFiltersFromJson(json);

  factory DirectoryFilters.fromSafeJson(Map<String, dynamic> json) {
    return DirectoryFilters(
      search: NullSafetyHelper.safeString(json['search']),
      committeeMember: NullSafetyHelper.safeBool(json['committee_member']),
      boardMember: NullSafetyHelper.safeBool(json['board_member']),
    );
  }

  factory DirectoryFilters.empty() => const DirectoryFilters(
        search: null,
        committeeMember: false,
        boardMember: false,
      );
}