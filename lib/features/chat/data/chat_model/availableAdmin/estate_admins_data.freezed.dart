// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estate_admins_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstateAdminsData _$EstateAdminsDataFromJson(Map<String, dynamic> json) {
  return _EstateAdminsData.fromJson(json);
}

/// @nodoc
mixin _$EstateAdminsData {
  List<EstateAdmin>? get admins => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get roleBadge => throw _privateConstructorUsedError;

  /// Serializes this EstateAdminsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EstateAdminsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstateAdminsDataCopyWith<EstateAdminsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstateAdminsDataCopyWith<$Res> {
  factory $EstateAdminsDataCopyWith(
          EstateAdminsData value, $Res Function(EstateAdminsData) then) =
      _$EstateAdminsDataCopyWithImpl<$Res, EstateAdminsData>;
  @useResult
  $Res call(
      {List<EstateAdmin>? admins, int? count, String? role, String? roleBadge});
}

/// @nodoc
class _$EstateAdminsDataCopyWithImpl<$Res, $Val extends EstateAdminsData>
    implements $EstateAdminsDataCopyWith<$Res> {
  _$EstateAdminsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EstateAdminsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? admins = freezed,
    Object? count = freezed,
    Object? role = freezed,
    Object? roleBadge = freezed,
  }) {
    return _then(_value.copyWith(
      admins: freezed == admins
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<EstateAdmin>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      roleBadge: freezed == roleBadge
          ? _value.roleBadge
          : roleBadge // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EstateAdminsDataImplCopyWith<$Res>
    implements $EstateAdminsDataCopyWith<$Res> {
  factory _$$EstateAdminsDataImplCopyWith(_$EstateAdminsDataImpl value,
          $Res Function(_$EstateAdminsDataImpl) then) =
      __$$EstateAdminsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EstateAdmin>? admins, int? count, String? role, String? roleBadge});
}

/// @nodoc
class __$$EstateAdminsDataImplCopyWithImpl<$Res>
    extends _$EstateAdminsDataCopyWithImpl<$Res, _$EstateAdminsDataImpl>
    implements _$$EstateAdminsDataImplCopyWith<$Res> {
  __$$EstateAdminsDataImplCopyWithImpl(_$EstateAdminsDataImpl _value,
      $Res Function(_$EstateAdminsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of EstateAdminsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? admins = freezed,
    Object? count = freezed,
    Object? role = freezed,
    Object? roleBadge = freezed,
  }) {
    return _then(_$EstateAdminsDataImpl(
      admins: freezed == admins
          ? _value._admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<EstateAdmin>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      roleBadge: freezed == roleBadge
          ? _value.roleBadge
          : roleBadge // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$EstateAdminsDataImpl implements _EstateAdminsData {
  const _$EstateAdminsDataImpl(
      {final List<EstateAdmin>? admins, this.count, this.role, this.roleBadge})
      : _admins = admins;

  factory _$EstateAdminsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstateAdminsDataImplFromJson(json);

  final List<EstateAdmin>? _admins;
  @override
  List<EstateAdmin>? get admins {
    final value = _admins;
    if (value == null) return null;
    if (_admins is EqualUnmodifiableListView) return _admins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? count;
  @override
  final String? role;
  @override
  final String? roleBadge;

  @override
  String toString() {
    return 'EstateAdminsData(admins: $admins, count: $count, role: $role, roleBadge: $roleBadge)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstateAdminsDataImpl &&
            const DeepCollectionEquality().equals(other._admins, _admins) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.roleBadge, roleBadge) ||
                other.roleBadge == roleBadge));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_admins), count, role, roleBadge);

  /// Create a copy of EstateAdminsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstateAdminsDataImplCopyWith<_$EstateAdminsDataImpl> get copyWith =>
      __$$EstateAdminsDataImplCopyWithImpl<_$EstateAdminsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstateAdminsDataImplToJson(
      this,
    );
  }
}

abstract class _EstateAdminsData implements EstateAdminsData {
  const factory _EstateAdminsData(
      {final List<EstateAdmin>? admins,
      final int? count,
      final String? role,
      final String? roleBadge}) = _$EstateAdminsDataImpl;

  factory _EstateAdminsData.fromJson(Map<String, dynamic> json) =
      _$EstateAdminsDataImpl.fromJson;

  @override
  List<EstateAdmin>? get admins;
  @override
  int? get count;
  @override
  String? get role;
  @override
  String? get roleBadge;

  /// Create a copy of EstateAdminsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstateAdminsDataImplCopyWith<_$EstateAdminsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
