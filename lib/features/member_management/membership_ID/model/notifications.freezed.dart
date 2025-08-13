// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Notifications _$NotificationsFromJson(Map<String, dynamic> json) {
  return _Notifications.fromJson(json);
}

/// @nodoc
mixin _$Notifications {
  @JsonKey(name: 'sms')
  bool? get sms => throw _privateConstructorUsedError;
  @JsonKey(name: 'push')
  bool? get push => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  bool? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'payments')
  bool? get payments => throw _privateConstructorUsedError;
  @JsonKey(name: 'security')
  bool? get security => throw _privateConstructorUsedError;
  @JsonKey(name: 'community')
  bool? get community => throw _privateConstructorUsedError;
  @JsonKey(name: 'maintenance')
  bool? get maintenance => throw _privateConstructorUsedError;
  @JsonKey(name: 'community_updates')
  bool? get communityUpdates => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_reminders')
  bool? get paymentReminders => throw _privateConstructorUsedError;
  @JsonKey(name: 'maintenance_alerts')
  bool? get maintenanceAlerts => throw _privateConstructorUsedError;

  /// Serializes this Notifications to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationsCopyWith<Notifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsCopyWith<$Res> {
  factory $NotificationsCopyWith(
          Notifications value, $Res Function(Notifications) then) =
      _$NotificationsCopyWithImpl<$Res, Notifications>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sms') bool? sms,
      @JsonKey(name: 'push') bool? push,
      @JsonKey(name: 'email') bool? email,
      @JsonKey(name: 'payments') bool? payments,
      @JsonKey(name: 'security') bool? security,
      @JsonKey(name: 'community') bool? community,
      @JsonKey(name: 'maintenance') bool? maintenance,
      @JsonKey(name: 'community_updates') bool? communityUpdates,
      @JsonKey(name: 'payment_reminders') bool? paymentReminders,
      @JsonKey(name: 'maintenance_alerts') bool? maintenanceAlerts});
}

