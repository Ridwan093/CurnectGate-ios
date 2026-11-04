// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curfew_member_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurfewMember _$CurfewMemberFromJson(Map<String, dynamic> json) {
  return _CurfewMember.fromJson(json);
}

/// @nodoc
mixin _$CurfewMember {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this CurfewMember to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurfewMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurfewMemberCopyWith<CurfewMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurfewMemberCopyWith<$Res> {
  factory $CurfewMemberCopyWith(
          CurfewMember value, $Res Function(CurfewMember) then) =
      _$CurfewMemberCopyWithImpl<$Res, CurfewMember>;
  @useResult
  $Res call({int? id, String? name, String? email});
}

/// @nodoc
class _$CurfewMemberCopyWithImpl<$Res, $Val extends CurfewMember>
    implements $CurfewMemberCopyWith<$Res> {
  _$CurfewMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurfewMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurfewMemberImplCopyWith<$Res>
    implements $CurfewMemberCopyWith<$Res> {
  factory _$$CurfewMemberImplCopyWith(
          _$CurfewMemberImpl value, $Res Function(_$CurfewMemberImpl) then) =
      __$$CurfewMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? email});
}

/// @nodoc
class __$$CurfewMemberImplCopyWithImpl<$Res>
    extends _$CurfewMemberCopyWithImpl<$Res, _$CurfewMemberImpl>
    implements _$$CurfewMemberImplCopyWith<$Res> {
  __$$CurfewMemberImplCopyWithImpl(
      _$CurfewMemberImpl _value, $Res Function(_$CurfewMemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurfewMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_$CurfewMemberImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CurfewMemberImpl implements _CurfewMember {
  const _$CurfewMemberImpl({this.id, this.name, this.email});

  factory _$CurfewMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurfewMemberImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;

  @override
  String toString() {
    return 'CurfewMember(id: $id, name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurfewMemberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email);

  /// Create a copy of CurfewMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurfewMemberImplCopyWith<_$CurfewMemberImpl> get copyWith =>
      __$$CurfewMemberImplCopyWithImpl<_$CurfewMemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurfewMemberImplToJson(
      this,
    );
  }
}

abstract class _CurfewMember implements CurfewMember {
  const factory _CurfewMember(
      {final int? id,
      final String? name,
      final String? email}) = _$CurfewMemberImpl;

  factory _CurfewMember.fromJson(Map<String, dynamic> json) =
      _$CurfewMemberImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get email;

  /// Create a copy of CurfewMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurfewMemberImplCopyWith<_$CurfewMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
