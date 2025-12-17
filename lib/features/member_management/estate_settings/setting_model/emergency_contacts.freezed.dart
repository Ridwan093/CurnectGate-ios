// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_contacts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmergencyContacts _$EmergencyContactsFromJson(Map<String, dynamic> json) {
  return _EmergencyContacts.fromJson(json);
}

/// @nodoc
mixin _$EmergencyContacts {
  List<String>? get police => throw _privateConstructorUsedError;
  List<String>? get estateManagement => throw _privateConstructorUsedError;
  List<String>? get fireAlarm => throw _privateConstructorUsedError;
  List<String>? get ambulance => throw _privateConstructorUsedError;

  /// Serializes this EmergencyContacts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmergencyContacts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmergencyContactsCopyWith<EmergencyContacts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyContactsCopyWith<$Res> {
  factory $EmergencyContactsCopyWith(
          EmergencyContacts value, $Res Function(EmergencyContacts) then) =
      _$EmergencyContactsCopyWithImpl<$Res, EmergencyContacts>;
  @useResult
  $Res call(
      {List<String>? police,
      List<String>? estateManagement,
      List<String>? fireAlarm,
      List<String>? ambulance});
}

/// @nodoc
class _$EmergencyContactsCopyWithImpl<$Res, $Val extends EmergencyContacts>
    implements $EmergencyContactsCopyWith<$Res> {
  _$EmergencyContactsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmergencyContacts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? police = freezed,
    Object? estateManagement = freezed,
    Object? fireAlarm = freezed,
    Object? ambulance = freezed,
  }) {
    return _then(_value.copyWith(
      police: freezed == police
          ? _value.police
          : police // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      estateManagement: freezed == estateManagement
          ? _value.estateManagement
          : estateManagement // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      fireAlarm: freezed == fireAlarm
          ? _value.fireAlarm
          : fireAlarm // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ambulance: freezed == ambulance
          ? _value.ambulance
          : ambulance // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmergencyContactsImplCopyWith<$Res>
    implements $EmergencyContactsCopyWith<$Res> {
  factory _$$EmergencyContactsImplCopyWith(_$EmergencyContactsImpl value,
          $Res Function(_$EmergencyContactsImpl) then) =
      __$$EmergencyContactsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? police,
      List<String>? estateManagement,
      List<String>? fireAlarm,
      List<String>? ambulance});
}

/// @nodoc
class __$$EmergencyContactsImplCopyWithImpl<$Res>
    extends _$EmergencyContactsCopyWithImpl<$Res, _$EmergencyContactsImpl>
    implements _$$EmergencyContactsImplCopyWith<$Res> {
  __$$EmergencyContactsImplCopyWithImpl(_$EmergencyContactsImpl _value,
      $Res Function(_$EmergencyContactsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmergencyContacts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? police = freezed,
    Object? estateManagement = freezed,
    Object? fireAlarm = freezed,
    Object? ambulance = freezed,
  }) {
    return _then(_$EmergencyContactsImpl(
      police: freezed == police
          ? _value._police
          : police // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      estateManagement: freezed == estateManagement
          ? _value._estateManagement
          : estateManagement // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      fireAlarm: freezed == fireAlarm
          ? _value._fireAlarm
          : fireAlarm // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ambulance: freezed == ambulance
          ? _value._ambulance
          : ambulance // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$EmergencyContactsImpl implements _EmergencyContacts {
  const _$EmergencyContactsImpl(
      {final List<String>? police,
      final List<String>? estateManagement,
      final List<String>? fireAlarm,
      final List<String>? ambulance})
      : _police = police,
        _estateManagement = estateManagement,
        _fireAlarm = fireAlarm,
        _ambulance = ambulance;

  factory _$EmergencyContactsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmergencyContactsImplFromJson(json);

  final List<String>? _police;
  @override
  List<String>? get police {
    final value = _police;
    if (value == null) return null;
    if (_police is EqualUnmodifiableListView) return _police;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _estateManagement;
  @override
  List<String>? get estateManagement {
    final value = _estateManagement;
    if (value == null) return null;
    if (_estateManagement is EqualUnmodifiableListView)
      return _estateManagement;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _fireAlarm;
  @override
  List<String>? get fireAlarm {
    final value = _fireAlarm;
    if (value == null) return null;
    if (_fireAlarm is EqualUnmodifiableListView) return _fireAlarm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _ambulance;
  @override
  List<String>? get ambulance {
    final value = _ambulance;
    if (value == null) return null;
    if (_ambulance is EqualUnmodifiableListView) return _ambulance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EmergencyContacts(police: $police, estateManagement: $estateManagement, fireAlarm: $fireAlarm, ambulance: $ambulance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmergencyContactsImpl &&
            const DeepCollectionEquality().equals(other._police, _police) &&
            const DeepCollectionEquality()
                .equals(other._estateManagement, _estateManagement) &&
            const DeepCollectionEquality()
                .equals(other._fireAlarm, _fireAlarm) &&
            const DeepCollectionEquality()
                .equals(other._ambulance, _ambulance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_police),
      const DeepCollectionEquality().hash(_estateManagement),
      const DeepCollectionEquality().hash(_fireAlarm),
      const DeepCollectionEquality().hash(_ambulance));

  /// Create a copy of EmergencyContacts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmergencyContactsImplCopyWith<_$EmergencyContactsImpl> get copyWith =>
      __$$EmergencyContactsImplCopyWithImpl<_$EmergencyContactsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmergencyContactsImplToJson(
      this,
    );
  }
}

abstract class _EmergencyContacts implements EmergencyContacts {
  const factory _EmergencyContacts(
      {final List<String>? police,
      final List<String>? estateManagement,
      final List<String>? fireAlarm,
      final List<String>? ambulance}) = _$EmergencyContactsImpl;

  factory _EmergencyContacts.fromJson(Map<String, dynamic> json) =
      _$EmergencyContactsImpl.fromJson;

  @override
  List<String>? get police;
  @override
  List<String>? get estateManagement;
  @override
  List<String>? get fireAlarm;
  @override
  List<String>? get ambulance;

  /// Create a copy of EmergencyContacts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmergencyContactsImplCopyWith<_$EmergencyContactsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
