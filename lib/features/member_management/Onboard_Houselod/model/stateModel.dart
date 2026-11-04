import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_slug_model/conditions_model.dart';
import 'package:flutter/material.dart';

class CurfewState {
  final bool isCurfewEnabled;
  final List<String> repeatDays;
  final Map<String, TimeOfDay?> startTimes;
  final Map<String, TimeOfDay?> endTimes;
  final bool enableVisitorInvitation;
  final bool requiresApproval;
  final int maxVisitorsPerDay;
  final List<String>? facilities;
  final String id;
  final Conditions? facilityConditions;
  final bool? isFacilityEnabled;
  final String? facilityReason;
  final Conditions? gateConditions;
  final String? gateReason;
  final String expiredDay;
  final bool? isGateEnabled;
  final bool? ispackingEnabled;
  final bool? isNightEnable;
  // final bool requiredApproval;
  final String? visitorReason;
  final String? otherReason;
  final bool? isCommunityEnabel;
  final bool? moderated;
  final int? totalComment;
  final int? totalPost;

  CurfewState({
    this.otherReason = "",
    this.visitorReason = "",
    this.gateReason = "",
    this.expiredDay = "",
    this.facilityReason = "",
    this.facilityConditions,
    this.gateConditions,
    this.isNightEnable = false,
    this.isGateEnabled = false,
    this.isFacilityEnabled = false,
    this.isCurfewEnabled = false,
    this.enableVisitorInvitation = false,
    this.maxVisitorsPerDay = 0,
    this.isCommunityEnabel = false,
    this.moderated = false,
    this.totalComment = 0,
    this.totalPost = 0,
    this.requiresApproval = false,
    this.ispackingEnabled = false,

    this.repeatDays = const [],
    this.facilities = const [],
    this.id = '',
    Map<String, TimeOfDay?>? startTimes,
    Map<String, TimeOfDay?>? endTimes,
  }) : startTimes =
           startTimes ??
           {
             'Monday': null,
             'Tuesday': null,
             'Wednesday': null,
             'Thursday': null,
             'Friday': null,
             'Saturday': null,
             'Sunday': null,
           },
       endTimes =
           endTimes ??
           {
             'Monday': null,
             'Tuesday': null,
             'Wednesday': null,
             'Thursday': null,
             'Friday': null,
             'Saturday': null,
             'Sunday': null,
           };

  /// CopyWith method for immutable updates
  CurfewState copyWith({
    bool? isCurfewEnabled,
    List<String>? repeatDays,
    Map<String, TimeOfDay?>? startTimes,
    Map<String, TimeOfDay?>? endTimes,
    List<String>? facilities,
    bool? enableVisitorInvitation,
    bool? requiresApproval,
    int? maxVisitorsPerDay,
    String? id,
    Conditions? facilityConditions,
    Conditions? gateConditions,
    bool? isFacilityEnabled,
    bool? isGateEnabled,
    String? facilityReason,
    String? gateReason,
    String? expiredDay,
    String? visitorReason,
    String? otherReason,
    bool? ispackingEnabled,
    bool? isCommunityEnabel,
    bool? moderated,
    bool? isNightEnable,
    int? totalComment,
    int? totalPost,
  }) {
    return CurfewState(
      isNightEnable: isNightEnable ?? this.isNightEnable,
      isCommunityEnabel: isCommunityEnabel ?? this.isCommunityEnabel,
      moderated: moderated ?? this.moderated,
      totalComment: totalComment ?? this.totalComment,
      totalPost: totalPost ?? this.totalPost,
      otherReason: otherReason ?? this.otherReason,
      ispackingEnabled: ispackingEnabled ?? this.ispackingEnabled,
      visitorReason: visitorReason ?? this.visitorReason,
      isGateEnabled: isGateEnabled ?? this.isGateEnabled,
      gateReason: gateReason ?? this.gateReason,
      expiredDay: expiredDay ?? this.expiredDay,
      gateConditions: gateConditions ?? this.gateConditions,
      facilityReason: facilityReason ?? this.facilityReason,
      isFacilityEnabled: isFacilityEnabled ?? this.isFacilityEnabled,
      facilityConditions: facilityConditions ?? this.facilityConditions,
      id: id ?? this.id,
      isCurfewEnabled: isCurfewEnabled ?? this.isCurfewEnabled,
      repeatDays: repeatDays ?? this.repeatDays,
      startTimes: startTimes ?? this.startTimes,
      endTimes: endTimes ?? this.endTimes,
      enableVisitorInvitation:
          enableVisitorInvitation ?? this.enableVisitorInvitation,
      requiresApproval: requiresApproval ?? this.requiresApproval,
      maxVisitorsPerDay: maxVisitorsPerDay ?? this.maxVisitorsPerDay,
      facilities: facilities ?? this.facilities,
    );
  }
}
