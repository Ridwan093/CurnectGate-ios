// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OtpData _$OtpDataFromJson(Map<String, dynamic> json) {
  return _OtpData.fromJson(json);
}

/// @nodoc
mixin _$OtpData {
  List<Otp> get otps => throw _privateConstructorUsedError;
  Pagination get pagination => throw _privateConstructorUsedError;
  Summary get summary => throw _privateConstructorUsedError;
  Map<String, dynamic> get filtersApplied => throw _privateConstructorUsedError;

  /// Serializes this OtpData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OtpData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpDataCopyWith<OtpData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpDataCopyWith<$Res> {
  factory $OtpDataCopyWith(OtpData value, $Res Function(OtpData) then) =
      _$OtpDataCopyWithImpl<$Res, OtpData>;
  @useResult
  $Res call(
      {List<Otp> otps,
      Pagination pagination,
      Summary summary,
      Map<String, dynamic> filtersApplied});

  $PaginationCopyWith<$Res> get pagination;
  $SummaryCopyWith<$Res> get summary;
}

/// @nodoc
class _$OtpDataCopyWithImpl<$Res, $Val extends OtpData>
    implements $OtpDataCopyWith<$Res> {
  _$OtpDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otps = null,
    Object? pagination = null,
    Object? summary = null,
    Object? filtersApplied = null,
  }) {
    return _then(_value.copyWith(
      otps: null == otps
          ? _value.otps
          : otps // ignore: cast_nullable_to_non_nullable
              as List<Otp>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as Summary,
      filtersApplied: null == filtersApplied
          ? _value.filtersApplied
          : filtersApplied // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }

  /// Create a copy of OtpData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res> get pagination {
    return $PaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }

  /// Create a copy of OtpData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SummaryCopyWith<$Res> get summary {
    return $SummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OtpDataImplCopyWith<$Res> implements $OtpDataCopyWith<$Res> {
  factory _$$OtpDataImplCopyWith(
          _$OtpDataImpl value, $Res Function(_$OtpDataImpl) then) =
      __$$OtpDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Otp> otps,
      Pagination pagination,
      Summary summary,
      Map<String, dynamic> filtersApplied});

  @override
  $PaginationCopyWith<$Res> get pagination;
  @override
  $SummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$$OtpDataImplCopyWithImpl<$Res>
    extends _$OtpDataCopyWithImpl<$Res, _$OtpDataImpl>
    implements _$$OtpDataImplCopyWith<$Res> {
  __$$OtpDataImplCopyWithImpl(
      _$OtpDataImpl _value, $Res Function(_$OtpDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otps = null,
    Object? pagination = null,
    Object? summary = null,
    Object? filtersApplied = null,
  }) {
    return _then(_$OtpDataImpl(
      otps: null == otps
          ? _value._otps
          : otps // ignore: cast_nullable_to_non_nullable
              as List<Otp>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as Summary,
      filtersApplied: null == filtersApplied
          ? _value._filtersApplied
          : filtersApplied // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtpDataImpl implements _OtpData {
  const _$OtpDataImpl(
      {final List<Otp> otps = const [],
      required this.pagination,
      required this.summary,
      final Map<String, dynamic> filtersApplied = const {}})
      : _otps = otps,
        _filtersApplied = filtersApplied;

  factory _$OtpDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpDataImplFromJson(json);

  final List<Otp> _otps;
  @override
  @JsonKey()
  List<Otp> get otps {
    if (_otps is EqualUnmodifiableListView) return _otps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otps);
  }

  @override
  final Pagination pagination;
  @override
  final Summary summary;
  final Map<String, dynamic> _filtersApplied;
  @override
  @JsonKey()
  Map<String, dynamic> get filtersApplied {
    if (_filtersApplied is EqualUnmodifiableMapView) return _filtersApplied;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_filtersApplied);
  }

  @override
  String toString() {
    return 'OtpData(otps: $otps, pagination: $pagination, summary: $summary, filtersApplied: $filtersApplied)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpDataImpl &&
            const DeepCollectionEquality().equals(other._otps, _otps) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality()
                .equals(other._filtersApplied, _filtersApplied));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_otps),
      pagination,
      summary,
      const DeepCollectionEquality().hash(_filtersApplied));

  /// Create a copy of OtpData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpDataImplCopyWith<_$OtpDataImpl> get copyWith =>
      __$$OtpDataImplCopyWithImpl<_$OtpDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtpDataImplToJson(
      this,
    );
  }
}

abstract class _OtpData implements OtpData {
  const factory _OtpData(
      {final List<Otp> otps,
      required final Pagination pagination,
      required final Summary summary,
      final Map<String, dynamic> filtersApplied}) = _$OtpDataImpl;

  factory _OtpData.fromJson(Map<String, dynamic> json) = _$OtpDataImpl.fromJson;

  @override
  List<Otp> get otps;
  @override
  Pagination get pagination;
  @override
  Summary get summary;
  @override
  Map<String, dynamic> get filtersApplied;

  /// Create a copy of OtpData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpDataImplCopyWith<_$OtpDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
