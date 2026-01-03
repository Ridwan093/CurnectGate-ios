// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_agreement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PropertyAgreement _$PropertyAgreementFromJson(Map<String, dynamic> json) {
  return _PropertyAgreement.fromJson(json);
}

/// @nodoc
mixin _$PropertyAgreement {
  bool? get required => throw _privateConstructorUsedError;
  bool? get accepted => throw _privateConstructorUsedError;

  /// Serializes this PropertyAgreement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PropertyAgreement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyAgreementCopyWith<PropertyAgreement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyAgreementCopyWith<$Res> {
  factory $PropertyAgreementCopyWith(
          PropertyAgreement value, $Res Function(PropertyAgreement) then) =
      _$PropertyAgreementCopyWithImpl<$Res, PropertyAgreement>;
  @useResult
  $Res call({bool? required, bool? accepted});
}

/// @nodoc
class _$PropertyAgreementCopyWithImpl<$Res, $Val extends PropertyAgreement>
    implements $PropertyAgreementCopyWith<$Res> {
  _$PropertyAgreementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PropertyAgreement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? required = freezed,
    Object? accepted = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PropertyAgreementImplCopyWith<$Res>
    implements $PropertyAgreementCopyWith<$Res> {
  factory _$$PropertyAgreementImplCopyWith(_$PropertyAgreementImpl value,
          $Res Function(_$PropertyAgreementImpl) then) =
      __$$PropertyAgreementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? required, bool? accepted});
}

/// @nodoc
class __$$PropertyAgreementImplCopyWithImpl<$Res>
    extends _$PropertyAgreementCopyWithImpl<$Res, _$PropertyAgreementImpl>
    implements _$$PropertyAgreementImplCopyWith<$Res> {
  __$$PropertyAgreementImplCopyWithImpl(_$PropertyAgreementImpl _value,
      $Res Function(_$PropertyAgreementImpl) _then)
      : super(_value, _then);

  /// Create a copy of PropertyAgreement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? required = freezed,
    Object? accepted = freezed,
  }) {
    return _then(_$PropertyAgreementImpl(
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool?,
      accepted: freezed == accepted
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PropertyAgreementImpl implements _PropertyAgreement {
  const _$PropertyAgreementImpl({this.required, this.accepted});

  factory _$PropertyAgreementImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyAgreementImplFromJson(json);

  @override
  final bool? required;
  @override
  final bool? accepted;

  @override
  String toString() {
    return 'PropertyAgreement(required: $required, accepted: $accepted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyAgreementImpl &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.accepted, accepted) ||
                other.accepted == accepted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, required, accepted);

  /// Create a copy of PropertyAgreement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyAgreementImplCopyWith<_$PropertyAgreementImpl> get copyWith =>
      __$$PropertyAgreementImplCopyWithImpl<_$PropertyAgreementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyAgreementImplToJson(
      this,
    );
  }
}

abstract class _PropertyAgreement implements PropertyAgreement {
  const factory _PropertyAgreement(
      {final bool? required, final bool? accepted}) = _$PropertyAgreementImpl;

  factory _PropertyAgreement.fromJson(Map<String, dynamic> json) =
      _$PropertyAgreementImpl.fromJson;

  @override
  bool? get required;
  @override
  bool? get accepted;

  /// Create a copy of PropertyAgreement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyAgreementImplCopyWith<_$PropertyAgreementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
