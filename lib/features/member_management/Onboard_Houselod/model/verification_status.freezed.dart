// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerificationStatus _$VerificationStatusFromJson(Map<String, dynamic> json) {
  return _VerificationStatus.fromJson(json);
}

/// @nodoc
mixin _$VerificationStatus {
  @JsonKey(name: 'email_verified')
  bool? get emailVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_verified')
  bool? get phoneVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'identity_verified')
  bool? get identityVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'digital_id_active')
  bool? get digitalIdActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'background_check_status')
  String? get backgroundCheckStatus => throw _privateConstructorUsedError;

  /// Serializes this VerificationStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerificationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerificationStatusCopyWith<VerificationStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationStatusCopyWith<$Res> {
  factory $VerificationStatusCopyWith(
          VerificationStatus value, $Res Function(VerificationStatus) then) =
      _$VerificationStatusCopyWithImpl<$Res, VerificationStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: 'email_verified') bool? emailVerified,
      @JsonKey(name: 'phone_verified') bool? phoneVerified,
      @JsonKey(name: 'identity_verified') bool? identityVerified,
      @JsonKey(name: 'digital_id_active') bool? digitalIdActive,
      @JsonKey(name: 'background_check_status') String? backgroundCheckStatus});
}

/// @nodoc
class _$VerificationStatusCopyWithImpl<$Res, $Val extends VerificationStatus>
    implements $VerificationStatusCopyWith<$Res> {
  _$VerificationStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailVerified = freezed,
    Object? phoneVerified = freezed,
    Object? identityVerified = freezed,
    Object? digitalIdActive = freezed,
    Object? backgroundCheckStatus = freezed,
  }) {
    return _then(_value.copyWith(
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      phoneVerified: freezed == phoneVerified
          ? _value.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      identityVerified: freezed == identityVerified
          ? _value.identityVerified
          : identityVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      digitalIdActive: freezed == digitalIdActive
          ? _value.digitalIdActive
          : digitalIdActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      backgroundCheckStatus: freezed == backgroundCheckStatus
          ? _value.backgroundCheckStatus
          : backgroundCheckStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationStatusImplCopyWith<$Res>
    implements $VerificationStatusCopyWith<$Res> {
  factory _$$VerificationStatusImplCopyWith(_$VerificationStatusImpl value,
          $Res Function(_$VerificationStatusImpl) then) =
      __$$VerificationStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'email_verified') bool? emailVerified,
      @JsonKey(name: 'phone_verified') bool? phoneVerified,
      @JsonKey(name: 'identity_verified') bool? identityVerified,
      @JsonKey(name: 'digital_id_active') bool? digitalIdActive,
      @JsonKey(name: 'background_check_status') String? backgroundCheckStatus});
}

/// @nodoc
class __$$VerificationStatusImplCopyWithImpl<$Res>
    extends _$VerificationStatusCopyWithImpl<$Res, _$VerificationStatusImpl>
    implements _$$VerificationStatusImplCopyWith<$Res> {
  __$$VerificationStatusImplCopyWithImpl(_$VerificationStatusImpl _value,
      $Res Function(_$VerificationStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailVerified = freezed,
    Object? phoneVerified = freezed,
    Object? identityVerified = freezed,
    Object? digitalIdActive = freezed,
    Object? backgroundCheckStatus = freezed,
  }) {
    return _then(_$VerificationStatusImpl(
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      phoneVerified: freezed == phoneVerified
          ? _value.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      identityVerified: freezed == identityVerified
          ? _value.identityVerified
          : identityVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      digitalIdActive: freezed == digitalIdActive
          ? _value.digitalIdActive
          : digitalIdActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      backgroundCheckStatus: freezed == backgroundCheckStatus
          ? _value.backgroundCheckStatus
          : backgroundCheckStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$VerificationStatusImpl implements _VerificationStatus {
  const _$VerificationStatusImpl(
      {@JsonKey(name: 'email_verified') this.emailVerified,
      @JsonKey(name: 'phone_verified') this.phoneVerified,
      @JsonKey(name: 'identity_verified') this.identityVerified,
      @JsonKey(name: 'digital_id_active') this.digitalIdActive,
      @JsonKey(name: 'background_check_status') this.backgroundCheckStatus});

  factory _$VerificationStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationStatusImplFromJson(json);

  @override
  @JsonKey(name: 'email_verified')
  final bool? emailVerified;
  @override
  @JsonKey(name: 'phone_verified')
  final bool? phoneVerified;
  @override
  @JsonKey(name: 'identity_verified')
  final bool? identityVerified;
  @override
  @JsonKey(name: 'digital_id_active')
  final bool? digitalIdActive;
  @override
  @JsonKey(name: 'background_check_status')
  final String? backgroundCheckStatus;

  @override
  String toString() {
    return 'VerificationStatus(emailVerified: $emailVerified, phoneVerified: $phoneVerified, identityVerified: $identityVerified, digitalIdActive: $digitalIdActive, backgroundCheckStatus: $backgroundCheckStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationStatusImpl &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.phoneVerified, phoneVerified) ||
                other.phoneVerified == phoneVerified) &&
            (identical(other.identityVerified, identityVerified) ||
                other.identityVerified == identityVerified) &&
            (identical(other.digitalIdActive, digitalIdActive) ||
                other.digitalIdActive == digitalIdActive) &&
            (identical(other.backgroundCheckStatus, backgroundCheckStatus) ||
                other.backgroundCheckStatus == backgroundCheckStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, emailVerified, phoneVerified,
      identityVerified, digitalIdActive, backgroundCheckStatus);

  /// Create a copy of VerificationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationStatusImplCopyWith<_$VerificationStatusImpl> get copyWith =>
      __$$VerificationStatusImplCopyWithImpl<_$VerificationStatusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationStatusImplToJson(
      this,
    );
  }
}

abstract class _VerificationStatus implements VerificationStatus {
  const factory _VerificationStatus(
      {@JsonKey(name: 'email_verified') final bool? emailVerified,
      @JsonKey(name: 'phone_verified') final bool? phoneVerified,
      @JsonKey(name: 'identity_verified') final bool? identityVerified,
      @JsonKey(name: 'digital_id_active') final bool? digitalIdActive,
      @JsonKey(name: 'background_check_status')
      final String? backgroundCheckStatus}) = _$VerificationStatusImpl;

  factory _VerificationStatus.fromJson(Map<String, dynamic> json) =
      _$VerificationStatusImpl.fromJson;

  @override
  @JsonKey(name: 'email_verified')
  bool? get emailVerified;
  @override
  @JsonKey(name: 'phone_verified')
  bool? get phoneVerified;
  @override
  @JsonKey(name: 'identity_verified')
  bool? get identityVerified;
  @override
  @JsonKey(name: 'digital_id_active')
  bool? get digitalIdActive;
  @override
  @JsonKey(name: 'background_check_status')
  String? get backgroundCheckStatus;

  /// Create a copy of VerificationStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationStatusImplCopyWith<_$VerificationStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
