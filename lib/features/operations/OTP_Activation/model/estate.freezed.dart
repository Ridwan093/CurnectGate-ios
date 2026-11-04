// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, duplicate_ignore
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
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String get logoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  String get color => throw _privateConstructorUsedError;
  String get backgroundImage =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'type') String type,
      String code,
      @JsonKey(name: 'logo_url') String logoUrl,
      @JsonKey(name: 'color') String color,
      String backgroundImage,
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime? createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime? updatedAt});
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
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? code = null,
    Object? logoUrl = null,
    Object? color = null,
    Object? backgroundImage = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundImage: null == backgroundImage
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'type') String type,
      String code,
      @JsonKey(name: 'logo_url') String logoUrl,
      @JsonKey(name: 'color') String color,
      String backgroundImage,
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime? createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime? updatedAt});
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
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? code = null,
    Object? logoUrl = null,
    Object? color = null,
    Object? backgroundImage = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$EstateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundImage: null == backgroundImage
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EstateImpl implements _Estate {
  const _$EstateImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'description') this.description = '',
      @JsonKey(name: 'type') this.type = '',
      this.code = '',
      @JsonKey(name: 'logo_url') this.logoUrl = '',
      @JsonKey(name: 'color') this.color = '',
      this.backgroundImage = '',
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      this.updatedAt});

  factory _$EstateImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstateImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey(name: 'logo_url')
  final String logoUrl;
  @override
  @JsonKey(name: 'color')
  final String color;
  @override
  @JsonKey()
  final String backgroundImage;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Estate(id: $id, name: $name, description: $description, type: $type, code: $code, logoUrl: $logoUrl, color: $color, backgroundImage: $backgroundImage, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, type,
      code, logoUrl, color, backgroundImage, createdAt, updatedAt);

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
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'description') final String description,
      @JsonKey(name: 'type') final String type,
      final String code,
      @JsonKey(name: 'logo_url') final String logoUrl,
      @JsonKey(name: 'color') final String color,
      final String backgroundImage,
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      final DateTime? updatedAt}) = _$EstateImpl;

  factory _Estate.fromJson(Map<String, dynamic> json) = _$EstateImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  String get code;
  @override
  @JsonKey(name: 'logo_url')
  String get logoUrl;
  @override
  @JsonKey(name: 'color')
  String get color;
  @override
  String get backgroundImage; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime? get updatedAt;

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstateImplCopyWith<_$EstateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
