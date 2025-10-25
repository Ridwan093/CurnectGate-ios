// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkOrderData _$WorkOrderDataFromJson(Map<String, dynamic> json) {
  return _WorkOrderData.fromJson(json);
}

/// @nodoc
mixin _$WorkOrderData {
  WorkOrderList get workorders => throw _privateConstructorUsedError;

  /// Serializes this WorkOrderData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkOrderData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkOrderDataCopyWith<WorkOrderData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrderDataCopyWith<$Res> {
  factory $WorkOrderDataCopyWith(
          WorkOrderData value, $Res Function(WorkOrderData) then) =
      _$WorkOrderDataCopyWithImpl<$Res, WorkOrderData>;
  @useResult
  $Res call({WorkOrderList workorders});

  $WorkOrderListCopyWith<$Res> get workorders;
}

/// @nodoc
class _$WorkOrderDataCopyWithImpl<$Res, $Val extends WorkOrderData>
    implements $WorkOrderDataCopyWith<$Res> {
  _$WorkOrderDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkOrderData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workorders = null,
  }) {
    return _then(_value.copyWith(
      workorders: null == workorders
          ? _value.workorders
          : workorders // ignore: cast_nullable_to_non_nullable
              as WorkOrderList,
    ) as $Val);
  }

  /// Create a copy of WorkOrderData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkOrderListCopyWith<$Res> get workorders {
    return $WorkOrderListCopyWith<$Res>(_value.workorders, (value) {
      return _then(_value.copyWith(workorders: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkOrderDataImplCopyWith<$Res>
    implements $WorkOrderDataCopyWith<$Res> {
  factory _$$WorkOrderDataImplCopyWith(
          _$WorkOrderDataImpl value, $Res Function(_$WorkOrderDataImpl) then) =
      __$$WorkOrderDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WorkOrderList workorders});

  @override
  $WorkOrderListCopyWith<$Res> get workorders;
}

/// @nodoc
class __$$WorkOrderDataImplCopyWithImpl<$Res>
    extends _$WorkOrderDataCopyWithImpl<$Res, _$WorkOrderDataImpl>
    implements _$$WorkOrderDataImplCopyWith<$Res> {
  __$$WorkOrderDataImplCopyWithImpl(
      _$WorkOrderDataImpl _value, $Res Function(_$WorkOrderDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkOrderData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workorders = null,
  }) {
    return _then(_$WorkOrderDataImpl(
      workorders: null == workorders
          ? _value.workorders
          : workorders // ignore: cast_nullable_to_non_nullable
              as WorkOrderList,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$WorkOrderDataImpl implements _WorkOrderData {
  const _$WorkOrderDataImpl({required this.workorders});

  factory _$WorkOrderDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkOrderDataImplFromJson(json);

  @override
  final WorkOrderList workorders;

  @override
  String toString() {
    return 'WorkOrderData(workorders: $workorders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrderDataImpl &&
            (identical(other.workorders, workorders) ||
                other.workorders == workorders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, workorders);

  /// Create a copy of WorkOrderData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOrderDataImplCopyWith<_$WorkOrderDataImpl> get copyWith =>
      __$$WorkOrderDataImplCopyWithImpl<_$WorkOrderDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkOrderDataImplToJson(
      this,
    );
  }
}

abstract class _WorkOrderData implements WorkOrderData {
  const factory _WorkOrderData({required final WorkOrderList workorders}) =
      _$WorkOrderDataImpl;

  factory _WorkOrderData.fromJson(Map<String, dynamic> json) =
      _$WorkOrderDataImpl.fromJson;

  @override
  WorkOrderList get workorders;

  /// Create a copy of WorkOrderData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkOrderDataImplCopyWith<_$WorkOrderDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
