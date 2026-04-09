// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(fromJson: NullSafetyHelper.safeInt)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: NullSafetyHelper.safeString)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_code', fromJson: NullSafetyHelper.safeString)
  String? get memberCode => throw _privateConstructorUsedError;
  @JsonKey(fromJson: NullSafetyHelper.safeString)
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_self', fromJson: NullSafetyHelper.safeBool)
  bool get isSelf => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_current_user', fromJson: NullSafetyHelper.safeBool)
  bool? get isCurrentUser => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: NullSafetyHelper.safeInt) int id,
      @JsonKey(fromJson: NullSafetyHelper.safeString) String name,
      @JsonKey(name: 'member_code', fromJson: NullSafetyHelper.safeString)
      String? memberCode,
      @JsonKey(fromJson: NullSafetyHelper.safeString) String role,
      @JsonKey(name: 'is_self', fromJson: NullSafetyHelper.safeBool)
      bool isSelf,
      @JsonKey(name: 'is_current_user', fromJson: NullSafetyHelper.safeBool)
      bool? isCurrentUser});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? memberCode = freezed,
    Object? role = null,
    Object? isSelf = null,
    Object? isCurrentUser = freezed,
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
      memberCode: freezed == memberCode
          ? _value.memberCode
          : memberCode // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isSelf: null == isSelf
          ? _value.isSelf
          : isSelf // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurrentUser: freezed == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: NullSafetyHelper.safeInt) int id,
      @JsonKey(fromJson: NullSafetyHelper.safeString) String name,
      @JsonKey(name: 'member_code', fromJson: NullSafetyHelper.safeString)
      String? memberCode,
      @JsonKey(fromJson: NullSafetyHelper.safeString) String role,
      @JsonKey(name: 'is_self', fromJson: NullSafetyHelper.safeBool)
      bool isSelf,
      @JsonKey(name: 'is_current_user', fromJson: NullSafetyHelper.safeBool)
      bool? isCurrentUser});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? memberCode = freezed,
    Object? role = null,
    Object? isSelf = null,
    Object? isCurrentUser = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      memberCode: freezed == memberCode
          ? _value.memberCode
          : memberCode // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isSelf: null == isSelf
          ? _value.isSelf
          : isSelf // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurrentUser: freezed == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(fromJson: NullSafetyHelper.safeInt) this.id = 0,
      @JsonKey(fromJson: NullSafetyHelper.safeString) this.name = '',
      @JsonKey(name: 'member_code', fromJson: NullSafetyHelper.safeString)
      this.memberCode,
      @JsonKey(fromJson: NullSafetyHelper.safeString) this.role = '',
      @JsonKey(name: 'is_self', fromJson: NullSafetyHelper.safeBool)
      this.isSelf = false,
      @JsonKey(name: 'is_current_user', fromJson: NullSafetyHelper.safeBool)
      this.isCurrentUser});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(fromJson: NullSafetyHelper.safeInt)
  final int id;
  @override
  @JsonKey(fromJson: NullSafetyHelper.safeString)
  final String name;
  @override
  @JsonKey(name: 'member_code', fromJson: NullSafetyHelper.safeString)
  final String? memberCode;
  @override
  @JsonKey(fromJson: NullSafetyHelper.safeString)
  final String role;
  @override
  @JsonKey(name: 'is_self', fromJson: NullSafetyHelper.safeBool)
  final bool isSelf;
  @override
  @JsonKey(name: 'is_current_user', fromJson: NullSafetyHelper.safeBool)
  final bool? isCurrentUser;

  @override
  String toString() {
    return 'User(id: $id, name: $name, memberCode: $memberCode, role: $role, isSelf: $isSelf, isCurrentUser: $isCurrentUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.memberCode, memberCode) ||
                other.memberCode == memberCode) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.isSelf, isSelf) || other.isSelf == isSelf) &&
            (identical(other.isCurrentUser, isCurrentUser) ||
                other.isCurrentUser == isCurrentUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, memberCode, role, isSelf, isCurrentUser);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(fromJson: NullSafetyHelper.safeInt) final int id,
      @JsonKey(fromJson: NullSafetyHelper.safeString) final String name,
      @JsonKey(name: 'member_code', fromJson: NullSafetyHelper.safeString)
      final String? memberCode,
      @JsonKey(fromJson: NullSafetyHelper.safeString) final String role,
      @JsonKey(name: 'is_self', fromJson: NullSafetyHelper.safeBool)
      final bool isSelf,
      @JsonKey(name: 'is_current_user', fromJson: NullSafetyHelper.safeBool)
      final bool? isCurrentUser}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(fromJson: NullSafetyHelper.safeInt)
  int get id;
  @override
  @JsonKey(fromJson: NullSafetyHelper.safeString)
  String get name;
  @override
  @JsonKey(name: 'member_code', fromJson: NullSafetyHelper.safeString)
  String? get memberCode;
  @override
  @JsonKey(fromJson: NullSafetyHelper.safeString)
  String get role;
  @override
  @JsonKey(name: 'is_self', fromJson: NullSafetyHelper.safeBool)
  bool get isSelf;
  @override
  @JsonKey(name: 'is_current_user', fromJson: NullSafetyHelper.safeBool)
  bool? get isCurrentUser;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
