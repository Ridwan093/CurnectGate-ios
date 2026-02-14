// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agreement_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgreementDetail _$AgreementDetailFromJson(Map<String, dynamic> json) {
  return _AgreementDetail.fromJson(json);
}

/// @nodoc
mixin _$AgreementDetail {
  bool? get required => throw _privateConstructorUsedError;
  bool? get accepted => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get acceptedAt => throw _privateConstructorUsedError;
  String? get acceptedVersion => throw _privateConstructorUsedError;
  String? get signature => throw _privateConstructorUsedError;

  /// Serializes this AgreementDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgreementDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgreementDetailCopyWith<AgreementDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgreementDetailCopyWith<$Res> {
  factory $AgreementDetailCopyWith(
          AgreementDetail value, $Res Function(AgreementDetail) then) =
      _$AgreementDetailCopyWithImpl<$Res, AgreementDetail>;
  @useResult
  $Res call(
      {bool? required,
      bool? accepted,
      int? version,
      String? acceptedAt,
      String? acceptedVersion,
      String? signature});
}

/// @nodoc
class _$AgreementDetailCopyWithImpl<$Res, $Val extends AgreementDetail>
    implements $AgreementDetailCopyWith<$Res> {
  _$AgreementDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgreementDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? required = freezed,
    Object? accepted = freezed,
    Object? version = freezed,
    Object? acceptedAt = freezed,
    Object? acceptedVersion = freezed,
    Object? signature = freezed,
  }) {
    return _then(_value.copyWith(
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool?,
      accepted: freezed == accepted
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedVersion: freezed == acceptedVersion
          ? _value.acceptedVersion
          : acceptedVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgreementDetailImplCopyWith<$Res>
    implements $AgreementDetailCopyWith<$Res> {
  factory _$$AgreementDetailImplCopyWith(_$AgreementDetailImpl value,
          $Res Function(_$AgreementDetailImpl) then) =
      __$$AgreementDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? required,
      bool? accepted,
      int? version,
      String? acceptedAt,
      String? acceptedVersion,
      String? signature});
}

/// @nodoc
class __$$AgreementDetailImplCopyWithImpl<$Res>
    extends _$AgreementDetailCopyWithImpl<$Res, _$AgreementDetailImpl>
    implements _$$AgreementDetailImplCopyWith<$Res> {
  __$$AgreementDetailImplCopyWithImpl(
      _$AgreementDetailImpl _value, $Res Function(_$AgreementDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgreementDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? required = freezed,
    Object? accepted = freezed,
    Object? version = freezed,
    Object? acceptedAt = freezed,
    Object? acceptedVersion = freezed,
    Object? signature = freezed,
  }) {
    return _then(_$AgreementDetailImpl(
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool?,
      accepted: freezed == accepted
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedVersion: freezed == acceptedVersion
          ? _value.acceptedVersion
          : acceptedVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AgreementDetailImpl implements _AgreementDetail {
  const _$AgreementDetailImpl(
      {this.required,
      this.accepted,
      this.version,
      this.acceptedAt,
      this.acceptedVersion,
      this.signature});

  factory _$AgreementDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgreementDetailImplFromJson(json);

  @override
  final bool? required;
  @override
  final bool? accepted;
  @override
  final int? version;
  @override
  final String? acceptedAt;
  @override
  final String? acceptedVersion;
  @override
  final String? signature;

  @override
  String toString() {
    return 'AgreementDetail(required: $required, accepted: $accepted, version: $version, acceptedAt: $acceptedAt, acceptedVersion: $acceptedVersion, signature: $signature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgreementDetailImpl &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.accepted, accepted) ||
                other.accepted == accepted) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.acceptedAt, acceptedAt) ||
                other.acceptedAt == acceptedAt) &&
            (identical(other.acceptedVersion, acceptedVersion) ||
                other.acceptedVersion == acceptedVersion) &&
            (identical(other.signature, signature) ||
                other.signature == signature));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, required, accepted, version,
      acceptedAt, acceptedVersion, signature);

  /// Create a copy of AgreementDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgreementDetailImplCopyWith<_$AgreementDetailImpl> get copyWith =>
      __$$AgreementDetailImplCopyWithImpl<_$AgreementDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgreementDetailImplToJson(
      this,
    );
  }
}

abstract class _AgreementDetail implements AgreementDetail {
  const factory _AgreementDetail(
      {final bool? required,
      final bool? accepted,
      final int? version,
      final String? acceptedAt,
      final String? acceptedVersion,
      final String? signature}) = _$AgreementDetailImpl;

  factory _AgreementDetail.fromJson(Map<String, dynamic> json) =
      _$AgreementDetailImpl.fromJson;

  @override
  bool? get required;
  @override
  bool? get accepted;
  @override
  int? get version;
  @override
  String? get acceptedAt;
  @override
  String? get acceptedVersion;
  @override
  String? get signature;

  /// Create a copy of AgreementDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgreementDetailImplCopyWith<_$AgreementDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
