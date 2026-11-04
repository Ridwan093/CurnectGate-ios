// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'securityData.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SecurityPersonnelData _$SecurityPersonnelDataFromJson(
    Map<String, dynamic> json) {
  return _SecurityPersonnelData.fromJson(json);
}

/// @nodoc
mixin _$SecurityPersonnelData {
  List<SecurityPersonnel>? get securityPersonnel =>
      throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  /// Serializes this SecurityPersonnelData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SecurityPersonnelData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SecurityPersonnelDataCopyWith<SecurityPersonnelData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityPersonnelDataCopyWith<$Res> {
  factory $SecurityPersonnelDataCopyWith(SecurityPersonnelData value,
          $Res Function(SecurityPersonnelData) then) =
      _$SecurityPersonnelDataCopyWithImpl<$Res, SecurityPersonnelData>;
  @useResult
  $Res call({List<SecurityPersonnel>? securityPersonnel, int? count});
}

/// @nodoc
class _$SecurityPersonnelDataCopyWithImpl<$Res,
        $Val extends SecurityPersonnelData>
    implements $SecurityPersonnelDataCopyWith<$Res> {
  _$SecurityPersonnelDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SecurityPersonnelData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? securityPersonnel = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      securityPersonnel: freezed == securityPersonnel
          ? _value.securityPersonnel
          : securityPersonnel // ignore: cast_nullable_to_non_nullable
              as List<SecurityPersonnel>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecurityPersonnelDataImplCopyWith<$Res>
    implements $SecurityPersonnelDataCopyWith<$Res> {
  factory _$$SecurityPersonnelDataImplCopyWith(
          _$SecurityPersonnelDataImpl value,
          $Res Function(_$SecurityPersonnelDataImpl) then) =
      __$$SecurityPersonnelDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SecurityPersonnel>? securityPersonnel, int? count});
}

/// @nodoc
class __$$SecurityPersonnelDataImplCopyWithImpl<$Res>
    extends _$SecurityPersonnelDataCopyWithImpl<$Res,
        _$SecurityPersonnelDataImpl>
    implements _$$SecurityPersonnelDataImplCopyWith<$Res> {
  __$$SecurityPersonnelDataImplCopyWithImpl(_$SecurityPersonnelDataImpl _value,
      $Res Function(_$SecurityPersonnelDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SecurityPersonnelData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? securityPersonnel = freezed,
    Object? count = freezed,
  }) {
    return _then(_$SecurityPersonnelDataImpl(
      securityPersonnel: freezed == securityPersonnel
          ? _value._securityPersonnel
          : securityPersonnel // ignore: cast_nullable_to_non_nullable
              as List<SecurityPersonnel>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$SecurityPersonnelDataImpl implements _SecurityPersonnelData {
  const _$SecurityPersonnelDataImpl(
      {final List<SecurityPersonnel>? securityPersonnel, this.count})
      : _securityPersonnel = securityPersonnel;

  factory _$SecurityPersonnelDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SecurityPersonnelDataImplFromJson(json);

  final List<SecurityPersonnel>? _securityPersonnel;
  @override
  List<SecurityPersonnel>? get securityPersonnel {
    final value = _securityPersonnel;
    if (value == null) return null;
    if (_securityPersonnel is EqualUnmodifiableListView)
      return _securityPersonnel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? count;

  @override
  String toString() {
    return 'SecurityPersonnelData(securityPersonnel: $securityPersonnel, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecurityPersonnelDataImpl &&
            const DeepCollectionEquality()
                .equals(other._securityPersonnel, _securityPersonnel) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_securityPersonnel), count);

  /// Create a copy of SecurityPersonnelData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SecurityPersonnelDataImplCopyWith<_$SecurityPersonnelDataImpl>
      get copyWith => __$$SecurityPersonnelDataImplCopyWithImpl<
          _$SecurityPersonnelDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SecurityPersonnelDataImplToJson(
      this,
    );
  }
}

abstract class _SecurityPersonnelData implements SecurityPersonnelData {
  const factory _SecurityPersonnelData(
      {final List<SecurityPersonnel>? securityPersonnel,
      final int? count}) = _$SecurityPersonnelDataImpl;

  factory _SecurityPersonnelData.fromJson(Map<String, dynamic> json) =
      _$SecurityPersonnelDataImpl.fromJson;

  @override
  List<SecurityPersonnel>? get securityPersonnel;
  @override
  int? get count;

  /// Create a copy of SecurityPersonnelData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SecurityPersonnelDataImplCopyWith<_$SecurityPersonnelDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
