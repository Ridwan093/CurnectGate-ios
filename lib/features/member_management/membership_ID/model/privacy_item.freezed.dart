// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrivacyItem _$PrivacyItemFromJson(Map<String, dynamic> json) {
  return _PrivacyItem.fromJson(json);
}

/// @nodoc
mixin _$PrivacyItem {
  String? get key => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this PrivacyItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivacyItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivacyItemCopyWith<PrivacyItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyItemCopyWith<$Res> {
  factory $PrivacyItemCopyWith(
          PrivacyItem value, $Res Function(PrivacyItem) then) =
      _$PrivacyItemCopyWithImpl<$Res, PrivacyItem>;
  @useResult
  $Res call(
      {String? key,
      String? name,
      String? type,
      dynamic value,
      String? description});
}

/// @nodoc
class _$PrivacyItemCopyWithImpl<$Res, $Val extends PrivacyItem>
    implements $PrivacyItemCopyWith<$Res> {
  _$PrivacyItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivacyItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? value = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacyItemImplCopyWith<$Res>
    implements $PrivacyItemCopyWith<$Res> {
  factory _$$PrivacyItemImplCopyWith(
          _$PrivacyItemImpl value, $Res Function(_$PrivacyItemImpl) then) =
      __$$PrivacyItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? key,
      String? name,
      String? type,
      dynamic value,
      String? description});
}

/// @nodoc
class __$$PrivacyItemImplCopyWithImpl<$Res>
    extends _$PrivacyItemCopyWithImpl<$Res, _$PrivacyItemImpl>
    implements _$$PrivacyItemImplCopyWith<$Res> {
  __$$PrivacyItemImplCopyWithImpl(
      _$PrivacyItemImpl _value, $Res Function(_$PrivacyItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivacyItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? value = freezed,
    Object? description = freezed,
  }) {
    return _then(_$PrivacyItemImpl(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PrivacyItemImpl implements _PrivacyItem {
  const _$PrivacyItemImpl(
      {this.key, this.name, this.type, this.value, this.description});

  factory _$PrivacyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacyItemImplFromJson(json);

  @override
  final String? key;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final dynamic value;
  @override
  final String? description;

  @override
  String toString() {
    return 'PrivacyItem(key: $key, name: $name, type: $type, value: $value, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyItemImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, name, type,
      const DeepCollectionEquality().hash(value), description);

  /// Create a copy of PrivacyItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacyItemImplCopyWith<_$PrivacyItemImpl> get copyWith =>
      __$$PrivacyItemImplCopyWithImpl<_$PrivacyItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacyItemImplToJson(
      this,
    );
  }
}

abstract class _PrivacyItem implements PrivacyItem {
  const factory _PrivacyItem(
      {final String? key,
      final String? name,
      final String? type,
      final dynamic value,
      final String? description}) = _$PrivacyItemImpl;

  factory _PrivacyItem.fromJson(Map<String, dynamic> json) =
      _$PrivacyItemImpl.fromJson;

  @override
  String? get key;
  @override
  String? get name;
  @override
  String? get type;
  @override
  dynamic get value;
  @override
  String? get description;

  /// Create a copy of PrivacyItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivacyItemImplCopyWith<_$PrivacyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
