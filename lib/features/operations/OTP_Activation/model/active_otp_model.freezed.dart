// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_otp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActiveOtpModel _$ActiveOtpModelFromJson(Map<String, dynamic> json) {
  return _ActiveOtpModel.fromJson(json);
}

/// @nodoc
mixin _$ActiveOtpModel {
  String get visitorName => throw _privateConstructorUsedError;
  String get visitType => throw _privateConstructorUsedError;
  @JsonKey(name: 'endDay', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get endDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'endtime', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get endTime => throw _privateConstructorUsedError;

  /// Serializes this ActiveOtpModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActiveOtpModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActiveOtpModelCopyWith<ActiveOtpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveOtpModelCopyWith<$Res> {
  factory $ActiveOtpModelCopyWith(
          ActiveOtpModel value, $Res Function(ActiveOtpModel) then) =
      _$ActiveOtpModelCopyWithImpl<$Res, ActiveOtpModel>;
  @useResult
  $Res call(
      {String visitorName,
      String visitType,
      @JsonKey(name: 'endDay', fromJson: NullSafetyHelper.safeDateTime)
      DateTime endDay,
      @JsonKey(name: 'endtime', fromJson: NullSafetyHelper.safeDateTime)
      DateTime endTime});
}

/// @nodoc
class _$ActiveOtpModelCopyWithImpl<$Res, $Val extends ActiveOtpModel>
    implements $ActiveOtpModelCopyWith<$Res> {
  _$ActiveOtpModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActiveOtpModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitorName = null,
    Object? visitType = null,
    Object? endDay = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      visitorName: null == visitorName
          ? _value.visitorName
          : visitorName // ignore: cast_nullable_to_non_nullable
              as String,
      visitType: null == visitType
          ? _value.visitType
          : visitType // ignore: cast_nullable_to_non_nullable
              as String,
      endDay: null == endDay
          ? _value.endDay
          : endDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActiveOtpModelImplCopyWith<$Res>
    implements $ActiveOtpModelCopyWith<$Res> {
  factory _$$ActiveOtpModelImplCopyWith(_$ActiveOtpModelImpl value,
          $Res Function(_$ActiveOtpModelImpl) then) =
      __$$ActiveOtpModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String visitorName,
      String visitType,
      @JsonKey(name: 'endDay', fromJson: NullSafetyHelper.safeDateTime)
      DateTime endDay,
      @JsonKey(name: 'endtime', fromJson: NullSafetyHelper.safeDateTime)
      DateTime endTime});
}

/// @nodoc
class __$$ActiveOtpModelImplCopyWithImpl<$Res>
    extends _$ActiveOtpModelCopyWithImpl<$Res, _$ActiveOtpModelImpl>
    implements _$$ActiveOtpModelImplCopyWith<$Res> {
  __$$ActiveOtpModelImplCopyWithImpl(
      _$ActiveOtpModelImpl _value, $Res Function(_$ActiveOtpModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActiveOtpModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitorName = null,
    Object? visitType = null,
    Object? endDay = null,
    Object? endTime = null,
  }) {
    return _then(_$ActiveOtpModelImpl(
      visitorName: null == visitorName
          ? _value.visitorName
          : visitorName // ignore: cast_nullable_to_non_nullable
              as String,
      visitType: null == visitType
          ? _value.visitType
          : visitType // ignore: cast_nullable_to_non_nullable
              as String,
      endDay: null == endDay
          ? _value.endDay
          : endDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActiveOtpModelImpl implements _ActiveOtpModel {
  const _$ActiveOtpModelImpl(
      {this.visitorName = '',
      this.visitType = '',
      @JsonKey(name: 'endDay', fromJson: NullSafetyHelper.safeDateTime)
      required this.endDay,
      @JsonKey(name: 'endtime', fromJson: NullSafetyHelper.safeDateTime)
      required this.endTime});

  factory _$ActiveOtpModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiveOtpModelImplFromJson(json);

  @override
  @JsonKey()
  final String visitorName;
  @override
  @JsonKey()
  final String visitType;
  @override
  @JsonKey(name: 'endDay', fromJson: NullSafetyHelper.safeDateTime)
  final DateTime endDay;
  @override
  @JsonKey(name: 'endtime', fromJson: NullSafetyHelper.safeDateTime)
  final DateTime endTime;

  @override
  String toString() {
    return 'ActiveOtpModel(visitorName: $visitorName, visitType: $visitType, endDay: $endDay, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveOtpModelImpl &&
            (identical(other.visitorName, visitorName) ||
                other.visitorName == visitorName) &&
            (identical(other.visitType, visitType) ||
                other.visitType == visitType) &&
            (identical(other.endDay, endDay) || other.endDay == endDay) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, visitorName, visitType, endDay, endTime);

  /// Create a copy of ActiveOtpModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveOtpModelImplCopyWith<_$ActiveOtpModelImpl> get copyWith =>
      __$$ActiveOtpModelImplCopyWithImpl<_$ActiveOtpModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiveOtpModelImplToJson(
      this,
    );
  }
}

abstract class _ActiveOtpModel implements ActiveOtpModel {
  const factory _ActiveOtpModel(
      {final String visitorName,
      final String visitType,
      @JsonKey(name: 'endDay', fromJson: NullSafetyHelper.safeDateTime)
      required final DateTime endDay,
      @JsonKey(name: 'endtime', fromJson: NullSafetyHelper.safeDateTime)
      required final DateTime endTime}) = _$ActiveOtpModelImpl;

  factory _ActiveOtpModel.fromJson(Map<String, dynamic> json) =
      _$ActiveOtpModelImpl.fromJson;

  @override
  String get visitorName;
  @override
  String get visitType;
  @override
  @JsonKey(name: 'endDay', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get endDay;
  @override
  @JsonKey(name: 'endtime', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get endTime;

  /// Create a copy of ActiveOtpModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActiveOtpModelImplCopyWith<_$ActiveOtpModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
