// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'granted_by_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GrantedBy _$GrantedByFromJson(Map<String, dynamic> json) {
  return _GrantedBy.fromJson(json);
}

/// @nodoc
mixin _$GrantedBy {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this GrantedBy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GrantedBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GrantedByCopyWith<GrantedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrantedByCopyWith<$Res> {
  factory $GrantedByCopyWith(GrantedBy value, $Res Function(GrantedBy) then) =
      _$GrantedByCopyWithImpl<$Res, GrantedBy>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$GrantedByCopyWithImpl<$Res, $Val extends GrantedBy>
    implements $GrantedByCopyWith<$Res> {
  _$GrantedByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GrantedBy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GrantedByImplCopyWith<$Res>
    implements $GrantedByCopyWith<$Res> {
  factory _$$GrantedByImplCopyWith(
          _$GrantedByImpl value, $Res Function(_$GrantedByImpl) then) =
      __$$GrantedByImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$GrantedByImplCopyWithImpl<$Res>
    extends _$GrantedByCopyWithImpl<$Res, _$GrantedByImpl>
    implements _$$GrantedByImplCopyWith<$Res> {
  __$$GrantedByImplCopyWithImpl(
      _$GrantedByImpl _value, $Res Function(_$GrantedByImpl) _then)
      : super(_value, _then);

  /// Create a copy of GrantedBy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$GrantedByImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GrantedByImpl implements _GrantedBy {
  const _$GrantedByImpl({this.id, this.name});

  factory _$GrantedByImpl.fromJson(Map<String, dynamic> json) =>
      _$$GrantedByImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'GrantedBy(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GrantedByImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of GrantedBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GrantedByImplCopyWith<_$GrantedByImpl> get copyWith =>
      __$$GrantedByImplCopyWithImpl<_$GrantedByImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GrantedByImplToJson(
      this,
    );
  }
}

abstract class _GrantedBy implements GrantedBy {
  const factory _GrantedBy({final int? id, final String? name}) =
      _$GrantedByImpl;

  factory _GrantedBy.fromJson(Map<String, dynamic> json) =
      _$GrantedByImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of GrantedBy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GrantedByImplCopyWith<_$GrantedByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
