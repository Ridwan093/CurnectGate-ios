// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_settings_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConversationSettingsResponse _$ConversationSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return _ConversationSettingsResponse.fromJson(json);
}

/// @nodoc
mixin _$ConversationSettingsResponse {
  String? get message => throw _privateConstructorUsedError;
  ConversationSettingsData? get data => throw _privateConstructorUsedError;

  /// Serializes this ConversationSettingsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConversationSettingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversationSettingsResponseCopyWith<ConversationSettingsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationSettingsResponseCopyWith<$Res> {
  factory $ConversationSettingsResponseCopyWith(
          ConversationSettingsResponse value,
          $Res Function(ConversationSettingsResponse) then) =
      _$ConversationSettingsResponseCopyWithImpl<$Res,
          ConversationSettingsResponse>;
  @useResult
  $Res call({String? message, ConversationSettingsData? data});

  $ConversationSettingsDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ConversationSettingsResponseCopyWithImpl<$Res,
        $Val extends ConversationSettingsResponse>
    implements $ConversationSettingsResponseCopyWith<$Res> {
  _$ConversationSettingsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversationSettingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ConversationSettingsData?,
    ) as $Val);
  }

  /// Create a copy of ConversationSettingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversationSettingsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ConversationSettingsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConversationSettingsResponseImplCopyWith<$Res>
    implements $ConversationSettingsResponseCopyWith<$Res> {
  factory _$$ConversationSettingsResponseImplCopyWith(
          _$ConversationSettingsResponseImpl value,
          $Res Function(_$ConversationSettingsResponseImpl) then) =
      __$$ConversationSettingsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, ConversationSettingsData? data});

  @override
  $ConversationSettingsDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ConversationSettingsResponseImplCopyWithImpl<$Res>
    extends _$ConversationSettingsResponseCopyWithImpl<$Res,
        _$ConversationSettingsResponseImpl>
    implements _$$ConversationSettingsResponseImplCopyWith<$Res> {
  __$$ConversationSettingsResponseImplCopyWithImpl(
      _$ConversationSettingsResponseImpl _value,
      $Res Function(_$ConversationSettingsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConversationSettingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ConversationSettingsResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ConversationSettingsData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ConversationSettingsResponseImpl
    implements _ConversationSettingsResponse {
  const _$ConversationSettingsResponseImpl({this.message, this.data});

  factory _$ConversationSettingsResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConversationSettingsResponseImplFromJson(json);

  @override
  final String? message;
  @override
  final ConversationSettingsData? data;

  @override
  String toString() {
    return 'ConversationSettingsResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationSettingsResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  /// Create a copy of ConversationSettingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationSettingsResponseImplCopyWith<
          _$ConversationSettingsResponseImpl>
      get copyWith => __$$ConversationSettingsResponseImplCopyWithImpl<
          _$ConversationSettingsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationSettingsResponseImplToJson(
      this,
    );
  }
}

abstract class _ConversationSettingsResponse
    implements ConversationSettingsResponse {
  const factory _ConversationSettingsResponse(
          {final String? message, final ConversationSettingsData? data}) =
      _$ConversationSettingsResponseImpl;

  factory _ConversationSettingsResponse.fromJson(Map<String, dynamic> json) =
      _$ConversationSettingsResponseImpl.fromJson;

  @override
  String? get message;
  @override
  ConversationSettingsData? get data;

  /// Create a copy of ConversationSettingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversationSettingsResponseImplCopyWith<
          _$ConversationSettingsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
