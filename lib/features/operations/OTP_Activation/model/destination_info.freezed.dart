// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'destination_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DestinationInfo _$DestinationInfoFromJson(Map<String, dynamic> json) {
  return _DestinationInfo.fromJson(json);
}

/// @nodoc
mixin _$DestinationInfo {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String get address => throw _privateConstructorUsedError;

  /// Serializes this DestinationInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DestinationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DestinationInfoCopyWith<DestinationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DestinationInfoCopyWith<$Res> {
  factory $DestinationInfoCopyWith(
          DestinationInfo value, $Res Function(DestinationInfo) then) =
      _$DestinationInfoCopyWithImpl<$Res, DestinationInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'address') String address});
}

/// @nodoc
class _$DestinationInfoCopyWithImpl<$Res, $Val extends DestinationInfo>
    implements $DestinationInfoCopyWith<$Res> {
  _$DestinationInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DestinationInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? phone = null,
    Object? email = null,
    Object? address = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DestinationInfoImplCopyWith<$Res>
    implements $DestinationInfoCopyWith<$Res> {
  factory _$$DestinationInfoImplCopyWith(_$DestinationInfoImpl value,
          $Res Function(_$DestinationInfoImpl) then) =
      __$$DestinationInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'address') String address});
}

/// @nodoc
class __$$DestinationInfoImplCopyWithImpl<$Res>
    extends _$DestinationInfoCopyWithImpl<$Res, _$DestinationInfoImpl>
    implements _$$DestinationInfoImplCopyWith<$Res> {
  __$$DestinationInfoImplCopyWithImpl(
      _$DestinationInfoImpl _value, $Res Function(_$DestinationInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DestinationInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? phone = null,
    Object? email = null,
    Object? address = null,
  }) {
    return _then(_$DestinationInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DestinationInfoImpl implements _DestinationInfo {
  const _$DestinationInfoImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'type') this.type = '',
      @JsonKey(name: 'phone') this.phone = '',
      @JsonKey(name: 'email') this.email = '',
      @JsonKey(name: 'address') this.address = ''});

  factory _$DestinationInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DestinationInfoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'phone')
  final String phone;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'address')
  final String address;

  @override
  String toString() {
    return 'DestinationInfo(id: $id, name: $name, type: $type, phone: $phone, email: $email, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DestinationInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, type, phone, email, address);

  /// Create a copy of DestinationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DestinationInfoImplCopyWith<_$DestinationInfoImpl> get copyWith =>
      __$$DestinationInfoImplCopyWithImpl<_$DestinationInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DestinationInfoImplToJson(
      this,
    );
  }
}

abstract class _DestinationInfo implements DestinationInfo {
  const factory _DestinationInfo(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'type') final String type,
      @JsonKey(name: 'phone') final String phone,
      @JsonKey(name: 'email') final String email,
      @JsonKey(name: 'address') final String address}) = _$DestinationInfoImpl;

  factory _DestinationInfo.fromJson(Map<String, dynamic> json) =
      _$DestinationInfoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'phone')
  String get phone;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'address')
  String get address;

  /// Create a copy of DestinationInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DestinationInfoImplCopyWith<_$DestinationInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
