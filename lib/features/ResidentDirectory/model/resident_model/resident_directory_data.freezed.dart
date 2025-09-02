// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resident_directory_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResidentDirectoryData _$ResidentDirectoryDataFromJson(
    Map<String, dynamic> json) {
  return _ResidentDirectoryData.fromJson(json);
}

/// @nodoc
mixin _$ResidentDirectoryData {
  ResidentList? get residents => throw _privateConstructorUsedError;
  DirectorySummary? get summary => throw _privateConstructorUsedError;
  DirectoryFilters? get filtersApplied => throw _privateConstructorUsedError;

  /// Serializes this ResidentDirectoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResidentDirectoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResidentDirectoryDataCopyWith<ResidentDirectoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResidentDirectoryDataCopyWith<$Res> {
  factory $ResidentDirectoryDataCopyWith(ResidentDirectoryData value,
          $Res Function(ResidentDirectoryData) then) =
      _$ResidentDirectoryDataCopyWithImpl<$Res, ResidentDirectoryData>;
  @useResult
  $Res call(
      {ResidentList? residents,
      DirectorySummary? summary,
      DirectoryFilters? filtersApplied});

  $ResidentListCopyWith<$Res>? get residents;
  $DirectorySummaryCopyWith<$Res>? get summary;
  $DirectoryFiltersCopyWith<$Res>? get filtersApplied;
}

/// @nodoc
class _$ResidentDirectoryDataCopyWithImpl<$Res,
        $Val extends ResidentDirectoryData>
    implements $ResidentDirectoryDataCopyWith<$Res> {
  _$ResidentDirectoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResidentDirectoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? residents = freezed,
    Object? summary = freezed,
    Object? filtersApplied = freezed,
  }) {
    return _then(_value.copyWith(
      residents: freezed == residents
          ? _value.residents
          : residents // ignore: cast_nullable_to_non_nullable
              as ResidentList?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as DirectorySummary?,
      filtersApplied: freezed == filtersApplied
          ? _value.filtersApplied
          : filtersApplied // ignore: cast_nullable_to_non_nullable
              as DirectoryFilters?,
    ) as $Val);
  }

  /// Create a copy of ResidentDirectoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResidentListCopyWith<$Res>? get residents {
    if (_value.residents == null) {
      return null;
    }

    return $ResidentListCopyWith<$Res>(_value.residents!, (value) {
      return _then(_value.copyWith(residents: value) as $Val);
    });
  }

  /// Create a copy of ResidentDirectoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DirectorySummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $DirectorySummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }

  /// Create a copy of ResidentDirectoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DirectoryFiltersCopyWith<$Res>? get filtersApplied {
    if (_value.filtersApplied == null) {
      return null;
    }

    return $DirectoryFiltersCopyWith<$Res>(_value.filtersApplied!, (value) {
      return _then(_value.copyWith(filtersApplied: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResidentDirectoryDataImplCopyWith<$Res>
    implements $ResidentDirectoryDataCopyWith<$Res> {
  factory _$$ResidentDirectoryDataImplCopyWith(
          _$ResidentDirectoryDataImpl value,
          $Res Function(_$ResidentDirectoryDataImpl) then) =
      __$$ResidentDirectoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResidentList? residents,
      DirectorySummary? summary,
      DirectoryFilters? filtersApplied});

  @override
  $ResidentListCopyWith<$Res>? get residents;
  @override
  $DirectorySummaryCopyWith<$Res>? get summary;
  @override
  $DirectoryFiltersCopyWith<$Res>? get filtersApplied;
}

/// @nodoc
class __$$ResidentDirectoryDataImplCopyWithImpl<$Res>
    extends _$ResidentDirectoryDataCopyWithImpl<$Res,
        _$ResidentDirectoryDataImpl>
    implements _$$ResidentDirectoryDataImplCopyWith<$Res> {
  __$$ResidentDirectoryDataImplCopyWithImpl(_$ResidentDirectoryDataImpl _value,
      $Res Function(_$ResidentDirectoryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResidentDirectoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? residents = freezed,
    Object? summary = freezed,
    Object? filtersApplied = freezed,
  }) {
    return _then(_$ResidentDirectoryDataImpl(
      residents: freezed == residents
          ? _value.residents
          : residents // ignore: cast_nullable_to_non_nullable
              as ResidentList?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as DirectorySummary?,
      filtersApplied: freezed == filtersApplied
          ? _value.filtersApplied
          : filtersApplied // ignore: cast_nullable_to_non_nullable
              as DirectoryFilters?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ResidentDirectoryDataImpl implements _ResidentDirectoryData {
  const _$ResidentDirectoryDataImpl(
      {this.residents, this.summary, this.filtersApplied});

  factory _$ResidentDirectoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResidentDirectoryDataImplFromJson(json);

  @override
  final ResidentList? residents;
  @override
  final DirectorySummary? summary;
  @override
  final DirectoryFilters? filtersApplied;

  @override
  String toString() {
    return 'ResidentDirectoryData(residents: $residents, summary: $summary, filtersApplied: $filtersApplied)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResidentDirectoryDataImpl &&
            (identical(other.residents, residents) ||
                other.residents == residents) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.filtersApplied, filtersApplied) ||
                other.filtersApplied == filtersApplied));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, residents, summary, filtersApplied);

  /// Create a copy of ResidentDirectoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResidentDirectoryDataImplCopyWith<_$ResidentDirectoryDataImpl>
      get copyWith => __$$ResidentDirectoryDataImplCopyWithImpl<
          _$ResidentDirectoryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResidentDirectoryDataImplToJson(
      this,
    );
  }
}

abstract class _ResidentDirectoryData implements ResidentDirectoryData {
  const factory _ResidentDirectoryData(
      {final ResidentList? residents,
      final DirectorySummary? summary,
      final DirectoryFilters? filtersApplied}) = _$ResidentDirectoryDataImpl;

  factory _ResidentDirectoryData.fromJson(Map<String, dynamic> json) =
      _$ResidentDirectoryDataImpl.fromJson;

  @override
  ResidentList? get residents;
  @override
  DirectorySummary? get summary;
  @override
  DirectoryFilters? get filtersApplied;

  /// Create a copy of ResidentDirectoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResidentDirectoryDataImplCopyWith<_$ResidentDirectoryDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
