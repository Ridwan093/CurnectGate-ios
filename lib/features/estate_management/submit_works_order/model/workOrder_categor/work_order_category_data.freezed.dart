// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_category_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkOrderCategoryData _$WorkOrderCategoryDataFromJson(
    Map<String, dynamic> json) {
  return _WorkOrderCategoryData.fromJson(json);
}

/// @nodoc
mixin _$WorkOrderCategoryData {
  List<WorkOrderCategory>? get categories => throw _privateConstructorUsedError;

  /// Serializes this WorkOrderCategoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkOrderCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkOrderCategoryDataCopyWith<WorkOrderCategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrderCategoryDataCopyWith<$Res> {
  factory $WorkOrderCategoryDataCopyWith(WorkOrderCategoryData value,
          $Res Function(WorkOrderCategoryData) then) =
      _$WorkOrderCategoryDataCopyWithImpl<$Res, WorkOrderCategoryData>;
  @useResult
  $Res call({List<WorkOrderCategory>? categories});
}

/// @nodoc
class _$WorkOrderCategoryDataCopyWithImpl<$Res,
        $Val extends WorkOrderCategoryData>
    implements $WorkOrderCategoryDataCopyWith<$Res> {
  _$WorkOrderCategoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkOrderCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderCategory>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkOrderCategoryDataImplCopyWith<$Res>
    implements $WorkOrderCategoryDataCopyWith<$Res> {
  factory _$$WorkOrderCategoryDataImplCopyWith(
          _$WorkOrderCategoryDataImpl value,
          $Res Function(_$WorkOrderCategoryDataImpl) then) =
      __$$WorkOrderCategoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WorkOrderCategory>? categories});
}

/// @nodoc
class __$$WorkOrderCategoryDataImplCopyWithImpl<$Res>
    extends _$WorkOrderCategoryDataCopyWithImpl<$Res,
        _$WorkOrderCategoryDataImpl>
    implements _$$WorkOrderCategoryDataImplCopyWith<$Res> {
  __$$WorkOrderCategoryDataImplCopyWithImpl(_$WorkOrderCategoryDataImpl _value,
      $Res Function(_$WorkOrderCategoryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkOrderCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_$WorkOrderCategoryDataImpl(
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderCategory>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$WorkOrderCategoryDataImpl implements _WorkOrderCategoryData {
  const _$WorkOrderCategoryDataImpl({final List<WorkOrderCategory>? categories})
      : _categories = categories;

  factory _$WorkOrderCategoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkOrderCategoryDataImplFromJson(json);

  final List<WorkOrderCategory>? _categories;
  @override
  List<WorkOrderCategory>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WorkOrderCategoryData(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrderCategoryDataImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  /// Create a copy of WorkOrderCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOrderCategoryDataImplCopyWith<_$WorkOrderCategoryDataImpl>
      get copyWith => __$$WorkOrderCategoryDataImplCopyWithImpl<
          _$WorkOrderCategoryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkOrderCategoryDataImplToJson(
      this,
    );
  }
}

abstract class _WorkOrderCategoryData implements WorkOrderCategoryData {
  const factory _WorkOrderCategoryData(
          {final List<WorkOrderCategory>? categories}) =
      _$WorkOrderCategoryDataImpl;

  factory _WorkOrderCategoryData.fromJson(Map<String, dynamic> json) =
      _$WorkOrderCategoryDataImpl.fromJson;

  @override
  List<WorkOrderCategory>? get categories;

  /// Create a copy of WorkOrderCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkOrderCategoryDataImplCopyWith<_$WorkOrderCategoryDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
