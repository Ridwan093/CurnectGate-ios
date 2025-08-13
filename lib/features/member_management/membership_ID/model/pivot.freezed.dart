// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pivot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pivot _$PivotFromJson(Map<String, dynamic> json) {
  return _Pivot.fromJson(json);
}

/// @nodoc
mixin _$Pivot {
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate_id')
  int? get estateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_id')
  int? get roleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Pivot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pivot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PivotCopyWith<Pivot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PivotCopyWith<$Res> {
  factory $PivotCopyWith(Pivot value, $Res Function(Pivot) then) =
      _$PivotCopyWithImpl<$Res, Pivot>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'estate_id') int? estateId,
      @JsonKey(name: 'role_id') int? roleId,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$PivotCopyWithImpl<$Res, $Val extends Pivot>
    implements $PivotCopyWith<$Res> {
  _$PivotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pivot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? estateId = freezed,
    Object? roleId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PivotImplCopyWith<$Res> implements $PivotCopyWith<$Res> {
  factory _$$PivotImplCopyWith(
          _$PivotImpl value, $Res Function(_$PivotImpl) then) =
      __$$PivotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'estate_id') int? estateId,
      @JsonKey(name: 'role_id') int? roleId,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$PivotImplCopyWithImpl<$Res>
    extends _$PivotCopyWithImpl<$Res, _$PivotImpl>
    implements _$$PivotImplCopyWith<$Res> {
  __$$PivotImplCopyWithImpl(
      _$PivotImpl _value, $Res Function(_$PivotImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pivot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? estateId = freezed,
    Object? roleId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PivotImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$PivotImpl implements _Pivot {
  const _$PivotImpl(
      {@JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'estate_id') this.estateId,
      @JsonKey(name: 'role_id') this.roleId,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$PivotImpl.fromJson(Map<String, dynamic> json) =>
      _$$PivotImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'estate_id')
  final int? estateId;
  @override
  @JsonKey(name: 'role_id')
  final int? roleId;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'Pivot(userId: $userId, estateId: $estateId, roleId: $roleId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PivotImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, estateId, roleId, createdAt, updatedAt);

  /// Create a copy of Pivot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PivotImplCopyWith<_$PivotImpl> get copyWith =>
      __$$PivotImplCopyWithImpl<_$PivotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PivotImplToJson(
      this,
    );
  }
}

abstract class _Pivot implements Pivot {
  const factory _Pivot(
      {@JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'estate_id') final int? estateId,
      @JsonKey(name: 'role_id') final int? roleId,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt}) = _$PivotImpl;

  factory _Pivot.fromJson(Map<String, dynamic> json) = _$PivotImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'estate_id')
  int? get estateId;
  @override
  @JsonKey(name: 'role_id')
  int? get roleId;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of Pivot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PivotImplCopyWith<_$PivotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
