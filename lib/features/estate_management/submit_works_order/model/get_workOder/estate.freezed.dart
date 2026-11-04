// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Estate _$EstateFromJson(Map<String, dynamic> json) {
  return _Estate.fromJson(json);
}

/// @nodoc
mixin _$Estate {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Estate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstateCopyWith<Estate> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstateCopyWith<$Res> {
  factory $EstateCopyWith(Estate value, $Res Function(Estate) then) =
      _$EstateCopyWithImpl<$Res, Estate>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? code,
      String? description,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$EstateCopyWithImpl<$Res, $Val extends Estate>
    implements $EstateCopyWith<$Res> {
  _$EstateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$EstateImplCopyWith<$Res> implements $EstateCopyWith<$Res> {
  factory _$$EstateImplCopyWith(
          _$EstateImpl value, $Res Function(_$EstateImpl) then) =
      __$$EstateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? code,
      String? description,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$EstateImplCopyWithImpl<$Res>
    extends _$EstateCopyWithImpl<$Res, _$EstateImpl>
    implements _$$EstateImplCopyWith<$Res> {
  __$$EstateImplCopyWithImpl(
      _$EstateImpl _value, $Res Function(_$EstateImpl) _then)
      : super(_value, _then);

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$EstateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$EstateImpl implements _Estate {
  const _$EstateImpl(
      {this.id,
      this.name,
      this.code,
      this.description,
      this.createdAt,
      this.updatedAt});

  factory _$EstateImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstateImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? code;
  @override
  final String? description;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'Estate(id: $id, name: $name, code: $code, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, code, description, createdAt, updatedAt);

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstateImplCopyWith<_$EstateImpl> get copyWith =>
      __$$EstateImplCopyWithImpl<_$EstateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstateImplToJson(
      this,
    );
  }
}

abstract class _Estate implements Estate {
  const factory _Estate(
      {final int? id,
      final String? name,
      final String? code,
      final String? description,
      final String? createdAt,
      final String? updatedAt}) = _$EstateImpl;

  factory _Estate.fromJson(Map<String, dynamic> json) = _$EstateImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get code;
  @override
  String? get description;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstateImplCopyWith<_$EstateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