/// @nodoc
class _$NotificationsCopyWithImpl<$Res, $Val extends Notifications>
    implements $NotificationsCopyWith<$Res> {
  _$NotificationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sms = freezed,
    Object? push = freezed,
    Object? email = freezed,
    Object? payments = freezed,
    Object? security = freezed,
    Object? community = freezed,
    Object? maintenance = freezed,
    Object? communityUpdates = freezed,
    Object? paymentReminders = freezed,
    Object? maintenanceAlerts = freezed,
  }) {
    return _then(_value.copyWith(
      sms: freezed == sms
          ? _value.sms
          : sms // ignore: cast_nullable_to_non_nullable
              as bool?,
      push: freezed == push
          ? _value.push
          : push // ignore: cast_nullable_to_non_nullable
              as bool?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as bool?,
      payments: freezed == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as bool?,
      security: freezed == security
          ? _value.security
          : security // ignore: cast_nullable_to_non_nullable
              as bool?,
      community: freezed == community
          ? _value.community
          : community // ignore: cast_nullable_to_non_nullable
              as bool?,
      maintenance: freezed == maintenance
          ? _value.maintenance
          : maintenance // ignore: cast_nullable_to_non_nullable
              as bool?,
      communityUpdates: freezed == communityUpdates
          ? _value.communityUpdates
          : communityUpdates // ignore: cast_nullable_to_non_nullable
              as bool?,
      paymentReminders: freezed == paymentReminders
          ? _value.paymentReminders
          : paymentReminders // ignore: cast_nullable_to_non_nullable
              as bool?,
      maintenanceAlerts: freezed == maintenanceAlerts
          ? _value.maintenanceAlerts
          : maintenanceAlerts // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationsImplCopyWith<$Res>
    implements $NotificationsCopyWith<$Res> {
  factory _$$NotificationsImplCopyWith(
          _$NotificationsImpl value, $Res Function(_$NotificationsImpl) then) =
      __$$NotificationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sms') bool? sms,
      @JsonKey(name: 'push') bool? push,
      @JsonKey(name: 'email') bool? email,
      @JsonKey(name: 'payments') bool? payments,
      @JsonKey(name: 'security') bool? security,
      @JsonKey(name: 'community') bool? community,
      @JsonKey(name: 'maintenance') bool? maintenance,
      @JsonKey(name: 'community_updates') bool? communityUpdates,
      @JsonKey(name: 'payment_reminders') bool? paymentReminders,
      @JsonKey(name: 'maintenance_alerts') bool? maintenanceAlerts});
}

/// @nodoc
class __$$NotificationsImplCopyWithImpl<$Res>
    extends _$NotificationsCopyWithImpl<$Res, _$NotificationsImpl>
    implements _$$NotificationsImplCopyWith<$Res> {
  __$$NotificationsImplCopyWithImpl(
      _$NotificationsImpl _value, $Res Function(_$NotificationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sms = freezed,
    Object? push = freezed,
    Object? email = freezed,
    Object? payments = freezed,
    Object? security = freezed,
    Object? community = freezed,
    Object? maintenance = freezed,
    Object? communityUpdates = freezed,
    Object? paymentReminders = freezed,
    Object? maintenanceAlerts = freezed,
  }) {
    return _then(_$NotificationsImpl(
      sms: freezed == sms
          ? _value.sms
          : sms // ignore: cast_nullable_to_non_nullable
              as bool?,
      push: freezed == push
          ? _value.push
          : push // ignore: cast_nullable_to_non_nullable
              as bool?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as bool?,
      payments: freezed == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as bool?,
      security: freezed == security
          ? _value.security
          : security // ignore: cast_nullable_to_non_nullable
              as bool?,
      community: freezed == community
          ? _value.community
          : community // ignore: cast_nullable_to_non_nullable
              as bool?,
      maintenance: freezed == maintenance
          ? _value.maintenance
          : maintenance // ignore: cast_nullable_to_non_nullable
              as bool?,
      communityUpdates: freezed == communityUpdates
          ? _value.communityUpdates
          : communityUpdates // ignore: cast_nullable_to_non_nullable
              as bool?,
      paymentReminders: freezed == paymentReminders
          ? _value.paymentReminders
          : paymentReminders // ignore: cast_nullable_to_non_nullable
              as bool?,
      maintenanceAlerts: freezed == maintenanceAlerts
          ? _value.maintenanceAlerts
          : maintenanceAlerts // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$NotificationsImpl implements _Notifications {
  const _$NotificationsImpl(
      {@JsonKey(name: 'sms') this.sms,
      @JsonKey(name: 'push') this.push,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'payments') this.payments,
      @JsonKey(name: 'security') this.security,
      @JsonKey(name: 'community') this.community,
      @JsonKey(name: 'maintenance') this.maintenance,
      @JsonKey(name: 'community_updates') this.communityUpdates,
      @JsonKey(name: 'payment_reminders') this.paymentReminders,
      @JsonKey(name: 'maintenance_alerts') this.maintenanceAlerts});

  factory _$NotificationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationsImplFromJson(json);

  @override
  @JsonKey(name: 'sms')
  final bool? sms;
  @override
  @JsonKey(name: 'push')
  final bool? push;
  @override
  @JsonKey(name: 'email')
  final bool? email;
  @override
  @JsonKey(name: 'payments')
  final bool? payments;
  @override
  @JsonKey(name: 'security')
  final bool? security;
  @override
  @JsonKey(name: 'community')
  final bool? community;
  @override
  @JsonKey(name: 'maintenance')
  final bool? maintenance;
  @override
  @JsonKey(name: 'community_updates')
  final bool? communityUpdates;
  @override
  @JsonKey(name: 'payment_reminders')
  final bool? paymentReminders;
  @override
  @JsonKey(name: 'maintenance_alerts')
  final bool? maintenanceAlerts;

  @override
  String toString() {
    return 'Notifications(sms: $sms, push: $push, email: $email, payments: $payments, security: $security, community: $community, maintenance: $maintenance, communityUpdates: $communityUpdates, paymentReminders: $paymentReminders, maintenanceAlerts: $maintenanceAlerts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsImpl &&
            (identical(other.sms, sms) || other.sms == sms) &&
            (identical(other.push, push) || other.push == push) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.payments, payments) ||
                other.payments == payments) &&
            (identical(other.security, security) ||
                other.security == security) &&
            (identical(other.community, community) ||
                other.community == community) &&
            (identical(other.maintenance, maintenance) ||
                other.maintenance == maintenance) &&
            (identical(other.communityUpdates, communityUpdates) ||
                other.communityUpdates == communityUpdates) &&
            (identical(other.paymentReminders, paymentReminders) ||
                other.paymentReminders == paymentReminders) &&
            (identical(other.maintenanceAlerts, maintenanceAlerts) ||
                other.maintenanceAlerts == maintenanceAlerts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sms,
      push,
      email,
      payments,
      security,
      community,
      maintenance,
      communityUpdates,
      paymentReminders,
      maintenanceAlerts);

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsImplCopyWith<_$NotificationsImpl> get copyWith =>
      __$$NotificationsImplCopyWithImpl<_$NotificationsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationsImplToJson(
      this,
    );
  }
}

abstract class _Notifications implements Notifications {
  const factory _Notifications(
          {@JsonKey(name: 'sms') final bool? sms,
          @JsonKey(name: 'push') final bool? push,
          @JsonKey(name: 'email') final bool? email,
          @JsonKey(name: 'payments') final bool? payments,
          @JsonKey(name: 'security') final bool? security,
          @JsonKey(name: 'community') final bool? community,
          @JsonKey(name: 'maintenance') final bool? maintenance,
          @JsonKey(name: 'community_updates') final bool? communityUpdates,
          @JsonKey(name: 'payment_reminders') final bool? paymentReminders,
          @JsonKey(name: 'maintenance_alerts') final bool? maintenanceAlerts}) =
      _$NotificationsImpl;

  factory _Notifications.fromJson(Map<String, dynamic> json) =
      _$NotificationsImpl.fromJson;

  @override
  @JsonKey(name: 'sms')
  bool? get sms;
  @override
  @JsonKey(name: 'push')
  bool? get push;
  @override
  @JsonKey(name: 'email')
  bool? get email;
  @override
  @JsonKey(name: 'payments')
  bool? get payments;
  @override
  @JsonKey(name: 'security')
  bool? get security;
  @override
  @JsonKey(name: 'community')
  bool? get community;
  @override
  @JsonKey(name: 'maintenance')
  bool? get maintenance;
  @override
  @JsonKey(name: 'community_updates')
  bool? get communityUpdates;
  @override
  @JsonKey(name: 'payment_reminders')
  bool? get paymentReminders;
  @override
  @JsonKey(name: 'maintenance_alerts')
  bool? get maintenanceAlerts;

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationsImplCopyWith<_$NotificationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
