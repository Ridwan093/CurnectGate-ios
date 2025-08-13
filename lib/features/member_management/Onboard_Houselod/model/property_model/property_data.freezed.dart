// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PropertyData _$PropertyDataFromJson(Map<String, dynamic> json) {
  return _PropertyData.fromJson(json);
}

/// @nodoc
mixin _$PropertyData {
  @JsonKey(name: 'properties')
  List<Property> get properties => throw _privateConstructorUsedError;

  /// Serializes this PropertyData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PropertyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyDataCopyWith<PropertyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyDataCopyWith<$Res> {
  factory $PropertyDataCopyWith(
          PropertyData value, $Res Function(PropertyData) then) =
      _$PropertyDataCopyWithImpl<$Res, PropertyData>;
  @useResult
  $Res call({@JsonKey(name: 'properties') List<Property> properties});
}

/// @nodoc
class _$PropertyDataCopyWithImpl<$Res, $Val extends PropertyData>
    implements $PropertyDataCopyWith<$Res> {
  _$PropertyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PropertyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? properties = null,
  }) {
    return _then(_value.copyWith(
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<Property>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PropertyDataImplCopyWith<$Res>
    implements $PropertyDataCopyWith<$Res> {
  factory _$$PropertyDataImplCopyWith(
          _$PropertyDataImpl value, $Res Function(_$PropertyDataImpl) then) =
      __$$PropertyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'properties') List<Property> properties});
}

/// @nodoc
class __$$PropertyDataImplCopyWithImpl<$Res>
    extends _$PropertyDataCopyWithImpl<$Res, _$PropertyDataImpl>
    implements _$$PropertyDataImplCopyWith<$Res> {
  __$$PropertyDataImplCopyWithImpl(
      _$PropertyDataImpl _value, $Res Function(_$PropertyDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PropertyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? properties = null,
  }) {
    return _then(_$PropertyDataImpl(
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<Property>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PropertyDataImpl implements _PropertyData {
  const _$PropertyDataImpl(
      {@JsonKey(name: 'properties') required final List<Property> properties})
      : _properties = properties;

  factory _$PropertyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyDataImplFromJson(json);

  final List<Property> _properties;
  @override
  @JsonKey(name: 'properties')
  List<Property> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  String toString() {
    return 'PropertyData(properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyDataImpl &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_properties));

  /// Create a copy of PropertyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyDataImplCopyWith<_$PropertyDataImpl> get copyWith =>
      __$$PropertyDataImplCopyWithImpl<_$PropertyDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyDataImplToJson(
      this,
    );
  }
}

abstract class _PropertyData implements PropertyData {
  const factory _PropertyData(
      {@JsonKey(name: 'properties')
      required final List<Property> properties}) = _$PropertyDataImpl;

  factory _PropertyData.fromJson(Map<String, dynamic> json) =
      _$PropertyDataImpl.fromJson;

  @override
  @JsonKey(name: 'properties')
  List<Property> get properties;

  /// Create a copy of PropertyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyDataImplCopyWith<_$PropertyDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
