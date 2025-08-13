// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Estate _$EstateFromJson(Map<String, dynamic> json) {
  return _Estate.fromJson(json);
}

/// @nodoc
mixin _$Estate {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate_code')
  String get estateCode => throw _privateConstructorUsedError;

  /// Serializes this Estate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstateCopyWith<Estate> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstateCopyWith<$Res> {
  factory $EstateCopyWith(Estate value, $Res Function(Estate) then) =
      _$EstateCopyWithImpl<$Res, Estate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'estate_code') String estateCode});
}

/// @nodoc
class _$EstateCopyWithImpl<$Res, $Val extends Estate>
    implements $EstateCopyWith<$Res> {
  _$EstateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? estateCode = null,
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
      estateCode: null == estateCode
          ? _value.estateCode
          : estateCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EstateImplCopyWith<$Res> implements $EstateCopyWith<$Res> {
  factory _$$EstateImplCopyWith(
          _$EstateImpl value, $Res Function(_$EstateImpl) then) =
      __$$EstateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'estate_code') String estateCode});
}

/// @nodoc
class __$$EstateImplCopyWithImpl<$Res>
    extends _$EstateCopyWithImpl<$Res, _$EstateImpl>
    implements _$$EstateImplCopyWith<$Res> {
  __$$EstateImplCopyWithImpl(
      _$EstateImpl _value, $Res Function(_$EstateImpl) _then)
      : super(_value, _then);

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? estateCode = null,
  }) {
    return _then(_$EstateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      estateCode: null == estateCode
          ? _value.estateCode
          : estateCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$EstateImpl implements _Estate {
  const _$EstateImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'estate_code') required this.estateCode});

  factory _$EstateImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstateImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'estate_code')
  final String estateCode;

  @override
  String toString() {
    return 'Estate(id: $id, name: $name, estateCode: $estateCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.estateCode, estateCode) ||
                other.estateCode == estateCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, estateCode);

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstateImplCopyWith<_$EstateImpl> get copyWith =>
      __$$EstateImplCopyWithImpl<_$EstateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstateImplToJson(
      this,
    );
  }
}

abstract class _Estate implements Estate {
  const factory _Estate(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'estate_code') required final String estateCode}) =
      _$EstateImpl;

  factory _Estate.fromJson(Map<String, dynamic> json) = _$EstateImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'estate_code')
  String get estateCode;

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstateImplCopyWith<_$EstateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
