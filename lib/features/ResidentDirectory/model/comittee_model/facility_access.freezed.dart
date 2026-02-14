// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_access.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FacilityAccess _$FacilityAccessFromJson(Map<String, dynamic> json) {
  return _FacilityAccess.fromJson(json);
}

/// @nodoc
mixin _$FacilityAccess {
  bool? get enabled => throw _privateConstructorUsedError;

  /// Serializes this FacilityAccess to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FacilityAccess
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FacilityAccessCopyWith<FacilityAccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityAccessCopyWith<$Res> {
  factory $FacilityAccessCopyWith(
          FacilityAccess value, $Res Function(FacilityAccess) then) =
      _$FacilityAccessCopyWithImpl<$Res, FacilityAccess>;
  @useResult
  $Res call({bool? enabled});
}

/// @nodoc
class _$FacilityAccessCopyWithImpl<$Res, $Val extends FacilityAccess>
    implements $FacilityAccessCopyWith<$Res> {
  _$FacilityAccessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FacilityAccess
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = freezed,
  }) {
    return _then(_value.copyWith(
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacilityAccessImplCopyWith<$Res>
    implements $FacilityAccessCopyWith<$Res> {
  factory _$$FacilityAccessImplCopyWith(_$FacilityAccessImpl value,
          $Res Function(_$FacilityAccessImpl) then) =
      __$$FacilityAccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? enabled});
}

/// @nodoc
class __$$FacilityAccessImplCopyWithImpl<$Res>
    extends _$FacilityAccessCopyWithImpl<$Res, _$FacilityAccessImpl>
    implements _$$FacilityAccessImplCopyWith<$Res> {
  __$$FacilityAccessImplCopyWithImpl(
      _$FacilityAccessImpl _value, $Res Function(_$FacilityAccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of FacilityAccess
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = freezed,
  }) {
    return _then(_$FacilityAccessImpl(
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$FacilityAccessImpl implements _FacilityAccess {
  const _$FacilityAccessImpl({this.enabled});

  factory _$FacilityAccessImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacilityAccessImplFromJson(json);

  @override
  final bool? enabled;

  @override
  String toString() {
    return 'FacilityAccess(enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityAccessImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  /// Create a copy of FacilityAccess
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityAccessImplCopyWith<_$FacilityAccessImpl> get copyWith =>
      __$$FacilityAccessImplCopyWithImpl<_$FacilityAccessImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacilityAccessImplToJson(
      this,
    );
  }
}

abstract class _FacilityAccess implements FacilityAccess {
  const factory _FacilityAccess({final bool? enabled}) = _$FacilityAccessImpl;

  factory _FacilityAccess.fromJson(Map<String, dynamic> json) =
      _$FacilityAccessImpl.fromJson;

  @override
  bool? get enabled;

  /// Create a copy of FacilityAccess
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FacilityAccessImplCopyWith<_$FacilityAccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
