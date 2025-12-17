// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pivot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pivot _$PivotFromJson(Map<String, dynamic> json) {
  return _Pivot.fromJson(json);
}

/// @nodoc
mixin _$Pivot {
  int? get paymentTransactionId => throw _privateConstructorUsedError;
  int? get dueId => throw _privateConstructorUsedError;
  String? get amountPaid => throw _privateConstructorUsedError;
  int? get isPartial => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Pivot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pivot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PivotCopyWith<Pivot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PivotCopyWith<$Res> {
  factory $PivotCopyWith(Pivot value, $Res Function(Pivot) then) =
      _$PivotCopyWithImpl<$Res, Pivot>;
  @useResult
  $Res call(
      {int? paymentTransactionId,
      int? dueId,
      String? amountPaid,
      int? isPartial,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$PivotCopyWithImpl<$Res, $Val extends Pivot>
    implements $PivotCopyWith<$Res> {
  _$PivotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pivot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTransactionId = freezed,
    Object? dueId = freezed,
    Object? amountPaid = freezed,
    Object? isPartial = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      paymentTransactionId: freezed == paymentTransactionId
          ? _value.paymentTransactionId
          : paymentTransactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      dueId: freezed == dueId
          ? _value.dueId
          : dueId // ignore: cast_nullable_to_non_nullable
              as int?,
      amountPaid: freezed == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as String?,
      isPartial: freezed == isPartial
          ? _value.isPartial
          : isPartial // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PivotImplCopyWith<$Res> implements $PivotCopyWith<$Res> {
  factory _$$PivotImplCopyWith(
          _$PivotImpl value, $Res Function(_$PivotImpl) then) =
      __$$PivotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? paymentTransactionId,
      int? dueId,
      String? amountPaid,
      int? isPartial,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$PivotImplCopyWithImpl<$Res>
    extends _$PivotCopyWithImpl<$Res, _$PivotImpl>
    implements _$$PivotImplCopyWith<$Res> {
  __$$PivotImplCopyWithImpl(
      _$PivotImpl _value, $Res Function(_$PivotImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pivot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTransactionId = freezed,
    Object? dueId = freezed,
    Object? amountPaid = freezed,
    Object? isPartial = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PivotImpl(
      paymentTransactionId: freezed == paymentTransactionId
          ? _value.paymentTransactionId
          : paymentTransactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      dueId: freezed == dueId
          ? _value.dueId
          : dueId // ignore: cast_nullable_to_non_nullable
              as int?,
      amountPaid: freezed == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as String?,
      isPartial: freezed == isPartial
          ? _value.isPartial
          : isPartial // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PivotImpl implements _Pivot {
  const _$PivotImpl(
      {this.paymentTransactionId,
      this.dueId,
      this.amountPaid,
      this.isPartial,
      this.createdAt,
      this.updatedAt});

  factory _$PivotImpl.fromJson(Map<String, dynamic> json) =>
      _$$PivotImplFromJson(json);

  @override
  final int? paymentTransactionId;
  @override
  final int? dueId;
  @override
  final String? amountPaid;
  @override
  final int? isPartial;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'Pivot(paymentTransactionId: $paymentTransactionId, dueId: $dueId, amountPaid: $amountPaid, isPartial: $isPartial, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PivotImpl &&
            (identical(other.paymentTransactionId, paymentTransactionId) ||
                other.paymentTransactionId == paymentTransactionId) &&
            (identical(other.dueId, dueId) || other.dueId == dueId) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid) &&
            (identical(other.isPartial, isPartial) ||
                other.isPartial == isPartial) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, paymentTransactionId, dueId,
      amountPaid, isPartial, createdAt, updatedAt);

  /// Create a copy of Pivot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PivotImplCopyWith<_$PivotImpl> get copyWith =>
      __$$PivotImplCopyWithImpl<_$PivotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PivotImplToJson(
      this,
    );
  }
}

abstract class _Pivot implements Pivot {
  const factory _Pivot(
      {final int? paymentTransactionId,
      final int? dueId,
      final String? amountPaid,
      final int? isPartial,
      final String? createdAt,
      final String? updatedAt}) = _$PivotImpl;

  factory _Pivot.fromJson(Map<String, dynamic> json) = _$PivotImpl.fromJson;

  @override
  int? get paymentTransactionId;
  @override
  int? get dueId;
  @override
  String? get amountPaid;
  @override
  int? get isPartial;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of Pivot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PivotImplCopyWith<_$PivotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
