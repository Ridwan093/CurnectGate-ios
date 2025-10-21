// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_code_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventCode _$EventCodeFromJson(Map<String, dynamic> json) {
  return _EventCode.fromJson(json);
}

/// @nodoc
mixin _$EventCode {
  int? get id => throw _privateConstructorUsedError;
  String? get eventCode => throw _privateConstructorUsedError;
  String? get formattedCode => throw _privateConstructorUsedError;
  String? get eventTitle => throw _privateConstructorUsedError;
  String? get eventDescription => throw _privateConstructorUsedError;
  String? get eventType => throw _privateConstructorUsedError;
  String? get eventTypeDisplay => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get statusDisplay => throw _privateConstructorUsedError;
  String? get statusColor => throw _privateConstructorUsedError;
  EventRequester? get requester => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get eventLocation => throw _privateConstructorUsedError;
  String? get eventStartDate => throw _privateConstructorUsedError;
  String? get eventEndDate => throw _privateConstructorUsedError;
  String? get eventStartFormatted => throw _privateConstructorUsedError;
  String? get eventEndFormatted => throw _privateConstructorUsedError;
  int? get expectedGuests => throw _privateConstructorUsedError;
  int? get totalGuestsEntered => throw _privateConstructorUsedError;
  int? get totalGuestsDenied => throw _privateConstructorUsedError;
  int? get usageCount => throw _privateConstructorUsedError;
  int? get guestEntryRate => throw _privateConstructorUsedError;
  String? get qrCodeUrl => throw _privateConstructorUsedError;
  String? get printableQrCodeUrl => throw _privateConstructorUsedError;
  String? get specialInstructions => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  bool? get isExpired => throw _privateConstructorUsedError;
  bool? get canBeUsed => throw _privateConstructorUsedError;
  bool? get isOngoing => throw _privateConstructorUsedError;
  bool? get hasEnded => throw _privateConstructorUsedError;
  int? get daysUntilEvent => throw _privateConstructorUsedError;
  int? get durationHours => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get revocationReason => throw _privateConstructorUsedError;
  String? get adminNotes => throw _privateConstructorUsedError;
  bool? get isManualGeneration => throw _privateConstructorUsedError;

  /// Serializes this EventCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCodeCopyWith<EventCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCodeCopyWith<$Res> {
  factory $EventCodeCopyWith(EventCode value, $Res Function(EventCode) then) =
      _$EventCodeCopyWithImpl<$Res, EventCode>;
  @useResult
  $Res call(
      {int? id,
      String? eventCode,
      String? formattedCode,
      String? eventTitle,
      String? eventDescription,
      String? eventType,
      String? eventTypeDisplay,
      String? status,
      String? statusDisplay,
      String? statusColor,
      EventRequester? requester,
      String? address,
      String? eventLocation,
      String? eventStartDate,
      String? eventEndDate,
      String? eventStartFormatted,
      String? eventEndFormatted,
      int? expectedGuests,
      int? totalGuestsEntered,
      int? totalGuestsDenied,
      int? usageCount,
      int? guestEntryRate,
      String? qrCodeUrl,
      String? printableQrCodeUrl,
      String? specialInstructions,
      bool? isActive,
      bool? isExpired,
      bool? canBeUsed,
      bool? isOngoing,
      bool? hasEnded,
      int? daysUntilEvent,
      int? durationHours,
      String? createdAt,
      String? revocationReason,
      String? adminNotes,
      bool? isManualGeneration});

  $EventRequesterCopyWith<$Res>? get requester;
}

