// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curfew_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurfewData _$CurfewDataFromJson(Map<String, dynamic> json) {
  return _CurfewData.fromJson(json);
}

/// @nodoc
mixin _$CurfewData {
  CurfewMember? get member => throw _privateConstructorUsedError;
  CurfewSettings? get curfewSettings => throw _privateConstructorUsedError;

  /// Serializes this CurfewData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurfewData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurfewDataCopyWith<CurfewData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurfewDataCopyWith<$Res> {
  factory $CurfewDataCopyWith(
          CurfewData value, $Res Function(CurfewData) then) =
      _$CurfewDataCopyWithImpl<$Res, CurfewData>;
  @useResult
  $Res call({CurfewMember? member, CurfewSettings? curfewSettings});

  $CurfewMemberCopyWith<$Res>? get member;
  $CurfewSettingsCopyWith<$Res>? get curfewSettings;
}

/// @nodoc
class _$CurfewDataCopyWithImpl<$Res, $Val extends CurfewData>
    implements $CurfewDataCopyWith<$Res> {
  _$CurfewDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurfewData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = freezed,
    Object? curfewSettings = freezed,
  }) {
    return _then(_value.copyWith(
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as CurfewMember?,
      curfewSettings: freezed == curfewSettings
          ? _value.curfewSettings
          : curfewSettings // ignore: cast_nullable_to_non_nullable
              as CurfewSettings?,
    ) as $Val);
  }

  /// Create a copy of CurfewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurfewMemberCopyWith<$Res>? get member {
    if (_value.member == null) {
      return null;
    }

    return $CurfewMemberCopyWith<$Res>(_value.member!, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }

  /// Create a copy of CurfewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurfewSettingsCopyWith<$Res>? get curfewSettings {
    if (_value.curfewSettings == null) {
      return null;
    }

    return $CurfewSettingsCopyWith<$Res>(_value.curfewSettings!, (value) {
      return _then(_value.copyWith(curfewSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurfewDataImplCopyWith<$Res>
    implements $CurfewDataCopyWith<$Res> {
  factory _$$CurfewDataImplCopyWith(
          _$CurfewDataImpl value, $Res Function(_$CurfewDataImpl) then) =
      __$$CurfewDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CurfewMember? member, CurfewSettings? curfewSettings});

  @override
  $CurfewMemberCopyWith<$Res>? get member;
  @override
  $CurfewSettingsCopyWith<$Res>? get curfewSettings;
}

/// @nodoc
class __$$CurfewDataImplCopyWithImpl<$Res>
    extends _$CurfewDataCopyWithImpl<$Res, _$CurfewDataImpl>
    implements _$$CurfewDataImplCopyWith<$Res> {
  __$$CurfewDataImplCopyWithImpl(
      _$CurfewDataImpl _value, $Res Function(_$CurfewDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurfewData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = freezed,
    Object? curfewSettings = freezed,
  }) {
    return _then(_$CurfewDataImpl(
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as CurfewMember?,
      curfewSettings: freezed == curfewSettings
          ? _value.curfewSettings
          : curfewSettings // ignore: cast_nullable_to_non_nullable
              as CurfewSettings?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CurfewDataImpl implements _CurfewData {
  const _$CurfewDataImpl({this.member, this.curfewSettings});

  factory _$CurfewDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurfewDataImplFromJson(json);

  @override
  final CurfewMember? member;
  @override
  final CurfewSettings? curfewSettings;

  @override
  String toString() {
    return 'CurfewData(member: $member, curfewSettings: $curfewSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurfewDataImpl &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.curfewSettings, curfewSettings) ||
                other.curfewSettings == curfewSettings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, member, curfewSettings);

  /// Create a copy of CurfewData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurfewDataImplCopyWith<_$CurfewDataImpl> get copyWith =>
      __$$CurfewDataImplCopyWithImpl<_$CurfewDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurfewDataImplToJson(
      this,
    );
  }
}

abstract class _CurfewData implements CurfewData {
  const factory _CurfewData(
      {final CurfewMember? member,
      final CurfewSettings? curfewSettings}) = _$CurfewDataImpl;

  factory _CurfewData.fromJson(Map<String, dynamic> json) =
      _$CurfewDataImpl.fromJson;

  @override
  CurfewMember? get member;
  @override
  CurfewSettings? get curfewSettings;

  /// Create a copy of CurfewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurfewDataImplCopyWith<_$CurfewDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
