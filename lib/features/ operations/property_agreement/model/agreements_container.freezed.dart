// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agreements_container.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgreementsContainer _$AgreementsContainerFromJson(Map<String, dynamic> json) {
  return _AgreementsContainer.fromJson(json);
}

/// @nodoc
mixin _$AgreementsContainer {
  TermsAndConditions? get termsAndConditions =>
      throw _privateConstructorUsedError;
  PropertyAgreement? get propertyAgreement =>
      throw _privateConstructorUsedError;

  /// Serializes this AgreementsContainer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgreementsContainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgreementsContainerCopyWith<AgreementsContainer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgreementsContainerCopyWith<$Res> {
  factory $AgreementsContainerCopyWith(
          AgreementsContainer value, $Res Function(AgreementsContainer) then) =
      _$AgreementsContainerCopyWithImpl<$Res, AgreementsContainer>;
  @useResult
  $Res call(
      {TermsAndConditions? termsAndConditions,
      PropertyAgreement? propertyAgreement});

  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions;
  $PropertyAgreementCopyWith<$Res>? get propertyAgreement;
}

/// @nodoc
class _$AgreementsContainerCopyWithImpl<$Res, $Val extends AgreementsContainer>
    implements $AgreementsContainerCopyWith<$Res> {
  _$AgreementsContainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgreementsContainer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsAndConditions = freezed,
    Object? propertyAgreement = freezed,
  }) {
    return _then(_value.copyWith(
      termsAndConditions: freezed == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as TermsAndConditions?,
      propertyAgreement: freezed == propertyAgreement
          ? _value.propertyAgreement
          : propertyAgreement // ignore: cast_nullable_to_non_nullable
              as PropertyAgreement?,
    ) as $Val);
  }

  /// Create a copy of AgreementsContainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions {
    if (_value.termsAndConditions == null) {
      return null;
    }

    return $TermsAndConditionsCopyWith<$Res>(_value.termsAndConditions!,
        (value) {
      return _then(_value.copyWith(termsAndConditions: value) as $Val);
    });
  }

  /// Create a copy of AgreementsContainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PropertyAgreementCopyWith<$Res>? get propertyAgreement {
    if (_value.propertyAgreement == null) {
      return null;
    }

    return $PropertyAgreementCopyWith<$Res>(_value.propertyAgreement!, (value) {
      return _then(_value.copyWith(propertyAgreement: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AgreementsContainerImplCopyWith<$Res>
    implements $AgreementsContainerCopyWith<$Res> {
  factory _$$AgreementsContainerImplCopyWith(_$AgreementsContainerImpl value,
          $Res Function(_$AgreementsContainerImpl) then) =
      __$$AgreementsContainerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TermsAndConditions? termsAndConditions,
      PropertyAgreement? propertyAgreement});

  @override
  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions;
  @override
  $PropertyAgreementCopyWith<$Res>? get propertyAgreement;
}

/// @nodoc
class __$$AgreementsContainerImplCopyWithImpl<$Res>
    extends _$AgreementsContainerCopyWithImpl<$Res, _$AgreementsContainerImpl>
    implements _$$AgreementsContainerImplCopyWith<$Res> {
  __$$AgreementsContainerImplCopyWithImpl(_$AgreementsContainerImpl _value,
      $Res Function(_$AgreementsContainerImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgreementsContainer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsAndConditions = freezed,
    Object? propertyAgreement = freezed,
  }) {
    return _then(_$AgreementsContainerImpl(
      termsAndConditions: freezed == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as TermsAndConditions?,
      propertyAgreement: freezed == propertyAgreement
          ? _value.propertyAgreement
          : propertyAgreement // ignore: cast_nullable_to_non_nullable
              as PropertyAgreement?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AgreementsContainerImpl implements _AgreementsContainer {
  const _$AgreementsContainerImpl(
      {this.termsAndConditions, this.propertyAgreement});

  factory _$AgreementsContainerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgreementsContainerImplFromJson(json);

  @override
  final TermsAndConditions? termsAndConditions;
  @override
  final PropertyAgreement? propertyAgreement;

  @override
  String toString() {
    return 'AgreementsContainer(termsAndConditions: $termsAndConditions, propertyAgreement: $propertyAgreement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgreementsContainerImpl &&
            (identical(other.termsAndConditions, termsAndConditions) ||
                other.termsAndConditions == termsAndConditions) &&
            (identical(other.propertyAgreement, propertyAgreement) ||
                other.propertyAgreement == propertyAgreement));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, termsAndConditions, propertyAgreement);

  /// Create a copy of AgreementsContainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgreementsContainerImplCopyWith<_$AgreementsContainerImpl> get copyWith =>
      __$$AgreementsContainerImplCopyWithImpl<_$AgreementsContainerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgreementsContainerImplToJson(
      this,
    );
  }
}

abstract class _AgreementsContainer implements AgreementsContainer {
  const factory _AgreementsContainer(
      {final TermsAndConditions? termsAndConditions,
      final PropertyAgreement? propertyAgreement}) = _$AgreementsContainerImpl;

  factory _AgreementsContainer.fromJson(Map<String, dynamic> json) =
      _$AgreementsContainerImpl.fromJson;

  @override
  TermsAndConditions? get termsAndConditions;
  @override
  PropertyAgreement? get propertyAgreement;

  /// Create a copy of AgreementsContainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgreementsContainerImplCopyWith<_$AgreementsContainerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