/// @nodoc
class _$EventCodeCopyWithImpl<$Res, $Val extends EventCode>
    implements $EventCodeCopyWith<$Res> {
  _$EventCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? eventCode = freezed,
    Object? formattedCode = freezed,
    Object? eventTitle = freezed,
    Object? eventDescription = freezed,
    Object? eventType = freezed,
    Object? eventTypeDisplay = freezed,
    Object? status = freezed,
    Object? statusDisplay = freezed,
    Object? statusColor = freezed,
    Object? requester = freezed,
    Object? address = freezed,
    Object? eventLocation = freezed,
    Object? eventStartDate = freezed,
    Object? eventEndDate = freezed,
    Object? eventStartFormatted = freezed,
    Object? eventEndFormatted = freezed,
    Object? expectedGuests = freezed,
    Object? totalGuestsEntered = freezed,
    Object? totalGuestsDenied = freezed,
    Object? usageCount = freezed,
    Object? guestEntryRate = freezed,
    Object? qrCodeUrl = freezed,
    Object? printableQrCodeUrl = freezed,
    Object? specialInstructions = freezed,
    Object? isActive = freezed,
    Object? isExpired = freezed,
    Object? canBeUsed = freezed,
    Object? isOngoing = freezed,
    Object? hasEnded = freezed,
    Object? daysUntilEvent = freezed,
    Object? durationHours = freezed,
    Object? createdAt = freezed,
    Object? revocationReason = freezed,
    Object? adminNotes = freezed,
    Object? isManualGeneration = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      eventCode: freezed == eventCode
          ? _value.eventCode
          : eventCode // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedCode: freezed == formattedCode
          ? _value.formattedCode
          : formattedCode // ignore: cast_nullable_to_non_nullable
              as String?,
      eventTitle: freezed == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDescription: freezed == eventDescription
          ? _value.eventDescription
          : eventDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      eventType: freezed == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String?,
      eventTypeDisplay: freezed == eventTypeDisplay
          ? _value.eventTypeDisplay
          : eventTypeDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      statusDisplay: freezed == statusDisplay
          ? _value.statusDisplay
          : statusDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      statusColor: freezed == statusColor
          ? _value.statusColor
          : statusColor // ignore: cast_nullable_to_non_nullable
              as String?,
      requester: freezed == requester
          ? _value.requester
          : requester // ignore: cast_nullable_to_non_nullable
              as EventRequester?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      eventLocation: freezed == eventLocation
          ? _value.eventLocation
          : eventLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      eventStartDate: freezed == eventStartDate
          ? _value.eventStartDate
          : eventStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      eventEndDate: freezed == eventEndDate
          ? _value.eventEndDate
          : eventEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      eventStartFormatted: freezed == eventStartFormatted
          ? _value.eventStartFormatted
          : eventStartFormatted // ignore: cast_nullable_to_non_nullable
              as String?,
      eventEndFormatted: freezed == eventEndFormatted
          ? _value.eventEndFormatted
          : eventEndFormatted // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedGuests: freezed == expectedGuests
          ? _value.expectedGuests
          : expectedGuests // ignore: cast_nullable_to_non_nullable
              as int?,
      totalGuestsEntered: freezed == totalGuestsEntered
          ? _value.totalGuestsEntered
          : totalGuestsEntered // ignore: cast_nullable_to_non_nullable
              as int?,
      totalGuestsDenied: freezed == totalGuestsDenied
          ? _value.totalGuestsDenied
          : totalGuestsDenied // ignore: cast_nullable_to_non_nullable
              as int?,
      usageCount: freezed == usageCount
          ? _value.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      guestEntryRate: freezed == guestEntryRate
          ? _value.guestEntryRate
          : guestEntryRate // ignore: cast_nullable_to_non_nullable
              as int?,
      qrCodeUrl: freezed == qrCodeUrl
          ? _value.qrCodeUrl
          : qrCodeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      printableQrCodeUrl: freezed == printableQrCodeUrl
          ? _value.printableQrCodeUrl
          : printableQrCodeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isExpired: freezed == isExpired
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
      canBeUsed: freezed == canBeUsed
          ? _value.canBeUsed
          : canBeUsed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOngoing: freezed == isOngoing
          ? _value.isOngoing
          : isOngoing // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasEnded: freezed == hasEnded
          ? _value.hasEnded
          : hasEnded // ignore: cast_nullable_to_non_nullable
              as bool?,
      daysUntilEvent: freezed == daysUntilEvent
          ? _value.daysUntilEvent
          : daysUntilEvent // ignore: cast_nullable_to_non_nullable
              as int?,
      durationHours: freezed == durationHours
          ? _value.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      revocationReason: freezed == revocationReason
          ? _value.revocationReason
          : revocationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      adminNotes: freezed == adminNotes
          ? _value.adminNotes
          : adminNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      isManualGeneration: freezed == isManualGeneration
          ? _value.isManualGeneration
          : isManualGeneration // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of EventCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventRequesterCopyWith<$Res>? get requester {
    if (_value.requester == null) {
      return null;
    }

    return $EventRequesterCopyWith<$Res>(_value.requester!, (value) {
      return _then(_value.copyWith(requester: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventCodeImplCopyWith<$Res>
    implements $EventCodeCopyWith<$Res> {
  factory _$$EventCodeImplCopyWith(
          _$EventCodeImpl value, $Res Function(_$EventCodeImpl) then) =
      __$$EventCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? eventCode,
      String? formattedCode,
      String? eventTitle,
      String? eventDescription,
      String? eventType,
      String? eventTypeDisplay,
      String? status,
      String? statusDisplay,
      String? statusColor,
      EventRequester? requester,
      String? address,
      String? eventLocation,
      String? eventStartDate,
      String? eventEndDate,
      String? eventStartFormatted,
      String? eventEndFormatted,
      int? expectedGuests,
      int? totalGuestsEntered,
      int? totalGuestsDenied,
      int? usageCount,
      int? guestEntryRate,
      String? qrCodeUrl,
      String? printableQrCodeUrl,
      String? specialInstructions,
      bool? isActive,
      bool? isExpired,
      bool? canBeUsed,
      bool? isOngoing,
      bool? hasEnded,
      int? daysUntilEvent,
      int? durationHours,
      String? createdAt,
      String? revocationReason,
      String? adminNotes,
      bool? isManualGeneration});

  @override
  $EventRequesterCopyWith<$Res>? get requester;
}

/// @nodoc
class __$$EventCodeImplCopyWithImpl<$Res>
    extends _$EventCodeCopyWithImpl<$Res, _$EventCodeImpl>
    implements _$$EventCodeImplCopyWith<$Res> {
  __$$EventCodeImplCopyWithImpl(
      _$EventCodeImpl _value, $Res Function(_$EventCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? eventCode = freezed,
    Object? formattedCode = freezed,
    Object? eventTitle = freezed,
    Object? eventDescription = freezed,
    Object? eventType = freezed,
    Object? eventTypeDisplay = freezed,
    Object? status = freezed,
    Object? statusDisplay = freezed,
    Object? statusColor = freezed,
    Object? requester = freezed,
    Object? address = freezed,
    Object? eventLocation = freezed,
    Object? eventStartDate = freezed,
    Object? eventEndDate = freezed,
    Object? eventStartFormatted = freezed,
    Object? eventEndFormatted = freezed,
    Object? expectedGuests = freezed,
    Object? totalGuestsEntered = freezed,
    Object? totalGuestsDenied = freezed,
    Object? usageCount = freezed,
    Object? guestEntryRate = freezed,
    Object? qrCodeUrl = freezed,
    Object? printableQrCodeUrl = freezed,
    Object? specialInstructions = freezed,
    Object? isActive = freezed,
    Object? isExpired = freezed,
    Object? canBeUsed = freezed,
    Object? isOngoing = freezed,
    Object? hasEnded = freezed,
    Object? daysUntilEvent = freezed,
    Object? durationHours = freezed,
    Object? createdAt = freezed,
    Object? revocationReason = freezed,
    Object? adminNotes = freezed,
    Object? isManualGeneration = freezed,
  }) {
    return _then(_$EventCodeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      eventCode: freezed == eventCode
          ? _value.eventCode
          : eventCode // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedCode: freezed == formattedCode
          ? _value.formattedCode
          : formattedCode // ignore: cast_nullable_to_non_nullable
              as String?,
      eventTitle: freezed == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDescription: freezed == eventDescription
          ? _value.eventDescription
          : eventDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      eventType: freezed == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String?,
      eventTypeDisplay: freezed == eventTypeDisplay
          ? _value.eventTypeDisplay
          : eventTypeDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      statusDisplay: freezed == statusDisplay
          ? _value.statusDisplay
          : statusDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      statusColor: freezed == statusColor
          ? _value.statusColor
          : statusColor // ignore: cast_nullable_to_non_nullable
              as String?,
      requester: freezed == requester
          ? _value.requester
          : requester // ignore: cast_nullable_to_non_nullable
              as EventRequester?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      eventLocation: freezed == eventLocation
          ? _value.eventLocation
          : eventLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      eventStartDate: freezed == eventStartDate
          ? _value.eventStartDate
          : eventStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      eventEndDate: freezed == eventEndDate
          ? _value.eventEndDate
          : eventEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      eventStartFormatted: freezed == eventStartFormatted
          ? _value.eventStartFormatted
          : eventStartFormatted // ignore: cast_nullable_to_non_nullable
              as String?,
      eventEndFormatted: freezed == eventEndFormatted
          ? _value.eventEndFormatted
          : eventEndFormatted // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedGuests: freezed == expectedGuests
          ? _value.expectedGuests
          : expectedGuests // ignore: cast_nullable_to_non_nullable
              as int?,
      totalGuestsEntered: freezed == totalGuestsEntered
          ? _value.totalGuestsEntered
          : totalGuestsEntered // ignore: cast_nullable_to_non_nullable
              as int?,
      totalGuestsDenied: freezed == totalGuestsDenied
          ? _value.totalGuestsDenied
          : totalGuestsDenied // ignore: cast_nullable_to_non_nullable
              as int?,
      usageCount: freezed == usageCount
          ? _value.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      guestEntryRate: freezed == guestEntryRate
          ? _value.guestEntryRate
          : guestEntryRate // ignore: cast_nullable_to_non_nullable
              as int?,
      qrCodeUrl: freezed == qrCodeUrl
          ? _value.qrCodeUrl
          : qrCodeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      printableQrCodeUrl: freezed == printableQrCodeUrl
          ? _value.printableQrCodeUrl
          : printableQrCodeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isExpired: freezed == isExpired
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
      canBeUsed: freezed == canBeUsed
          ? _value.canBeUsed
          : canBeUsed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOngoing: freezed == isOngoing
          ? _value.isOngoing
          : isOngoing // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasEnded: freezed == hasEnded
          ? _value.hasEnded
          : hasEnded // ignore: cast_nullable_to_non_nullable
              as bool?,
      daysUntilEvent: freezed == daysUntilEvent
          ? _value.daysUntilEvent
          : daysUntilEvent // ignore: cast_nullable_to_non_nullable
              as int?,
      durationHours: freezed == durationHours
          ? _value.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      revocationReason: freezed == revocationReason
          ? _value.revocationReason
          : revocationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      adminNotes: freezed == adminNotes
          ? _value.adminNotes
          : adminNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      isManualGeneration: freezed == isManualGeneration
          ? _value.isManualGeneration
          : isManualGeneration // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$EventCodeImpl implements _EventCode {
  const _$EventCodeImpl(
      {this.id,
      this.eventCode,
      this.formattedCode,
      this.eventTitle,
      this.eventDescription,
      this.eventType,
      this.eventTypeDisplay,
      this.status,
      this.statusDisplay,
      this.statusColor,
      this.requester,
      this.address,
      this.eventLocation,
      this.eventStartDate,
      this.eventEndDate,
      this.eventStartFormatted,
      this.eventEndFormatted,
      this.expectedGuests,
      this.totalGuestsEntered,
      this.totalGuestsDenied,
      this.usageCount,
      this.guestEntryRate,
      this.qrCodeUrl,
      this.printableQrCodeUrl,
      this.specialInstructions,
      this.isActive,
      this.isExpired,
      this.canBeUsed,
      this.isOngoing,
      this.hasEnded,
      this.daysUntilEvent,
      this.durationHours,
      this.createdAt,
      this.revocationReason,
      this.adminNotes,
      this.isManualGeneration});

  factory _$EventCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventCodeImplFromJson(json);

  @override
  final int? id;
  @override
  final String? eventCode;
  @override
  final String? formattedCode;
  @override
  final String? eventTitle;
  @override
  final String? eventDescription;
  @override
  final String? eventType;
  @override
  final String? eventTypeDisplay;
  @override
  final String? status;
  @override
  final String? statusDisplay;
  @override
  final String? statusColor;
  @override
  final EventRequester? requester;
  @override
  final String? address;
  @override
  final String? eventLocation;
  @override
  final String? eventStartDate;
  @override
  final String? eventEndDate;
  @override
  final String? eventStartFormatted;
  @override
  final String? eventEndFormatted;
  @override
  final int? expectedGuests;
  @override
  final int? totalGuestsEntered;
  @override
  final int? totalGuestsDenied;
  @override
  final int? usageCount;
  @override
  final int? guestEntryRate;
  @override
  final String? qrCodeUrl;
  @override
  final String? printableQrCodeUrl;
  @override
  final String? specialInstructions;
  @override
  final bool? isActive;
  @override
  final bool? isExpired;
  @override
  final bool? canBeUsed;
  @override
  final bool? isOngoing;
  @override
  final bool? hasEnded;
  @override
  final int? daysUntilEvent;
  @override
  final int? durationHours;
  @override
  final String? createdAt;
  @override
  final String? revocationReason;
  @override
  final String? adminNotes;
  @override
  final bool? isManualGeneration;

  @override
  String toString() {
    return 'EventCode(id: $id, eventCode: $eventCode, formattedCode: $formattedCode, eventTitle: $eventTitle, eventDescription: $eventDescription, eventType: $eventType, eventTypeDisplay: $eventTypeDisplay, status: $status, statusDisplay: $statusDisplay, statusColor: $statusColor, requester: $requester, address: $address, eventLocation: $eventLocation, eventStartDate: $eventStartDate, eventEndDate: $eventEndDate, eventStartFormatted: $eventStartFormatted, eventEndFormatted: $eventEndFormatted, expectedGuests: $expectedGuests, totalGuestsEntered: $totalGuestsEntered, totalGuestsDenied: $totalGuestsDenied, usageCount: $usageCount, guestEntryRate: $guestEntryRate, qrCodeUrl: $qrCodeUrl, printableQrCodeUrl: $printableQrCodeUrl, specialInstructions: $specialInstructions, isActive: $isActive, isExpired: $isExpired, canBeUsed: $canBeUsed, isOngoing: $isOngoing, hasEnded: $hasEnded, daysUntilEvent: $daysUntilEvent, durationHours: $durationHours, createdAt: $createdAt, revocationReason: $revocationReason, adminNotes: $adminNotes, isManualGeneration: $isManualGeneration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventCodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventCode, eventCode) ||
                other.eventCode == eventCode) &&
            (identical(other.formattedCode, formattedCode) ||
                other.formattedCode == formattedCode) &&
            (identical(other.eventTitle, eventTitle) ||
                other.eventTitle == eventTitle) &&
            (identical(other.eventDescription, eventDescription) ||
                other.eventDescription == eventDescription) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.eventTypeDisplay, eventTypeDisplay) ||
                other.eventTypeDisplay == eventTypeDisplay) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusDisplay, statusDisplay) ||
                other.statusDisplay == statusDisplay) &&
            (identical(other.statusColor, statusColor) ||
                other.statusColor == statusColor) &&
            (identical(other.requester, requester) ||
                other.requester == requester) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.eventLocation, eventLocation) ||
                other.eventLocation == eventLocation) &&
            (identical(other.eventStartDate, eventStartDate) ||
                other.eventStartDate == eventStartDate) &&
            (identical(other.eventEndDate, eventEndDate) ||
                other.eventEndDate == eventEndDate) &&
            (identical(other.eventStartFormatted, eventStartFormatted) ||
                other.eventStartFormatted == eventStartFormatted) &&
            (identical(other.eventEndFormatted, eventEndFormatted) ||
                other.eventEndFormatted == eventEndFormatted) &&
            (identical(other.expectedGuests, expectedGuests) ||
                other.expectedGuests == expectedGuests) &&
            (identical(other.totalGuestsEntered, totalGuestsEntered) ||
                other.totalGuestsEntered == totalGuestsEntered) &&
            (identical(other.totalGuestsDenied, totalGuestsDenied) ||
                other.totalGuestsDenied == totalGuestsDenied) &&
            (identical(other.usageCount, usageCount) ||
                other.usageCount == usageCount) &&
            (identical(other.guestEntryRate, guestEntryRate) ||
                other.guestEntryRate == guestEntryRate) &&
            (identical(other.qrCodeUrl, qrCodeUrl) ||
                other.qrCodeUrl == qrCodeUrl) &&
            (identical(other.printableQrCodeUrl, printableQrCodeUrl) ||
                other.printableQrCodeUrl == printableQrCodeUrl) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired) &&
            (identical(other.canBeUsed, canBeUsed) ||
                other.canBeUsed == canBeUsed) &&
            (identical(other.isOngoing, isOngoing) ||
                other.isOngoing == isOngoing) &&
            (identical(other.hasEnded, hasEnded) ||
                other.hasEnded == hasEnded) &&
            (identical(other.daysUntilEvent, daysUntilEvent) ||
                other.daysUntilEvent == daysUntilEvent) &&
            (identical(other.durationHours, durationHours) ||
                other.durationHours == durationHours) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.revocationReason, revocationReason) ||
                other.revocationReason == revocationReason) &&
            (identical(other.adminNotes, adminNotes) ||
                other.adminNotes == adminNotes) &&
            (identical(other.isManualGeneration, isManualGeneration) ||
                other.isManualGeneration == isManualGeneration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        eventCode,
        formattedCode,
        eventTitle,
        eventDescription,
        eventType,
        eventTypeDisplay,
        status,
        statusDisplay,
        statusColor,
        requester,
        address,
        eventLocation,
        eventStartDate,
        eventEndDate,
        eventStartFormatted,
        eventEndFormatted,
        expectedGuests,
        totalGuestsEntered,
        totalGuestsDenied,
        usageCount,
        guestEntryRate,
        qrCodeUrl,
        printableQrCodeUrl,
        specialInstructions,
        isActive,
        isExpired,
        canBeUsed,
        isOngoing,
        hasEnded,
        daysUntilEvent,
        durationHours,
        createdAt,
        revocationReason,
        adminNotes,
        isManualGeneration
      ]);

  /// Create a copy of EventCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventCodeImplCopyWith<_$EventCodeImpl> get copyWith =>
      __$$EventCodeImplCopyWithImpl<_$EventCodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventCodeImplToJson(
      this,
    );
  }
}

