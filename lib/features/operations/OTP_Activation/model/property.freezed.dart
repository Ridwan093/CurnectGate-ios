// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Property _$PropertyFromJson(Map<String, dynamic> json) {
  return _Property.fromJson(json);
}

/// @nodoc
mixin _$Property {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate_id')
  int get estateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'block')
  String get block => throw _privateConstructorUsedError;
  @JsonKey(name: 'street')
  String get street => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Property to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyCopyWith<Property> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyCopyWith<$Res> {
  factory $PropertyCopyWith(Property value, $Res Function(Property) then) =
      _$PropertyCopyWithImpl<$Res, Property>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'estate_id') int estateId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'block') String block,
      @JsonKey(name: 'street') String street,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime updatedAt});
}

/// @nodoc
class _$PropertyCopyWithImpl<$Res, $Val extends Property>
    implements $PropertyCopyWith<$Res> {
  _$PropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? estateId = null,
    Object? name = null,
    Object? type = null,
    Object? code = null,
    Object? block = null,
    Object? street = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      estateId: null == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      block: null == block
          ? _value.block
          : block // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PropertyImplCopyWith<$Res>
    implements $PropertyCopyWith<$Res> {
  factory _$$PropertyImplCopyWith(
          _$PropertyImpl value, $Res Function(_$PropertyImpl) then) =
      __$$PropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'estate_id') int estateId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'block') String block,
      @JsonKey(name: 'street') String street,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime updatedAt});
}

/// @nodoc
class __$$PropertyImplCopyWithImpl<$Res>
    extends _$PropertyCopyWithImpl<$Res, _$PropertyImpl>
    implements _$$PropertyImplCopyWith<$Res> {
  __$$PropertyImplCopyWithImpl(
      _$PropertyImpl _value, $Res Function(_$PropertyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? estateId = null,
    Object? name = null,
    Object? type = null,
    Object? code = null,
    Object? block = null,
    Object? street = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PropertyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      estateId: null == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      block: null == block
          ? _value.block
          : block // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertyImpl implements _Property {
  const _$PropertyImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'estate_id') this.estateId = 0,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'type') this.type = '',
      @JsonKey(name: 'code') this.code = '',
      @JsonKey(name: 'block') this.block = '',
      @JsonKey(name: 'street') this.street = '',
      @JsonKey(name: 'description') this.description = '',
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      required this.updatedAt});

  factory _$PropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'estate_id')
  final int estateId;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'block')
  final String block;
  @override
  @JsonKey(name: 'street')
  final String street;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Property(id: $id, estateId: $estateId, name: $name, type: $type, code: $code, block: $block, street: $street, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.block, block) || other.block == block) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, estateId, name, type, code,
      block, street, description, createdAt, updatedAt);

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyImplCopyWith<_$PropertyImpl> get copyWith =>
      __$$PropertyImplCopyWithImpl<_$PropertyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyImplToJson(
      this,
    );
  }
}

abstract class _Property implements Property {
  const factory _Property(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'estate_id') final int estateId,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'type') final String type,
      @JsonKey(name: 'code') final String code,
      @JsonKey(name: 'block') final String block,
      @JsonKey(name: 'street') final String street,
      @JsonKey(name: 'description') final String description,
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      required final DateTime updatedAt}) = _$PropertyImpl;

  factory _Property.fromJson(Map<String, dynamic> json) =
      _$PropertyImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'estate_id')
  int get estateId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(name: 'block')
  String get block;
  @override
  @JsonKey(name: 'street')
  String get street;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get updatedAt;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyImplCopyWith<_$PropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
