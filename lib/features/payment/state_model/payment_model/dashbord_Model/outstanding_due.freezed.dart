// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outstanding_due.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OutstandingDue _$OutstandingDueFromJson(Map<String, dynamic> json) {
  return _OutstandingDue.fromJson(json);
}

/// @nodoc
mixin _$OutstandingDue {
  int? get id => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  String? get paid => throw _privateConstructorUsedError;
  String? get balance => throw _privateConstructorUsedError;
  String? get dueDate => throw _privateConstructorUsedError;
  bool? get isOverdue => throw _privateConstructorUsedError;
  int? get daysOverdue => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this OutstandingDue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutstandingDue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutstandingDueCopyWith<OutstandingDue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutstandingDueCopyWith<$Res> {
  factory $OutstandingDueCopyWith(
          OutstandingDue value, $Res Function(OutstandingDue) then) =
      _$OutstandingDueCopyWithImpl<$Res, OutstandingDue>;
  @useResult
  $Res call(
      {int? id,
      String? reference,
      String? category,
      String? amount,
      String? paid,
      String? balance,
      String? dueDate,
      bool? isOverdue,
      int? daysOverdue,
      String? status});
}

/// @nodoc
class _$OutstandingDueCopyWithImpl<$Res, $Val extends OutstandingDue>
    implements $OutstandingDueCopyWith<$Res> {
  _$OutstandingDueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutstandingDue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? reference = freezed,
    Object? category = freezed,
    Object? amount = freezed,
    Object? paid = freezed,
    Object? balance = freezed,
    Object? dueDate = freezed,
    Object? isOverdue = freezed,
    Object? daysOverdue = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isOverdue: freezed == isOverdue
          ? _value.isOverdue
          : isOverdue // ignore: cast_nullable_to_non_nullable
              as bool?,
      daysOverdue: freezed == daysOverdue
          ? _value.daysOverdue
          : daysOverdue // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutstandingDueImplCopyWith<$Res>
    implements $OutstandingDueCopyWith<$Res> {
  factory _$$OutstandingDueImplCopyWith(_$OutstandingDueImpl value,
          $Res Function(_$OutstandingDueImpl) then) =
      __$$OutstandingDueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? reference,
      String? category,
      String? amount,
      String? paid,
      String? balance,
      String? dueDate,
      bool? isOverdue,
      int? daysOverdue,
      String? status});
}

/// @nodoc
class __$$OutstandingDueImplCopyWithImpl<$Res>
    extends _$OutstandingDueCopyWithImpl<$Res, _$OutstandingDueImpl>
    implements _$$OutstandingDueImplCopyWith<$Res> {
  __$$OutstandingDueImplCopyWithImpl(
      _$OutstandingDueImpl _value, $Res Function(_$OutstandingDueImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutstandingDue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? reference = freezed,
    Object? category = freezed,
    Object? amount = freezed,
    Object? paid = freezed,
    Object? balance = freezed,
    Object? dueDate = freezed,
    Object? isOverdue = freezed,
    Object? daysOverdue = freezed,
    Object? status = freezed,
  }) {
    return _then(_$OutstandingDueImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isOverdue: freezed == isOverdue
          ? _value.isOverdue
          : isOverdue // ignore: cast_nullable_to_non_nullable
              as bool?,
      daysOverdue: freezed == daysOverdue
          ? _value.daysOverdue
          : daysOverdue // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$OutstandingDueImpl implements _OutstandingDue {
  const _$OutstandingDueImpl(
      {this.id,
      this.reference,
      this.category,
      this.amount,
      this.paid,
      this.balance,
      this.dueDate,
      this.isOverdue,
      this.daysOverdue,
      this.status});

  factory _$OutstandingDueImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutstandingDueImplFromJson(json);

  @override
  final int? id;
  @override
  final String? reference;
  @override
  final String? category;
  @override
  final String? amount;
  @override
  final String? paid;
  @override
  final String? balance;
  @override
  final String? dueDate;
  @override
  final bool? isOverdue;
  @override
  final int? daysOverdue;
  @override
  final String? status;

  @override
  String toString() {
    return 'OutstandingDue(id: $id, reference: $reference, category: $category, amount: $amount, paid: $paid, balance: $balance, dueDate: $dueDate, isOverdue: $isOverdue, daysOverdue: $daysOverdue, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutstandingDueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.isOverdue, isOverdue) ||
                other.isOverdue == isOverdue) &&
            (identical(other.daysOverdue, daysOverdue) ||
                other.daysOverdue == daysOverdue) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, reference, category, amount,
      paid, balance, dueDate, isOverdue, daysOverdue, status);

  /// Create a copy of OutstandingDue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutstandingDueImplCopyWith<_$OutstandingDueImpl> get copyWith =>
      __$$OutstandingDueImplCopyWithImpl<_$OutstandingDueImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutstandingDueImplToJson(
      this,
    );
  }
}

abstract class _OutstandingDue implements OutstandingDue {
  const factory _OutstandingDue(
      {final int? id,
      final String? reference,
      final String? category,
      final String? amount,
      final String? paid,
      final String? balance,
      final String? dueDate,
      final bool? isOverdue,
      final int? daysOverdue,
      final String? status}) = _$OutstandingDueImpl;

  factory _OutstandingDue.fromJson(Map<String, dynamic> json) =
      _$OutstandingDueImpl.fromJson;

  @override
  int? get id;
  @override
  String? get reference;
  @override
  String? get category;
  @override
  String? get amount;
  @override
  String? get paid;
  @override
  String? get balance;
  @override
  String? get dueDate;
  @override
  bool? get isOverdue;
  @override
  int? get daysOverdue;
  @override
  String? get status;

  /// Create a copy of OutstandingDue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutstandingDueImplCopyWith<_$OutstandingDueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
