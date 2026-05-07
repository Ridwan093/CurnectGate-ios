// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outstanding_dues_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OutstandingDuesData _$OutstandingDuesDataFromJson(Map<String, dynamic> json) {
  return _OutstandingDuesData.fromJson(json);
}

/// @nodoc
mixin _$OutstandingDuesData {
  List<OutstandingDue>? get dues => throw _privateConstructorUsedError;
  Summary? get summary => throw _privateConstructorUsedError;
  String? get minimumPayableAmount => throw _privateConstructorUsedError;

  /// Serializes this OutstandingDuesData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutstandingDuesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutstandingDuesDataCopyWith<OutstandingDuesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutstandingDuesDataCopyWith<$Res> {
  factory $OutstandingDuesDataCopyWith(
    OutstandingDuesData value,
    $Res Function(OutstandingDuesData) then,
  ) = _$OutstandingDuesDataCopyWithImpl<$Res, OutstandingDuesData>;
  @useResult
  $Res call({
    List<OutstandingDue>? dues,
    Summary? summary,
    String? minimumPayableAmount,
  });

  $SummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class _$OutstandingDuesDataCopyWithImpl<$Res, $Val extends OutstandingDuesData>
    implements $OutstandingDuesDataCopyWith<$Res> {
  _$OutstandingDuesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutstandingDuesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dues = freezed,
    Object? summary = freezed,
    Object? minimumPayableAmount = freezed,
  }) {
    return _then(
      _value.copyWith(
            dues:
                freezed == dues
                    ? _value.dues
                    : dues // ignore: cast_nullable_to_non_nullable
                        as List<OutstandingDue>?,
            summary:
                freezed == summary
                    ? _value.summary
                    : summary // ignore: cast_nullable_to_non_nullable
                        as Summary?,
            minimumPayableAmount:
                freezed == minimumPayableAmount
                    ? _value.minimumPayableAmount
                    : minimumPayableAmount // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of OutstandingDuesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $SummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OutstandingDuesDataImplCopyWith<$Res>
    implements $OutstandingDuesDataCopyWith<$Res> {
  factory _$$OutstandingDuesDataImplCopyWith(
    _$OutstandingDuesDataImpl value,
    $Res Function(_$OutstandingDuesDataImpl) then,
  ) = __$$OutstandingDuesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<OutstandingDue>? dues,
    Summary? summary,
    String? minimumPayableAmount,
  });

  @override
  $SummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$OutstandingDuesDataImplCopyWithImpl<$Res>
    extends _$OutstandingDuesDataCopyWithImpl<$Res, _$OutstandingDuesDataImpl>
    implements _$$OutstandingDuesDataImplCopyWith<$Res> {
  __$$OutstandingDuesDataImplCopyWithImpl(
    _$OutstandingDuesDataImpl _value,
    $Res Function(_$OutstandingDuesDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OutstandingDuesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dues = freezed,
    Object? summary = freezed,
    Object? minimumPayableAmount = freezed,
  }) {
    return _then(
      _$OutstandingDuesDataImpl(
        dues:
            freezed == dues
                ? _value._dues
                : dues // ignore: cast_nullable_to_non_nullable
                    as List<OutstandingDue>?,
        summary:
            freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                    as Summary?,
        minimumPayableAmount:
            freezed == minimumPayableAmount
                ? _value.minimumPayableAmount
                : minimumPayableAmount // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$OutstandingDuesDataImpl implements _OutstandingDuesData {
  const _$OutstandingDuesDataImpl({
    final List<OutstandingDue>? dues,
    this.summary,
    this.minimumPayableAmount,
  }) : _dues = dues;

  factory _$OutstandingDuesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutstandingDuesDataImplFromJson(json);

  final List<OutstandingDue>? _dues;
  @override
  List<OutstandingDue>? get dues {
    final value = _dues;
    if (value == null) return null;
    if (_dues is EqualUnmodifiableListView) return _dues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Summary? summary;
  @override
  final String? minimumPayableAmount;

  @override
  String toString() {
    return 'OutstandingDuesData(dues: $dues, summary: $summary, minimumPayableAmount: $minimumPayableAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutstandingDuesDataImpl &&
            const DeepCollectionEquality().equals(other._dues, _dues) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.minimumPayableAmount, minimumPayableAmount) ||
                other.minimumPayableAmount == minimumPayableAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_dues),
    summary,
    minimumPayableAmount,
  );

  /// Create a copy of OutstandingDuesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutstandingDuesDataImplCopyWith<_$OutstandingDuesDataImpl> get copyWith =>
      __$$OutstandingDuesDataImplCopyWithImpl<_$OutstandingDuesDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OutstandingDuesDataImplToJson(this);
  }
}

abstract class _OutstandingDuesData implements OutstandingDuesData {
  const factory _OutstandingDuesData({
    final List<OutstandingDue>? dues,
    final Summary? summary,
    final String? minimumPayableAmount,
  }) = _$OutstandingDuesDataImpl;

  factory _OutstandingDuesData.fromJson(Map<String, dynamic> json) =
      _$OutstandingDuesDataImpl.fromJson;

  @override
  List<OutstandingDue>? get dues;
  @override
  Summary? get summary;
  @override
  String? get minimumPayableAmount;

  /// Create a copy of OutstandingDuesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutstandingDuesDataImplCopyWith<_$OutstandingDuesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
