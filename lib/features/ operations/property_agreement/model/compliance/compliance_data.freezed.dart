// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compliance_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ComplianceData _$ComplianceDataFromJson(Map<String, dynamic> json) {
  return _ComplianceData.fromJson(json);
}

/// @nodoc
mixin _$ComplianceData {
  bool? get isCompliant => throw _privateConstructorUsedError;
  List<String>? get requiredActions => throw _privateConstructorUsedError;
  AgreementStatus? get agreementStatus => throw _privateConstructorUsedError;
  bool? get canAccessFeatures => throw _privateConstructorUsedError;

  /// Serializes this ComplianceData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ComplianceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComplianceDataCopyWith<ComplianceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplianceDataCopyWith<$Res> {
  factory $ComplianceDataCopyWith(
          ComplianceData value, $Res Function(ComplianceData) then) =
      _$ComplianceDataCopyWithImpl<$Res, ComplianceData>;
  @useResult
  $Res call(
      {bool? isCompliant,
      List<String>? requiredActions,
      AgreementStatus? agreementStatus,
      bool? canAccessFeatures});

  $AgreementStatusCopyWith<$Res>? get agreementStatus;
}

/// @nodoc
class _$ComplianceDataCopyWithImpl<$Res, $Val extends ComplianceData>
    implements $ComplianceDataCopyWith<$Res> {
  _$ComplianceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComplianceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCompliant = freezed,
    Object? requiredActions = freezed,
    Object? agreementStatus = freezed,
    Object? canAccessFeatures = freezed,
  }) {
    return _then(_value.copyWith(
      isCompliant: freezed == isCompliant
          ? _value.isCompliant
          : isCompliant // ignore: cast_nullable_to_non_nullable
              as bool?,
      requiredActions: freezed == requiredActions
          ? _value.requiredActions
          : requiredActions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      agreementStatus: freezed == agreementStatus
          ? _value.agreementStatus
          : agreementStatus // ignore: cast_nullable_to_non_nullable
              as AgreementStatus?,
      canAccessFeatures: freezed == canAccessFeatures
          ? _value.canAccessFeatures
          : canAccessFeatures // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of ComplianceData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgreementStatusCopyWith<$Res>? get agreementStatus {
    if (_value.agreementStatus == null) {
      return null;
    }

    return $AgreementStatusCopyWith<$Res>(_value.agreementStatus!, (value) {
      return _then(_value.copyWith(agreementStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ComplianceDataImplCopyWith<$Res>
    implements $ComplianceDataCopyWith<$Res> {
  factory _$$ComplianceDataImplCopyWith(_$ComplianceDataImpl value,
          $Res Function(_$ComplianceDataImpl) then) =
      __$$ComplianceDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isCompliant,
      List<String>? requiredActions,
      AgreementStatus? agreementStatus,
      bool? canAccessFeatures});

  @override
  $AgreementStatusCopyWith<$Res>? get agreementStatus;
}

/// @nodoc
class __$$ComplianceDataImplCopyWithImpl<$Res>
    extends _$ComplianceDataCopyWithImpl<$Res, _$ComplianceDataImpl>
    implements _$$ComplianceDataImplCopyWith<$Res> {
  __$$ComplianceDataImplCopyWithImpl(
      _$ComplianceDataImpl _value, $Res Function(_$ComplianceDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ComplianceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCompliant = freezed,
    Object? requiredActions = freezed,
    Object? agreementStatus = freezed,
    Object? canAccessFeatures = freezed,
  }) {
    return _then(_$ComplianceDataImpl(
      isCompliant: freezed == isCompliant
          ? _value.isCompliant
          : isCompliant // ignore: cast_nullable_to_non_nullable
              as bool?,
      requiredActions: freezed == requiredActions
          ? _value._requiredActions
          : requiredActions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      agreementStatus: freezed == agreementStatus
          ? _value.agreementStatus
          : agreementStatus // ignore: cast_nullable_to_non_nullable
              as AgreementStatus?,
      canAccessFeatures: freezed == canAccessFeatures
          ? _value.canAccessFeatures
          : canAccessFeatures // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ComplianceDataImpl implements _ComplianceData {
  const _$ComplianceDataImpl(
      {this.isCompliant,
      final List<String>? requiredActions,
      this.agreementStatus,
      this.canAccessFeatures})
      : _requiredActions = requiredActions;

  factory _$ComplianceDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComplianceDataImplFromJson(json);

  @override
  final bool? isCompliant;
  final List<String>? _requiredActions;
  @override
  List<String>? get requiredActions {
    final value = _requiredActions;
    if (value == null) return null;
    if (_requiredActions is EqualUnmodifiableListView) return _requiredActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AgreementStatus? agreementStatus;
  @override
  final bool? canAccessFeatures;

  @override
  String toString() {
    return 'ComplianceData(isCompliant: $isCompliant, requiredActions: $requiredActions, agreementStatus: $agreementStatus, canAccessFeatures: $canAccessFeatures)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplianceDataImpl &&
            (identical(other.isCompliant, isCompliant) ||
                other.isCompliant == isCompliant) &&
            const DeepCollectionEquality()
                .equals(other._requiredActions, _requiredActions) &&
            (identical(other.agreementStatus, agreementStatus) ||
                other.agreementStatus == agreementStatus) &&
            (identical(other.canAccessFeatures, canAccessFeatures) ||
                other.canAccessFeatures == canAccessFeatures));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isCompliant,
      const DeepCollectionEquality().hash(_requiredActions),
      agreementStatus,
      canAccessFeatures);

  /// Create a copy of ComplianceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplianceDataImplCopyWith<_$ComplianceDataImpl> get copyWith =>
      __$$ComplianceDataImplCopyWithImpl<_$ComplianceDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComplianceDataImplToJson(
      this,
    );
  }
}

abstract class _ComplianceData implements ComplianceData {
  const factory _ComplianceData(
      {final bool? isCompliant,
      final List<String>? requiredActions,
      final AgreementStatus? agreementStatus,
      final bool? canAccessFeatures}) = _$ComplianceDataImpl;

  factory _ComplianceData.fromJson(Map<String, dynamic> json) =
      _$ComplianceDataImpl.fromJson;

  @override
  bool? get isCompliant;
  @override
  List<String>? get requiredActions;
  @override
  AgreementStatus? get agreementStatus;
  @override
  bool? get canAccessFeatures;

  /// Create a copy of ComplianceData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComplianceDataImplCopyWith<_$ComplianceDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
