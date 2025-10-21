// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permit_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PermitItem _$PermitItemFromJson(Map<String, dynamic> json) {
  return _PermitItem.fromJson(json);
}

/// @nodoc
mixin _$PermitItem {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  dynamic get estimatedValue => throw _privateConstructorUsedError;

  /// Serializes this PermitItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PermitItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermitItemCopyWith<PermitItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermitItemCopyWith<$Res> {
  factory $PermitItemCopyWith(
          PermitItem value, $Res Function(PermitItem) then) =
      _$PermitItemCopyWithImpl<$Res, PermitItem>;
  @useResult
  $Res call(
      {int? id, String? name, String? description, dynamic estimatedValue});
}

/// @nodoc
class _$PermitItemCopyWithImpl<$Res, $Val extends PermitItem>
    implements $PermitItemCopyWith<$Res> {
  _$PermitItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermitItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? estimatedValue = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedValue: freezed == estimatedValue
          ? _value.estimatedValue
          : estimatedValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermitItemImplCopyWith<$Res>
    implements $PermitItemCopyWith<$Res> {
  factory _$$PermitItemImplCopyWith(
          _$PermitItemImpl value, $Res Function(_$PermitItemImpl) then) =
      __$$PermitItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id, String? name, String? description, dynamic estimatedValue});
}

/// @nodoc
class __$$PermitItemImplCopyWithImpl<$Res>
    extends _$PermitItemCopyWithImpl<$Res, _$PermitItemImpl>
    implements _$$PermitItemImplCopyWith<$Res> {
  __$$PermitItemImplCopyWithImpl(
      _$PermitItemImpl _value, $Res Function(_$PermitItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of PermitItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? estimatedValue = freezed,
  }) {
    return _then(_$PermitItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedValue: freezed == estimatedValue
          ? _value.estimatedValue
          : estimatedValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PermitItemImpl implements _PermitItem {
  const _$PermitItemImpl(
      {this.id, this.name, this.description, this.estimatedValue});

  factory _$PermitItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermitItemImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final dynamic estimatedValue;

  @override
  String toString() {
    return 'PermitItem(id: $id, name: $name, description: $description, estimatedValue: $estimatedValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermitItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.estimatedValue, estimatedValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      const DeepCollectionEquality().hash(estimatedValue));

  /// Create a copy of PermitItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermitItemImplCopyWith<_$PermitItemImpl> get copyWith =>
      __$$PermitItemImplCopyWithImpl<_$PermitItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermitItemImplToJson(
      this,
    );
  }
}

abstract class _PermitItem implements PermitItem {
  const factory _PermitItem(
      {final int? id,
      final String? name,
      final String? description,
      final dynamic estimatedValue}) = _$PermitItemImpl;

  factory _PermitItem.fromJson(Map<String, dynamic> json) =
      _$PermitItemImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  dynamic get estimatedValue;

  /// Create a copy of PermitItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermitItemImplCopyWith<_$PermitItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
