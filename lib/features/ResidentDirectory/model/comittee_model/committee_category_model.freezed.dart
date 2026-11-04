// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'committee_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommitteeCategory _$CommitteeCategoryFromJson(Map<String, dynamic> json) {
  return _CommitteeCategory.fromJson(json);
}

/// @nodoc
mixin _$CommitteeCategory {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get estateId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get colorCode => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CommitteeCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommitteeCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommitteeCategoryCopyWith<CommitteeCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommitteeCategoryCopyWith<$Res> {
  factory $CommitteeCategoryCopyWith(
          CommitteeCategory value, $Res Function(CommitteeCategory) then) =
      _$CommitteeCategoryCopyWithImpl<$Res, CommitteeCategory>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? estateId,
      String? description,
      String? colorCode,
      bool? isActive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CommitteeCategoryCopyWithImpl<$Res, $Val extends CommitteeCategory>
    implements $CommitteeCategoryCopyWith<$Res> {
  _$CommitteeCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommitteeCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? estateId = freezed,
    Object? description = freezed,
    Object? colorCode = freezed,
    Object? isActive = freezed,
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
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      colorCode: freezed == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$CommitteeCategoryImplCopyWith<$Res>
    implements $CommitteeCategoryCopyWith<$Res> {
  factory _$$CommitteeCategoryImplCopyWith(_$CommitteeCategoryImpl value,
          $Res Function(_$CommitteeCategoryImpl) then) =
      __$$CommitteeCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? estateId,
      String? description,
      String? colorCode,
      bool? isActive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$CommitteeCategoryImplCopyWithImpl<$Res>
    extends _$CommitteeCategoryCopyWithImpl<$Res, _$CommitteeCategoryImpl>
    implements _$$CommitteeCategoryImplCopyWith<$Res> {
  __$$CommitteeCategoryImplCopyWithImpl(_$CommitteeCategoryImpl _value,
      $Res Function(_$CommitteeCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommitteeCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? estateId = freezed,
    Object? description = freezed,
    Object? colorCode = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CommitteeCategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      colorCode: freezed == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
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

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CommitteeCategoryImpl implements _CommitteeCategory {
  const _$CommitteeCategoryImpl(
      {this.id,
      this.name,
      this.estateId,
      this.description,
      this.colorCode,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  factory _$CommitteeCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommitteeCategoryImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? estateId;
  @override
  final String? description;
  @override
  final String? colorCode;
  @override
  final bool? isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CommitteeCategory(id: $id, name: $name, estateId: $estateId, description: $description, colorCode: $colorCode, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommitteeCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, estateId, description,
      colorCode, isActive, createdAt, updatedAt);

  /// Create a copy of CommitteeCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommitteeCategoryImplCopyWith<_$CommitteeCategoryImpl> get copyWith =>
      __$$CommitteeCategoryImplCopyWithImpl<_$CommitteeCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommitteeCategoryImplToJson(
      this,
    );
  }
}

abstract class _CommitteeCategory implements CommitteeCategory {
  const factory _CommitteeCategory(
      {final int? id,
      final String? name,
      final int? estateId,
      final String? description,
      final String? colorCode,
      final bool? isActive,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CommitteeCategoryImpl;

  factory _CommitteeCategory.fromJson(Map<String, dynamic> json) =
      _$CommitteeCategoryImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get estateId;
  @override
  String? get description;
  @override
  String? get colorCode;
  @override
  bool? get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of CommitteeCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommitteeCategoryImplCopyWith<_$CommitteeCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
