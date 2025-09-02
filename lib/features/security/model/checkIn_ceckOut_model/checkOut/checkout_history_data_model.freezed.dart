// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_history_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckoutHistoryData _$CheckoutHistoryDataFromJson(Map<String, dynamic> json) {
  return _CheckoutHistoryData.fromJson(json);
}

/// @nodoc
mixin _$CheckoutHistoryData {
  List<VisitorModel>? get history => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  bool? get showingMyVisitorsOnly => throw _privateConstructorUsedError;

  /// Serializes this CheckoutHistoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutHistoryDataCopyWith<CheckoutHistoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutHistoryDataCopyWith<$Res> {
  factory $CheckoutHistoryDataCopyWith(
          CheckoutHistoryData value, $Res Function(CheckoutHistoryData) then) =
      _$CheckoutHistoryDataCopyWithImpl<$Res, CheckoutHistoryData>;
  @useResult
  $Res call(
      {List<VisitorModel>? history, int? count, bool? showingMyVisitorsOnly});
}

/// @nodoc
class _$CheckoutHistoryDataCopyWithImpl<$Res, $Val extends CheckoutHistoryData>
    implements $CheckoutHistoryDataCopyWith<$Res> {
  _$CheckoutHistoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = freezed,
    Object? count = freezed,
    Object? showingMyVisitorsOnly = freezed,
  }) {
    return _then(_value.copyWith(
      history: freezed == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<VisitorModel>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      showingMyVisitorsOnly: freezed == showingMyVisitorsOnly
          ? _value.showingMyVisitorsOnly
          : showingMyVisitorsOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckoutHistoryDataImplCopyWith<$Res>
    implements $CheckoutHistoryDataCopyWith<$Res> {
  factory _$$CheckoutHistoryDataImplCopyWith(_$CheckoutHistoryDataImpl value,
          $Res Function(_$CheckoutHistoryDataImpl) then) =
      __$$CheckoutHistoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<VisitorModel>? history, int? count, bool? showingMyVisitorsOnly});
}

/// @nodoc
class __$$CheckoutHistoryDataImplCopyWithImpl<$Res>
    extends _$CheckoutHistoryDataCopyWithImpl<$Res, _$CheckoutHistoryDataImpl>
    implements _$$CheckoutHistoryDataImplCopyWith<$Res> {
  __$$CheckoutHistoryDataImplCopyWithImpl(_$CheckoutHistoryDataImpl _value,
      $Res Function(_$CheckoutHistoryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = freezed,
    Object? count = freezed,
    Object? showingMyVisitorsOnly = freezed,
  }) {
    return _then(_$CheckoutHistoryDataImpl(
      history: freezed == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<VisitorModel>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      showingMyVisitorsOnly: freezed == showingMyVisitorsOnly
          ? _value.showingMyVisitorsOnly
          : showingMyVisitorsOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckoutHistoryDataImpl extends _CheckoutHistoryData {
  const _$CheckoutHistoryDataImpl(
      {final List<VisitorModel>? history,
      this.count,
      this.showingMyVisitorsOnly})
      : _history = history,
        super._();

  factory _$CheckoutHistoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutHistoryDataImplFromJson(json);

  final List<VisitorModel>? _history;
  @override
  List<VisitorModel>? get history {
    final value = _history;
    if (value == null) return null;
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? count;
  @override
  final bool? showingMyVisitorsOnly;

  @override
  String toString() {
    return 'CheckoutHistoryData(history: $history, count: $count, showingMyVisitorsOnly: $showingMyVisitorsOnly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutHistoryDataImpl &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.showingMyVisitorsOnly, showingMyVisitorsOnly) ||
                other.showingMyVisitorsOnly == showingMyVisitorsOnly));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_history),
      count,
      showingMyVisitorsOnly);

  /// Create a copy of CheckoutHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutHistoryDataImplCopyWith<_$CheckoutHistoryDataImpl> get copyWith =>
      __$$CheckoutHistoryDataImplCopyWithImpl<_$CheckoutHistoryDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutHistoryDataImplToJson(
      this,
    );
  }
}

abstract class _CheckoutHistoryData extends CheckoutHistoryData {
  const factory _CheckoutHistoryData(
      {final List<VisitorModel>? history,
      final int? count,
      final bool? showingMyVisitorsOnly}) = _$CheckoutHistoryDataImpl;
  const _CheckoutHistoryData._() : super._();

  factory _CheckoutHistoryData.fromJson(Map<String, dynamic> json) =
      _$CheckoutHistoryDataImpl.fromJson;

  @override
  List<VisitorModel>? get history;
  @override
  int? get count;
  @override
  bool? get showingMyVisitorsOnly;

  /// Create a copy of CheckoutHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutHistoryDataImplCopyWith<_$CheckoutHistoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
