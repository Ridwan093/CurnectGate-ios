// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PermissionInfo _$PermissionInfoFromJson(Map<String, dynamic> json) {
  return _PermissionInfo.fromJson(json);
}

/// @nodoc
mixin _$PermissionInfo {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this PermissionInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PermissionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionInfoCopyWith<PermissionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionInfoCopyWith<$Res> {
  factory $PermissionInfoCopyWith(
          PermissionInfo value, $Res Function(PermissionInfo) then) =
      _$PermissionInfoCopyWithImpl<$Res, PermissionInfo>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? slug,
      String? description,
      String? category});
}

/// @nodoc
class _$PermissionInfoCopyWithImpl<$Res, $Val extends PermissionInfo>
    implements $PermissionInfoCopyWith<$Res> {
  _$PermissionInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermissionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? category = freezed,
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
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionInfoImplCopyWith<$Res>
    implements $PermissionInfoCopyWith<$Res> {
  factory _$$PermissionInfoImplCopyWith(_$PermissionInfoImpl value,
          $Res Function(_$PermissionInfoImpl) then) =
      __$$PermissionInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? slug,
      String? description,
      String? category});
}

/// @nodoc
class __$$PermissionInfoImplCopyWithImpl<$Res>
    extends _$PermissionInfoCopyWithImpl<$Res, _$PermissionInfoImpl>
    implements _$$PermissionInfoImplCopyWith<$Res> {
  __$$PermissionInfoImplCopyWithImpl(
      _$PermissionInfoImpl _value, $Res Function(_$PermissionInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PermissionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? category = freezed,
  }) {
    return _then(_$PermissionInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionInfoImpl implements _PermissionInfo {
  const _$PermissionInfoImpl(
      {this.id, this.name, this.slug, this.description, this.category});

  factory _$PermissionInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionInfoImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? slug;
  @override
  final String? description;
  @override
  final String? category;

  @override
  String toString() {
    return 'PermissionInfo(id: $id, name: $name, slug: $slug, description: $description, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, slug, description, category);

  /// Create a copy of PermissionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionInfoImplCopyWith<_$PermissionInfoImpl> get copyWith =>
      __$$PermissionInfoImplCopyWithImpl<_$PermissionInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionInfoImplToJson(
      this,
    );
  }
}

abstract class _PermissionInfo implements PermissionInfo {
  const factory _PermissionInfo(
      {final int? id,
      final String? name,
      final String? slug,
      final String? description,
      final String? category}) = _$PermissionInfoImpl;

  factory _PermissionInfo.fromJson(Map<String, dynamic> json) =
      _$PermissionInfoImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get slug;
  @override
  String? get description;
  @override
  String? get category;

  /// Create a copy of PermissionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionInfoImplCopyWith<_$PermissionInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
