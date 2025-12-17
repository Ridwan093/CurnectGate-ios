// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fee_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeeCategory _$FeeCategoryFromJson(Map<String, dynamic> json) {
  return _FeeCategory.fromJson(json);
}

/// @nodoc
mixin _$FeeCategory {
  int? get id => throw _privateConstructorUsedError;
  int? get estateId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get defaultAmount => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get frequency => throw _privateConstructorUsedError;
  bool? get isProRated => throw _privateConstructorUsedError;
  bool? get isMandatory => throw _privateConstructorUsedError;
  bool? get lateFeeApplicable => throw _privateConstructorUsedError;
  int? get gracePeriodDays => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  int? get displayOrder => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  dynamic get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this FeeCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeeCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeeCategoryCopyWith<FeeCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeeCategoryCopyWith<$Res> {
  factory $FeeCategoryCopyWith(
          FeeCategory value, $Res Function(FeeCategory) then) =
      _$FeeCategoryCopyWithImpl<$Res, FeeCategory>;
  @useResult
  $Res call(
      {int? id,
      int? estateId,
      String? name,
      String? slug,
      String? description,
      String? defaultAmount,
      String? icon,
      String? frequency,
      bool? isProRated,
      bool? isMandatory,
      bool? lateFeeApplicable,
      int? gracePeriodDays,
      bool? isActive,
      int? displayOrder,
      String? createdAt,
      String? updatedAt,
      dynamic deletedAt});
}

/// @nodoc
class _$FeeCategoryCopyWithImpl<$Res, $Val extends FeeCategory>
    implements $FeeCategoryCopyWith<$Res> {
  _$FeeCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeeCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? defaultAmount = freezed,
    Object? icon = freezed,
    Object? frequency = freezed,
    Object? isProRated = freezed,
    Object? isMandatory = freezed,
    Object? lateFeeApplicable = freezed,
    Object? gracePeriodDays = freezed,
    Object? isActive = freezed,
    Object? displayOrder = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
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
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultAmount: freezed == defaultAmount
          ? _value.defaultAmount
          : defaultAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String?,
      isProRated: freezed == isProRated
          ? _value.isProRated
          : isProRated // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMandatory: freezed == isMandatory
          ? _value.isMandatory
          : isMandatory // ignore: cast_nullable_to_non_nullable
              as bool?,
      lateFeeApplicable: freezed == lateFeeApplicable
          ? _value.lateFeeApplicable
          : lateFeeApplicable // ignore: cast_nullable_to_non_nullable
              as bool?,
      gracePeriodDays: freezed == gracePeriodDays
          ? _value.gracePeriodDays
          : gracePeriodDays // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      displayOrder: freezed == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeeCategoryImplCopyWith<$Res>
    implements $FeeCategoryCopyWith<$Res> {
  factory _$$FeeCategoryImplCopyWith(
          _$FeeCategoryImpl value, $Res Function(_$FeeCategoryImpl) then) =
      __$$FeeCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? estateId,
      String? name,
      String? slug,
      String? description,
      String? defaultAmount,
      String? icon,
      String? frequency,
      bool? isProRated,
      bool? isMandatory,
      bool? lateFeeApplicable,
      int? gracePeriodDays,
      bool? isActive,
      int? displayOrder,
      String? createdAt,
      String? updatedAt,
      dynamic deletedAt});
}

