// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkOrderCategory _$WorkOrderCategoryFromJson(Map<String, dynamic> json) {
  return _WorkOrderCategory.fromJson(json);
}

/// @nodoc
mixin _$WorkOrderCategory {
  int? get id => throw _privateConstructorUsedError;
  int? get estateId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this WorkOrderCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkOrderCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkOrderCategoryCopyWith<WorkOrderCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrderCategoryCopyWith<$Res> {
  factory $WorkOrderCategoryCopyWith(
          WorkOrderCategory value, $Res Function(WorkOrderCategory) then) =
      _$WorkOrderCategoryCopyWithImpl<$Res, WorkOrderCategory>;
  @useResult
  $Res call(
      {int? id,
      int? estateId,
      String? name,
      String? status,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$WorkOrderCategoryCopyWithImpl<$Res, $Val extends WorkOrderCategory>
    implements $WorkOrderCategoryCopyWith<$Res> {
  _$WorkOrderCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkOrderCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
abstract class _$$WorkOrderCategoryImplCopyWith<$Res>
    implements $WorkOrderCategoryCopyWith<$Res> {
  factory _$$WorkOrderCategoryImplCopyWith(_$WorkOrderCategoryImpl value,
          $Res Function(_$WorkOrderCategoryImpl) then) =
      __$$WorkOrderCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? estateId,
      String? name,
      String? status,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$WorkOrderCategoryImplCopyWithImpl<$Res>
    extends _$WorkOrderCategoryCopyWithImpl<$Res, _$WorkOrderCategoryImpl>
    implements _$$WorkOrderCategoryImplCopyWith<$Res> {
  __$$WorkOrderCategoryImplCopyWithImpl(_$WorkOrderCategoryImpl _value,
      $Res Function(_$WorkOrderCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkOrderCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$WorkOrderCategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
class _$WorkOrderCategoryImpl implements _WorkOrderCategory {
  const _$WorkOrderCategoryImpl(
      {this.id,
      this.estateId,
      this.name,
      this.status,
      this.createdAt,
      this.updatedAt});

  factory _$WorkOrderCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkOrderCategoryImplFromJson(json);

  @override
  final int? id;
  @override
  final int? estateId;
  @override
  final String? name;
  @override
  final String? status;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'WorkOrderCategory(id: $id, estateId: $estateId, name: $name, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrderCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, estateId, name, status, createdAt, updatedAt);

  /// Create a copy of WorkOrderCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOrderCategoryImplCopyWith<_$WorkOrderCategoryImpl> get copyWith =>
      __$$WorkOrderCategoryImplCopyWithImpl<_$WorkOrderCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkOrderCategoryImplToJson(
      this,
    );
  }
}

abstract class _WorkOrderCategory implements WorkOrderCategory {
  const factory _WorkOrderCategory(
      {final int? id,
      final int? estateId,
      final String? name,
      final String? status,
      final String? createdAt,
      final String? updatedAt}) = _$WorkOrderCategoryImpl;

  factory _WorkOrderCategory.fromJson(Map<String, dynamic> json) =
      _$WorkOrderCategoryImpl.fromJson;

  @override
  int? get id;
  @override
  int? get estateId;
  @override
  String? get name;
  @override
  String? get status;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of WorkOrderCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkOrderCategoryImplCopyWith<_$WorkOrderCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