abstract class _EventCode implements EventCode {
  const factory _EventCode(
      {final int? id,
      final String? eventCode,
      final String? formattedCode,
      final String? eventTitle,
      final String? eventDescription,
      final String? eventType,
      final String? eventTypeDisplay,
      final String? status,
      final String? statusDisplay,
      final String? statusColor,
      final EventRequester? requester,
      final String? address,
      final String? eventLocation,
      final String? eventStartDate,
      final String? eventEndDate,
      final String? eventStartFormatted,
      final String? eventEndFormatted,
      final int? expectedGuests,
      final int? totalGuestsEntered,
      final int? totalGuestsDenied,
      final int? usageCount,
      final int? guestEntryRate,
      final String? qrCodeUrl,
      final String? printableQrCodeUrl,
      final String? specialInstructions,
      final bool? isActive,
      final bool? isExpired,
      final bool? canBeUsed,
      final bool? isOngoing,
      final bool? hasEnded,
      final int? daysUntilEvent,
      final int? durationHours,
      final String? createdAt,
      final String? revocationReason,
      final String? adminNotes,
      final bool? isManualGeneration}) = _$EventCodeImpl;

  factory _EventCode.fromJson(Map<String, dynamic> json) =
      _$EventCodeImpl.fromJson;

  @override
  int? get id;
  @override
  String? get eventCode;
  @override
  String? get formattedCode;
  @override
  String? get eventTitle;
  @override
  String? get eventDescription;
  @override
  String? get eventType;
  @override
  String? get eventTypeDisplay;
  @override
  String? get status;
  @override
  String? get statusDisplay;
  @override
  String? get statusColor;
  @override
  EventRequester? get requester;
  @override
  String? get address;
  @override
  String? get eventLocation;
  @override
  String? get eventStartDate;
  @override
  String? get eventEndDate;
  @override
  String? get eventStartFormatted;
  @override
  String? get eventEndFormatted;
  @override
  int? get expectedGuests;
  @override
  int? get totalGuestsEntered;
  @override
  int? get totalGuestsDenied;
  @override
  int? get usageCount;
  @override
  int? get guestEntryRate;
  @override
  String? get qrCodeUrl;
  @override
  String? get printableQrCodeUrl;
  @override
  String? get specialInstructions;
  @override
  bool? get isActive;
  @override
  bool? get isExpired;
  @override
  bool? get canBeUsed;
  @override
  bool? get isOngoing;
  @override
  bool? get hasEnded;
  @override
  int? get daysUntilEvent;
  @override
  int? get durationHours;
  @override
  String? get createdAt;
  @override
  String? get revocationReason;
  @override
  String? get adminNotes;
  @override
  bool? get isManualGeneration;

  /// Create a copy of EventCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventCodeImplCopyWith<_$EventCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