/// @nodoc
class __$$FeeCategoryImplCopyWithImpl<$Res>
    extends _$FeeCategoryCopyWithImpl<$Res, _$FeeCategoryImpl>
    implements _$$FeeCategoryImplCopyWith<$Res> {
  __$$FeeCategoryImplCopyWithImpl(
      _$FeeCategoryImpl _value, $Res Function(_$FeeCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeeCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? defaultAmount = freezed,
    Object? icon = freezed,
    Object? frequency = freezed,
    Object? isProRated = freezed,
    Object? isMandatory = freezed,
    Object? lateFeeApplicable = freezed,
    Object? gracePeriodDays = freezed,
    Object? isActive = freezed,
    Object? displayOrder = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_$FeeCategoryImpl(
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
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultAmount: freezed == defaultAmount
          ? _value.defaultAmount
          : defaultAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String?,
      isProRated: freezed == isProRated
          ? _value.isProRated
          : isProRated // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMandatory: freezed == isMandatory
          ? _value.isMandatory
          : isMandatory // ignore: cast_nullable_to_non_nullable
              as bool?,
      lateFeeApplicable: freezed == lateFeeApplicable
          ? _value.lateFeeApplicable
          : lateFeeApplicable // ignore: cast_nullable_to_non_nullable
              as bool?,
      gracePeriodDays: freezed == gracePeriodDays
          ? _value.gracePeriodDays
          : gracePeriodDays // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      displayOrder: freezed == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$FeeCategoryImpl implements _FeeCategory {
  const _$FeeCategoryImpl(
      {this.id,
      this.estateId,
      this.name,
      this.slug,
      this.description,
      this.defaultAmount,
      this.icon,
      this.frequency,
      this.isProRated,
      this.isMandatory,
      this.lateFeeApplicable,
      this.gracePeriodDays,
      this.isActive,
      this.displayOrder,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  factory _$FeeCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeeCategoryImplFromJson(json);

  @override
  final int? id;
  @override
  final int? estateId;
  @override
  final String? name;
  @override
  final String? slug;
  @override
  final String? description;
  @override
  final String? defaultAmount;
  @override
  final String? icon;
  @override
  final String? frequency;
  @override
  final bool? isProRated;
  @override
  final bool? isMandatory;
  @override
  final bool? lateFeeApplicable;
  @override
  final int? gracePeriodDays;
  @override
  final bool? isActive;
  @override
  final int? displayOrder;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final dynamic deletedAt;

  @override
  String toString() {
    return 'FeeCategory(id: $id, estateId: $estateId, name: $name, slug: $slug, description: $description, defaultAmount: $defaultAmount, icon: $icon, frequency: $frequency, isProRated: $isProRated, isMandatory: $isMandatory, lateFeeApplicable: $lateFeeApplicable, gracePeriodDays: $gracePeriodDays, isActive: $isActive, displayOrder: $displayOrder, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeeCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.defaultAmount, defaultAmount) ||
                other.defaultAmount == defaultAmount) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.isProRated, isProRated) ||
                other.isProRated == isProRated) &&
            (identical(other.isMandatory, isMandatory) ||
                other.isMandatory == isMandatory) &&
            (identical(other.lateFeeApplicable, lateFeeApplicable) ||
                other.lateFeeApplicable == lateFeeApplicable) &&
            (identical(other.gracePeriodDays, gracePeriodDays) ||
                other.gracePeriodDays == gracePeriodDays) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      estateId,
      name,
      slug,
      description,
      defaultAmount,
      icon,
      frequency,
      isProRated,
      isMandatory,
      lateFeeApplicable,
      gracePeriodDays,
      isActive,
      displayOrder,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(deletedAt));

  /// Create a copy of FeeCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeeCategoryImplCopyWith<_$FeeCategoryImpl> get copyWith =>
      __$$FeeCategoryImplCopyWithImpl<_$FeeCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeeCategoryImplToJson(
      this,
    );
  }
}

abstract class _FeeCategory implements FeeCategory {
  const factory _FeeCategory(
      {final int? id,
      final int? estateId,
      final String? name,
      final String? slug,
      final String? description,
      final String? defaultAmount,
      final String? icon,
      final String? frequency,
      final bool? isProRated,
      final bool? isMandatory,
      final bool? lateFeeApplicable,
      final int? gracePeriodDays,
      final bool? isActive,
      final int? displayOrder,
      final String? createdAt,
      final String? updatedAt,
      final dynamic deletedAt}) = _$FeeCategoryImpl;

  factory _FeeCategory.fromJson(Map<String, dynamic> json) =
      _$FeeCategoryImpl.fromJson;

  @override
  int? get id;
  @override
  int? get estateId;
  @override
  String? get name;
  @override
  String? get slug;
  @override
  String? get description;
  @override
  String? get defaultAmount;
  @override
  String? get icon;
  @override
  String? get frequency;
  @override
  bool? get isProRated;
  @override
  bool? get isMandatory;
  @override
  bool? get lateFeeApplicable;
  @override
  int? get gracePeriodDays;
  @override
  bool? get isActive;
  @override
  int? get displayOrder;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  dynamic get deletedAt;

  /// Create a copy of FeeCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeeCategoryImplCopyWith<_$FeeCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
