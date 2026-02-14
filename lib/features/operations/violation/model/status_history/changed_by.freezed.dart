// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'changed_by.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChangedBy _$ChangedByFromJson(Map<String, dynamic> json) {
  return _ChangedBy.fromJson(json);
}

/// @nodoc
mixin _$ChangedBy {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;

  /// Serializes this ChangedBy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChangedBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangedByCopyWith<ChangedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangedByCopyWith<$Res> {
  factory $ChangedByCopyWith(ChangedBy value, $Res Function(ChangedBy) then) =
      _$ChangedByCopyWithImpl<$Res, ChangedBy>;
  @useResult
  $Res call({int? id, String? name, String? role});
}

/// @nodoc
class _$ChangedByCopyWithImpl<$Res, $Val extends ChangedBy>
    implements $ChangedByCopyWith<$Res> {
  _$ChangedByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangedBy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangedByImplCopyWith<$Res>
    implements $ChangedByCopyWith<$Res> {
  factory _$$ChangedByImplCopyWith(
          _$ChangedByImpl value, $Res Function(_$ChangedByImpl) then) =
      __$$ChangedByImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? role});
}

/// @nodoc
class __$$ChangedByImplCopyWithImpl<$Res>
    extends _$ChangedByCopyWithImpl<$Res, _$ChangedByImpl>
    implements _$$ChangedByImplCopyWith<$Res> {
  __$$ChangedByImplCopyWithImpl(
      _$ChangedByImpl _value, $Res Function(_$ChangedByImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangedBy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? role = freezed,
  }) {
    return _then(_$ChangedByImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangedByImpl implements _ChangedBy {
  const _$ChangedByImpl({this.id, this.name, this.role});

  factory _$ChangedByImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangedByImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? role;

  @override
  String toString() {
    return 'ChangedBy(id: $id, name: $name, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangedByImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, role);

  /// Create a copy of ChangedBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangedByImplCopyWith<_$ChangedByImpl> get copyWith =>
      __$$ChangedByImplCopyWithImpl<_$ChangedByImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangedByImplToJson(
      this,
    );
  }
}

abstract class _ChangedBy implements ChangedBy {
  const factory _ChangedBy(
      {final int? id,
      final String? name,
      final String? role}) = _$ChangedByImpl;

  factory _ChangedBy.fromJson(Map<String, dynamic> json) =
      _$ChangedByImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get role;

  /// Create a copy of ChangedBy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangedByImplCopyWith<_$ChangedByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
