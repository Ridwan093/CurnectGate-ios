// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visitorinvitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VisitorInvitation _$VisitorInvitationFromJson(Map<String, dynamic> json) {
  return _VisitorInvitation.fromJson(json);
}

/// @nodoc
mixin _$VisitorInvitation {
  bool? get enabled => throw _privateConstructorUsedError;

  /// Serializes this VisitorInvitation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VisitorInvitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitorInvitationCopyWith<VisitorInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorInvitationCopyWith<$Res> {
  factory $VisitorInvitationCopyWith(
          VisitorInvitation value, $Res Function(VisitorInvitation) then) =
      _$VisitorInvitationCopyWithImpl<$Res, VisitorInvitation>;
  @useResult
  $Res call({bool? enabled});
}

/// @nodoc
class _$VisitorInvitationCopyWithImpl<$Res, $Val extends VisitorInvitation>
    implements $VisitorInvitationCopyWith<$Res> {
  _$VisitorInvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisitorInvitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = freezed,
  }) {
    return _then(_value.copyWith(
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisitorInvitationImplCopyWith<$Res>
    implements $VisitorInvitationCopyWith<$Res> {
  factory _$$VisitorInvitationImplCopyWith(_$VisitorInvitationImpl value,
          $Res Function(_$VisitorInvitationImpl) then) =
      __$$VisitorInvitationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? enabled});
}

/// @nodoc
class __$$VisitorInvitationImplCopyWithImpl<$Res>
    extends _$VisitorInvitationCopyWithImpl<$Res, _$VisitorInvitationImpl>
    implements _$$VisitorInvitationImplCopyWith<$Res> {
  __$$VisitorInvitationImplCopyWithImpl(_$VisitorInvitationImpl _value,
      $Res Function(_$VisitorInvitationImpl) _then)
      : super(_value, _then);

  /// Create a copy of VisitorInvitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = freezed,
  }) {
    return _then(_$VisitorInvitationImpl(
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$VisitorInvitationImpl implements _VisitorInvitation {
  const _$VisitorInvitationImpl({this.enabled});

  factory _$VisitorInvitationImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitorInvitationImplFromJson(json);

  @override
  final bool? enabled;

  @override
  String toString() {
    return 'VisitorInvitation(enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitorInvitationImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  /// Create a copy of VisitorInvitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitorInvitationImplCopyWith<_$VisitorInvitationImpl> get copyWith =>
      __$$VisitorInvitationImplCopyWithImpl<_$VisitorInvitationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitorInvitationImplToJson(
      this,
    );
  }
}

abstract class _VisitorInvitation implements VisitorInvitation {
  const factory _VisitorInvitation({final bool? enabled}) =
      _$VisitorInvitationImpl;

  factory _VisitorInvitation.fromJson(Map<String, dynamic> json) =
      _$VisitorInvitationImpl.fromJson;

  @override
  bool? get enabled;

  /// Create a copy of VisitorInvitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitorInvitationImplCopyWith<_$VisitorInvitationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
