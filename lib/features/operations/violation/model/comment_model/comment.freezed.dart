// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  int? get id => throw _privateConstructorUsedError;
  int? get violationId => throw _privateConstructorUsedError;
  CommentUser? get user => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  bool? get isInternal => throw _privateConstructorUsedError;
  bool? get hasMedia => throw _privateConstructorUsedError;
  String? get mediaUrl => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  bool? get canEdit => throw _privateConstructorUsedError;
  bool? get canDelete => throw _privateConstructorUsedError;

  /// Serializes this Comment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {int? id,
      int? violationId,
      CommentUser? user,
      String? comment,
      bool? isInternal,
      bool? hasMedia,
      String? mediaUrl,
      String? createdAt,
      String? updatedAt,
      bool? canEdit,
      bool? canDelete});

  $CommentUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? violationId = freezed,
    Object? user = freezed,
    Object? comment = freezed,
    Object? isInternal = freezed,
    Object? hasMedia = freezed,
    Object? mediaUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? canEdit = freezed,
    Object? canDelete = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      violationId: freezed == violationId
          ? _value.violationId
          : violationId // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CommentUser?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      isInternal: freezed == isInternal
          ? _value.isInternal
          : isInternal // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasMedia: freezed == hasMedia
          ? _value.hasMedia
          : hasMedia // ignore: cast_nullable_to_non_nullable
              as bool?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      canEdit: freezed == canEdit
          ? _value.canEdit
          : canEdit // ignore: cast_nullable_to_non_nullable
              as bool?,
      canDelete: freezed == canDelete
          ? _value.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommentUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $CommentUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
          _$CommentImpl value, $Res Function(_$CommentImpl) then) =
      __$$CommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? violationId,
      CommentUser? user,
      String? comment,
      bool? isInternal,
      bool? hasMedia,
      String? mediaUrl,
      String? createdAt,
      String? updatedAt,
      bool? canEdit,
      bool? canDelete});

  @override
  $CommentUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
      _$CommentImpl _value, $Res Function(_$CommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? violationId = freezed,
    Object? user = freezed,
    Object? comment = freezed,
    Object? isInternal = freezed,
    Object? hasMedia = freezed,
    Object? mediaUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? canEdit = freezed,
    Object? canDelete = freezed,
  }) {
    return _then(_$CommentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      violationId: freezed == violationId
          ? _value.violationId
          : violationId // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CommentUser?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      isInternal: freezed == isInternal
          ? _value.isInternal
          : isInternal // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasMedia: freezed == hasMedia
          ? _value.hasMedia
          : hasMedia // ignore: cast_nullable_to_non_nullable
              as bool?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      canEdit: freezed == canEdit
          ? _value.canEdit
          : canEdit // ignore: cast_nullable_to_non_nullable
              as bool?,
      canDelete: freezed == canDelete
          ? _value.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CommentImpl implements _Comment {
  const _$CommentImpl(
      {this.id,
      this.violationId,
      this.user,
      this.comment,
      this.isInternal,
      this.hasMedia,
      this.mediaUrl,
      this.createdAt,
      this.updatedAt,
      this.canEdit,
      this.canDelete});

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  final int? id;
  @override
  final int? violationId;
  @override
  final CommentUser? user;
  @override
  final String? comment;
  @override
  final bool? isInternal;
  @override
  final bool? hasMedia;
  @override
  final String? mediaUrl;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final bool? canEdit;
  @override
  final bool? canDelete;

  @override
  String toString() {
    return 'Comment(id: $id, violationId: $violationId, user: $user, comment: $comment, isInternal: $isInternal, hasMedia: $hasMedia, mediaUrl: $mediaUrl, createdAt: $createdAt, updatedAt: $updatedAt, canEdit: $canEdit, canDelete: $canDelete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.violationId, violationId) ||
                other.violationId == violationId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.isInternal, isInternal) ||
                other.isInternal == isInternal) &&
            (identical(other.hasMedia, hasMedia) ||
                other.hasMedia == hasMedia) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.canEdit, canEdit) || other.canEdit == canEdit) &&
            (identical(other.canDelete, canDelete) ||
                other.canDelete == canDelete));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, violationId, user, comment,
      isInternal, hasMedia, mediaUrl, createdAt, updatedAt, canEdit, canDelete);

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {final int? id,
      final int? violationId,
      final CommentUser? user,
      final String? comment,
      final bool? isInternal,
      final bool? hasMedia,
      final String? mediaUrl,
      final String? createdAt,
      final String? updatedAt,
      final bool? canEdit,
      final bool? canDelete}) = _$CommentImpl;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  int? get id;
  @override
  int? get violationId;
  @override
  CommentUser? get user;
  @override
  String? get comment;
  @override
  bool? get isInternal;
  @override
  bool? get hasMedia;
  @override
  String? get mediaUrl;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  bool? get canEdit;
  @override
  bool? get canDelete;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
