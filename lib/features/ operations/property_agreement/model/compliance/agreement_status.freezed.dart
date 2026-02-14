// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agreement_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgreementStatus _$AgreementStatusFromJson(Map<String, dynamic> json) {
  return _AgreementStatus.fromJson(json);
}

/// @nodoc
mixin _$AgreementStatus {
  AgreementDetail? get termsAndConditions => throw _privateConstructorUsedError;
  AgreementDetail? get propertyAgreement => throw _privateConstructorUsedError;
  bool? get needsAction => throw _privateConstructorUsedError;

  /// Serializes this AgreementStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgreementStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgreementStatusCopyWith<AgreementStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgreementStatusCopyWith<$Res> {
  factory $AgreementStatusCopyWith(
          AgreementStatus value, $Res Function(AgreementStatus) then) =
      _$AgreementStatusCopyWithImpl<$Res, AgreementStatus>;
  @useResult
  $Res call(
      {AgreementDetail? termsAndConditions,
      AgreementDetail? propertyAgreement,
      bool? needsAction});

  $AgreementDetailCopyWith<$Res>? get termsAndConditions;
  $AgreementDetailCopyWith<$Res>? get propertyAgreement;
}

/// @nodoc
class _$AgreementStatusCopyWithImpl<$Res, $Val extends AgreementStatus>
    implements $AgreementStatusCopyWith<$Res> {
  _$AgreementStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgreementStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsAndConditions = freezed,
    Object? propertyAgreement = freezed,
    Object? needsAction = freezed,
  }) {
    return _then(_value.copyWith(
      termsAndConditions: freezed == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as AgreementDetail?,
      propertyAgreement: freezed == propertyAgreement
          ? _value.propertyAgreement
          : propertyAgreement // ignore: cast_nullable_to_non_nullable
              as AgreementDetail?,
      needsAction: freezed == needsAction
          ? _value.needsAction
          : needsAction // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of AgreementStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgreementDetailCopyWith<$Res>? get termsAndConditions {
    if (_value.termsAndConditions == null) {
      return null;
    }

    return $AgreementDetailCopyWith<$Res>(_value.termsAndConditions!, (value) {
      return _then(_value.copyWith(termsAndConditions: value) as $Val);
    });
  }

  /// Create a copy of AgreementStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgreementDetailCopyWith<$Res>? get propertyAgreement {
    if (_value.propertyAgreement == null) {
      return null;
    }

    return $AgreementDetailCopyWith<$Res>(_value.propertyAgreement!, (value) {
      return _then(_value.copyWith(propertyAgreement: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AgreementStatusImplCopyWith<$Res>
    implements $AgreementStatusCopyWith<$Res> {
  factory _$$AgreementStatusImplCopyWith(_$AgreementStatusImpl value,
          $Res Function(_$AgreementStatusImpl) then) =
      __$$AgreementStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AgreementDetail? termsAndConditions,
      AgreementDetail? propertyAgreement,
      bool? needsAction});

  @override
  $AgreementDetailCopyWith<$Res>? get termsAndConditions;
  @override
  $AgreementDetailCopyWith<$Res>? get propertyAgreement;
}

/// @nodoc
class __$$AgreementStatusImplCopyWithImpl<$Res>
    extends _$AgreementStatusCopyWithImpl<$Res, _$AgreementStatusImpl>
    implements _$$AgreementStatusImplCopyWith<$Res> {
  __$$AgreementStatusImplCopyWithImpl(
      _$AgreementStatusImpl _value, $Res Function(_$AgreementStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgreementStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsAndConditions = freezed,
    Object? propertyAgreement = freezed,
    Object? needsAction = freezed,
  }) {
    return _then(_$AgreementStatusImpl(
      termsAndConditions: freezed == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as AgreementDetail?,
      propertyAgreement: freezed == propertyAgreement
          ? _value.propertyAgreement
          : propertyAgreement // ignore: cast_nullable_to_non_nullable
              as AgreementDetail?,
      needsAction: freezed == needsAction
          ? _value.needsAction
          : needsAction // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AgreementStatusImpl implements _AgreementStatus {
  const _$AgreementStatusImpl(
      {this.termsAndConditions, this.propertyAgreement, this.needsAction});

  factory _$AgreementStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgreementStatusImplFromJson(json);

  @override
  final AgreementDetail? termsAndConditions;
  @override
  final AgreementDetail? propertyAgreement;
  @override
  final bool? needsAction;

  @override
  String toString() {
    return 'AgreementStatus(termsAndConditions: $termsAndConditions, propertyAgreement: $propertyAgreement, needsAction: $needsAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgreementStatusImpl &&
            (identical(other.termsAndConditions, termsAndConditions) ||
                other.termsAndConditions == termsAndConditions) &&
            (identical(other.propertyAgreement, propertyAgreement) ||
                other.propertyAgreement == propertyAgreement) &&
            (identical(other.needsAction, needsAction) ||
                other.needsAction == needsAction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, termsAndConditions, propertyAgreement, needsAction);

  /// Create a copy of AgreementStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgreementStatusImplCopyWith<_$AgreementStatusImpl> get copyWith =>
      __$$AgreementStatusImplCopyWithImpl<_$AgreementStatusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgreementStatusImplToJson(
      this,
    );
  }
}

abstract class _AgreementStatus implements AgreementStatus {
  const factory _AgreementStatus(
      {final AgreementDetail? termsAndConditions,
      final AgreementDetail? propertyAgreement,
      final bool? needsAction}) = _$AgreementStatusImpl;

  factory _AgreementStatus.fromJson(Map<String, dynamic> json) =
      _$AgreementStatusImpl.fromJson;

  @override
  AgreementDetail? get termsAndConditions;
  @override
  AgreementDetail? get propertyAgreement;
  @override
  bool? get needsAction;

  /// Create a copy of AgreementStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgreementStatusImplCopyWith<_$AgreementStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
