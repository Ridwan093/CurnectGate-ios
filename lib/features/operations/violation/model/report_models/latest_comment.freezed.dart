// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'latest_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LatestComment _$LatestCommentFromJson(Map<String, dynamic> json) {
  return _LatestComment.fromJson(json);
}

/// @nodoc
mixin _$LatestComment {
  String get comment => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this LatestComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LatestComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LatestCommentCopyWith<LatestComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatestCommentCopyWith<$Res> {
  factory $LatestCommentCopyWith(
          LatestComment value, $Res Function(LatestComment) then) =
      _$LatestCommentCopyWithImpl<$Res, LatestComment>;
  @useResult
  $Res call({String comment, String user, DateTime createdAt});
}

/// @nodoc
class _$LatestCommentCopyWithImpl<$Res, $Val extends LatestComment>
    implements $LatestCommentCopyWith<$Res> {
  _$LatestCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LatestComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? user = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LatestCommentImplCopyWith<$Res>
    implements $LatestCommentCopyWith<$Res> {
  factory _$$LatestCommentImplCopyWith(
          _$LatestCommentImpl value, $Res Function(_$LatestCommentImpl) then) =
      __$$LatestCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String comment, String user, DateTime createdAt});
}

/// @nodoc
class __$$LatestCommentImplCopyWithImpl<$Res>
    extends _$LatestCommentCopyWithImpl<$Res, _$LatestCommentImpl>
    implements _$$LatestCommentImplCopyWith<$Res> {
  __$$LatestCommentImplCopyWithImpl(
      _$LatestCommentImpl _value, $Res Function(_$LatestCommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of LatestComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? user = null,
    Object? createdAt = null,
  }) {
    return _then(_$LatestCommentImpl(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LatestCommentImpl implements _LatestComment {
  const _$LatestCommentImpl(
      {this.comment = '', this.user = '', required this.createdAt});

  factory _$LatestCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$LatestCommentImplFromJson(json);

  @override
  @JsonKey()
  final String comment;
  @override
  @JsonKey()
  final String user;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'LatestComment(comment: $comment, user: $user, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LatestCommentImpl &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, comment, user, createdAt);

  /// Create a copy of LatestComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LatestCommentImplCopyWith<_$LatestCommentImpl> get copyWith =>
      __$$LatestCommentImplCopyWithImpl<_$LatestCommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LatestCommentImplToJson(
      this,
    );
  }
}

abstract class _LatestComment implements LatestComment {
  const factory _LatestComment(
      {final String comment,
      final String user,
      required final DateTime createdAt}) = _$LatestCommentImpl;

  factory _LatestComment.fromJson(Map<String, dynamic> json) =
      _$LatestCommentImpl.fromJson;

  @override
  String get comment;
  @override
  String get user;
  @override
  DateTime get createdAt;

  /// Create a copy of LatestComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LatestCommentImplCopyWith<_$LatestCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
