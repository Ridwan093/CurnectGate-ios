// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_methods_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentMethodsData _$PaymentMethodsDataFromJson(Map<String, dynamic> json) {
  return _PaymentMethodsData.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodsData {
  @JsonKey(name: 'payment_methods')
  List<PaymentMethodItem>? get paymentMethods =>
      throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  int? get estateId => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodsDataCopyWith<PaymentMethodsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodsDataCopyWith<$Res> {
  factory $PaymentMethodsDataCopyWith(
          PaymentMethodsData value, $Res Function(PaymentMethodsData) then) =
      _$PaymentMethodsDataCopyWithImpl<$Res, PaymentMethodsData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'payment_methods')
      List<PaymentMethodItem>? paymentMethods,
      int? total,
      int? estateId});
}

/// @nodoc
class _$PaymentMethodsDataCopyWithImpl<$Res, $Val extends PaymentMethodsData>
    implements $PaymentMethodsDataCopyWith<$Res> {
  _$PaymentMethodsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethods = freezed,
    Object? total = freezed,
    Object? estateId = freezed,
  }) {
    return _then(_value.copyWith(
      paymentMethods: freezed == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodItem>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodsDataImplCopyWith<$Res>
    implements $PaymentMethodsDataCopyWith<$Res> {
  factory _$$PaymentMethodsDataImplCopyWith(_$PaymentMethodsDataImpl value,
          $Res Function(_$PaymentMethodsDataImpl) then) =
      __$$PaymentMethodsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'payment_methods')
      List<PaymentMethodItem>? paymentMethods,
      int? total,
      int? estateId});
}

/// @nodoc
class __$$PaymentMethodsDataImplCopyWithImpl<$Res>
    extends _$PaymentMethodsDataCopyWithImpl<$Res, _$PaymentMethodsDataImpl>
    implements _$$PaymentMethodsDataImplCopyWith<$Res> {
  __$$PaymentMethodsDataImplCopyWithImpl(_$PaymentMethodsDataImpl _value,
      $Res Function(_$PaymentMethodsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethodsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethods = freezed,
    Object? total = freezed,
    Object? estateId = freezed,
  }) {
    return _then(_$PaymentMethodsDataImpl(
      paymentMethods: freezed == paymentMethods
          ? _value._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodItem>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PaymentMethodsDataImpl implements _PaymentMethodsData {
  const _$PaymentMethodsDataImpl(
      {@JsonKey(name: 'payment_methods')
      final List<PaymentMethodItem>? paymentMethods,
      this.total,
      this.estateId})
      : _paymentMethods = paymentMethods;

  factory _$PaymentMethodsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodsDataImplFromJson(json);

  final List<PaymentMethodItem>? _paymentMethods;
  @override
  @JsonKey(name: 'payment_methods')
  List<PaymentMethodItem>? get paymentMethods {
    final value = _paymentMethods;
    if (value == null) return null;
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? total;
  @override
  final int? estateId;

  @override
  String toString() {
    return 'PaymentMethodsData(paymentMethods: $paymentMethods, total: $total, estateId: $estateId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodsDataImpl &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_paymentMethods), total, estateId);

  /// Create a copy of PaymentMethodsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodsDataImplCopyWith<_$PaymentMethodsDataImpl> get copyWith =>
      __$$PaymentMethodsDataImplCopyWithImpl<_$PaymentMethodsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodsDataImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodsData implements PaymentMethodsData {
  const factory _PaymentMethodsData(
      {@JsonKey(name: 'payment_methods')
      final List<PaymentMethodItem>? paymentMethods,
      final int? total,
      final int? estateId}) = _$PaymentMethodsDataImpl;

  factory _PaymentMethodsData.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodsDataImpl.fromJson;

  @override
  @JsonKey(name: 'payment_methods')
  List<PaymentMethodItem>? get paymentMethods;
  @override
  int? get total;
  @override
  int? get estateId;

  /// Create a copy of PaymentMethodsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodsDataImplCopyWith<_$PaymentMethodsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
