import 'dart:developer';

import 'package:curnectgate/core/%20utils/api/api_url.dart';
import 'package:curnectgate/features/%20operations/property_agreement/model/agreements_response.dart';
import 'package:curnectgate/features/%20operations/property_agreement/model/compliance/compliance_response.dart';
import 'package:curnectgate/features/ResidentDirectory/model/comittee_model/committees_response_model.dart';
import 'package:curnectgate/features/ResidentDirectory/model/resident_model/resident_directory_respond.dart';
import 'package:curnectgate/features/auth/data/auth_model/get_start_model/onboarding_slider_response.dart';
import 'package:curnectgate/features/chat/data/chat_model/availableAdmin/estate_admins_response.dart';
import 'package:curnectgate/features/chat/data/chat_model/availableCommitte/committee_members_response.dart';
import 'package:curnectgate/features/chat/data/chat_model/availableSecurity/securityResponde.dart';
import 'package:curnectgate/features/chat/data/model/chat_message.dart';
import 'package:curnectgate/features/chat/data/model/conversation.dart';
import 'package:curnectgate/features/chat/data/model/get_model/conversation_settings_response.dart';
import 'package:curnectgate/features/chat/data/model/get_model/unread_counts_response.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/candidate/candidates_response.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/candidate_result/live_results_response.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/election_Setting/voting_settings_response.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll/polls_response.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll_History/poll_history_response.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll_deteils/poll_details_response.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/summary_result/results_response.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/get_workOder/work_orders_response.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/workOrder_categor/work_order_categories_response.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/household_members_response.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_slug_model/permissions_response_model.dart'
    as slug_model;
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_status_model.dart/permissions_response_model.dart'
    as status_model;
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/property_model/property_response.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/setCurfew/curfew_response_model.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/set_restriction/restriction_status_response.dart';
import 'package:curnectgate/features/member_management/estate_settings/setting_model/estate_settings_response.dart';
import 'package:curnectgate/features/member_management/membership_ID/model/digital_id_status.dart';
import 'package:curnectgate/features/member_management/membership_ID/model/digital_member_id_response.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/Work_permit/clearance_permit_response.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/active_Otp_count/Expired_count/expired_count_response.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/active_Otp_count/active_count/active_count_response.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/otp_response_model.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/permit_model/active_otp_response.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/calendar_events_response_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/events_response_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/resv_model/rsvp_events_response.dart';
import 'package:curnectgate/features/operations/notifications/event/model/EventCodes/event_codes_response_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/notification_count/notification_count_response_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/notification_response.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/remider/reminders_response_model.dart';
import 'package:curnectgate/features/operations/violation/model/GetReport_history_model.dart';
import 'package:curnectgate/features/operations/violation/model/comment_model/comment_response.dart';
import 'package:curnectgate/features/operations/violation/model/estate_Address/estate_address_response.dart';
import 'package:curnectgate/features/operations/violation/model/report_models/violation_response.dart';
import 'package:curnectgate/features/operations/violation/model/violation_category/violation_category_response.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/dashbord_Model/payment_dashboard_response.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/due_model/outstanding_dues_response.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/history_model/payment_history_response.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/payment_method/payment_methods_response.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/wallet_history/wallet_history_response.dart';
import 'package:curnectgate/features/security/model/checkIn_ceckOut_model/api_response_model.dart';
import 'package:curnectgate/features/security/model/checkIn_ceckOut_model/checkOut/checkout_history_response_model.dart';
import 'package:curnectgate/features/security/model/count_model/violation_count_response.dart';
import 'package:curnectgate/features/security/model/duty_model/duty_response.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/model/get_user_notifications.dart';
import 'package:curnectgate/features/userProfile/Privacy_setting/model/get_user_privacy_settings.dart';
import 'package:curnectgate/features/userProfile/notification_setting/model/get_user_notification_settings.dart';
import 'package:curnectgate/features/userProfile/profile/model/get_user_profile_model.dart';
import 'package:dio/dio.dart';

class GetApiService {
  final Dio _dio;

  GetApiService(this._dio);

  Future<GetUserProfile> getUserProfile({required String bearerToken}) async {
    try {
      final response = await _dio.get(getUserprofile);
      return GetUserProfile.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<GetUserNotificationSettings> getUserNotificationSettings({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getNotification);
      return GetUserNotificationSettings.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<GetUserPrivacySettings> getUserPrivacySettings({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getSettingPrivacy);
      return GetUserPrivacySettings.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Map<String, dynamic>> signOut({required String token}) async {
    final response = await _dio.get(
      appLogOut,
      options: Options(validateStatus: (status) => status! < 500),
    );
    return response.data;
  }

  Future<GetuserNotifications> getPreferences({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getSettingPreferences);
      return GetuserNotifications.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<NotificationResponse> getAllNotification({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getNotificationApi);
      return NotificationResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<RemindersResponseModel> getAllReminder({
    required String bearerToken,
    required String category,
  }) async {
    try {
      final response = await _dio.get(
        "estates/general/reminders?category=$category",
      );
      return RemindersResponseModel.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<EstateAddressResponse> getAllAdress({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getViolationLocation);
      return EstateAddressResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ViolationCategoryResponse> getReportCategory({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getViolationCategorys);
      return ViolationCategoryResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Map<String, dynamic> requestData(String status) {
    switch (status) {
      case "all":
        return {"filter": status};
      default:
        return {"status": status};
    }
  }

  Future<ViolationResponse> getreport({
    required String bearerToken,
    required String filter,
  }) async {
    try {
      final Map<String, dynamic> requestDatas = requestData(
        filter.toLowerCase(),
      );
      final response = await _dio.get(listOfViolation, data: requestDatas);
      return ViolationResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<StatusHistoryResponse> getreportHistor({
    required String bearerToken,
    required int id,
  }) async {
    try {
      final response = await _dio.get("estates/general/violations/$id/history");
      return StatusHistoryResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<CommentResponse> getreportComment({
    required String bearerToken,
    required String id,
  }) async {
    try {
      final response = await _dio.get(
        "estates/general/violations/$id/comments",
      );
      return CommentResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<OtpResponseModel> getVisitorByFilters({
    required String bearerToken,
    required String status,
  }) async {
    try {
      final Map<String, dynamic> requestData = {"status": status};
      final response = await _dio.get(getVisitorByfirter, data: requestData);
      return OtpResponseModel.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ClearancePermitResponse> getworkPermit({
    required String bearerToken,
    required String status,
  }) async {
    try {
      final response = await _dio.get(getWorkpermit);
      return ClearancePermitResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ActiveOtpResponse> geActivePermit() async {
    try {
      final response = await _dio.get(getActivePermit);
      return ActiveOtpResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ExpiredCountResponse> getExpiredCount({
    required String used_expired,
  }) async {
    try {
      final response = await _dio.get("$activeCount$used_expired");
      return ExpiredCountResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ViolationCountResponse> getViolationCounts() async {
    try {
      final response = await _dio.get(getViolationCount);
      return ViolationCountResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ActiveCountResponse> getActiveCount() async {
    try {
      final response = await _dio.get("${activeCount}currently-active");
      return ActiveCountResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<DigitalMemberIdResponse> getDigitalID({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getDigitalIDCode);
      return DigitalMemberIdResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<HouseholdMembersResponse> getHouseHolds({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getHouseHold);
      return HouseholdMembersResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<PropertyResponse> getProperty({required String bearerToken}) async {
    try {
      final response = await _dio.get(getPropertya);
      return PropertyResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<RestrictionStatusResponse> getRestriced({required int id}) async {
    try {
      final response = await _dio.get(
        "estates/owner-portal/digital-member-id/$id/restriction-status",
      );
      return RestrictionStatusResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<status_model.PermissionsResponse> getPermissionStatus({
    required String bearerToken,
    required String id,
  }) async {
    try {
      final response = await _dio.get(
        "estates/owner-portal/households/members/permission/$id/status",
      );
      return status_model.PermissionsResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<slug_model.PermissionsResponse> getPermissionStatisic({
    required String bearerToken,
    required String id,
  }) async {
    try {
      final response = await _dio.get(
        "estates/owner-portal/households/members/permission/$id/specific",
      );
      return slug_model.PermissionsResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<CurfewResponse> getPermissionCurfew({
    required String bearerToken,
    required String id,
  }) async {
    try {
      final response = await _dio.get(
        "estates/owner-portal/households/members/permission/$id/curfew",
      );
      return CurfewResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<CheckoutHistoryResponseModel> getCheckOut({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getCheckOutVisitor);
      return CheckoutHistoryResponseModel.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ApiResponseModel> getCheckIn({required String bearerToken}) async {
    try {
      final response = await _dio.get(getCheckInVisitor);
      return ApiResponseModel.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<NotificationCountResponse> getNotificationCount({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(notificationCount);
      return NotificationCountResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<EventsResponse> getCalender({required String bearerToken}) async {
    try {
      final response = await _dio.get(getCalenders);
      return EventsResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<EventCodesResponse> getEventCode({required String bearerToken}) async {
    try {
      final response = await _dio.get(getEventCodes);
      return EventCodesResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<CalendarEventsResponse> getEvent({
    required String bearerToken,
    required String limit,
    required String statuse,
    String? date,
  }) async {
    try {
      final response = await _dio.get(
        "estates/general/events?status=$statuse&limit=$limit&upcoming=1&start_date=${date ?? ""}",
      );
      log(response.toString());
      return CalendarEventsResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<RsvpEventsResponse> getEventRsvps({required String type}) async {
    final Map<String, dynamic> respondBody = {
      "response": type,
      "include_past": true,
      "limit": 50,
    };
    try {
      final response = await _dio.get(getEventRsvp, data: respondBody);
      return RsvpEventsResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ResidentDirectoryResponse> getResident({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getResinde);
      return ResidentDirectoryResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<CommitteesResponse> getCommittees({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getCommitt);
      return CommitteesResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<WorkOrderCategoriesResponse> getWorkOrderCategories({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(workOrdercategorie);
      return WorkOrderCategoriesResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<WorkOrderResponse> getWorkerOrder({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getworkOrder);
      return WorkOrderResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<DigitalIdStatus> fetchDigitalIdStatus({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getDigitalStatus);
      return DigitalIdStatus.fromJson(response.data);
    } on DioException {
      return DigitalIdStatus(hasDigitalId: false);
    }
  }

  Future<CandidatesResponse> getCandidate({
    required String bearerToken,
    required String id,
  }) async {
    try {
      final response = await _dio.get(
        "estates/general/voting/polls/$id/candidates",
      );
      return CandidatesResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<LiveResultsResponse> getCandidateResult({
    required String bearerToken,
    required String id,
  }) async {
    try {
      final response = await _dio.get(
        "estates/general/voting/polls/$id/live-results",
      );
      return LiveResultsResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ResultsResponse> getCandidateResultSummary({
    required String bearerToken,
    required String id,
  }) async {
    try {
      final response = await _dio.get(
        "estates/general/voting/polls/$id/results",
      );
      return ResultsResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<PollDetailsResponse> getPollDeteils({
    required String bearerToken,
    required String id,
  }) async {
    try {
      final response = await _dio.get("estates/general/voting/polls/$id");
      return PollDetailsResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<PollHistoryResponse> getPollHistory({
    required String bearerToken,
    required String id,
  }) async {
    try {
      final response = await _dio.get(getVoteHistory);
      return PollHistoryResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<VotingSettingsResponse> getVotingSettings({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(votingSetting);
      return VotingSettingsResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<PollsResponse> getPoll({
    required String bearerToken,
    required String id,
  }) async {
    try {
      final response = await _dio.get(votingPoll);
      return PollsResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<PaymentDashboardResponse> getPaymentDashbord({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getPaymentDashbords);
      return PaymentDashboardResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<OutstandingDuesResponse> getDuePayemnt({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getDuePayments);
      return OutstandingDuesResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<WalletHistoryResponse> getwalletHistory({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getWalletHistorys);
      return WalletHistoryResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<PaymentHistoryResponse> getPaymentHistory({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getPaymentHistorys);
      return PaymentHistoryResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<EstateSettingsResponse> getEstateSettings({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(emergencyContact);
      return EstateSettingsResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<PaymentMethodsResponse> getPayMethod({
    required String bearerToken,
  }) async {
    try {
      final response = await _dio.get(getPaymentMethod);
      return PaymentMethodsResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<EstateAdminsResponse> getAdminList() async {
    try {
      final response = await _dio.get(getAvailableAdmin);

      return EstateAdminsResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ConversationSettingsResponse> getChatSettings(String id) async {
    try {
      final response = await _dio.get(
        "estates/general/messaging/conversations/$id/settings",
      );
      return ConversationSettingsResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<CommitteeMembersResponse> getComitteList() async {
    try {
      final response = await _dio.get(getAvailabeCommeti);
      log(response.toString());
      return CommitteeMembersResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<SecurityPersonnelResponse> getSecurityList() async {
    try {
      final response = await _dio.get(getAvailableScurity);
      return SecurityPersonnelResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<AgreementsResponse> getAgreement() async {
    try {
      final response = await _dio.get(aGREEMENT);
      return AgreementsResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ComplianceResponse> getMyComplence() async {
    try {
      final response = await _dio.get(compliance);
      return ComplianceResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Map<String, dynamic>> getReverbConfig() async {
    try {
      final response = await _dio.get(
        reverb,
        options: Options(extra: {'requiresAuth': true}),
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<OnboardingSliderResponse> getSlider() async {
    try {
      final response = await _dio.get(sliderEnpoint);
      return OnboardingSliderResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<DutyResponse> getDuty() async {
    try {
      final response = await _dio.get(
        sliderEnpoint,
        options: Options(extra: {'requiresAuth': true}),
      );
      return DutyResponse.safeFromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<Conversation>> getListConversation() async {
    try {
      final response = await _dio.get(getConversation);

      if (response.data['success'] != true) {
        throw Exception(
          response.data['message'] ?? 'Failed to load conversations',
        );
      }

      final List<dynamic> convList =
          response.data['data']['conversations'] ?? [];
      return convList.map((json) => Conversation.safeFromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<Message>> getMessages(int conversationId) async {
    try {
      final response = await _dio.get(
        "estates/general/messaging/conversations/$conversationId/messages",
        options: Options(extra: {'requiresAuth': true}),
      );

      if (response.data['success'] != true) {
        throw Exception(response.data['message'] ?? 'Failed to load messages');
      }

      final List<dynamic> msgList = response.data['data']['messages'] ?? [];
      return msgList.map((json) => Message.safeFromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<UnreadCountsResponse> getUnreadCounts() async {
    try {
      final response = await _dio.get(getUnredCounts);
      return UnreadCountsResponse.fromSafeJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleError(DioException e) {
    if (e.response != null) {
      if (e.response!.statusCode == 401) {
        return 'Unauthorized - Please login again';
      } else if (e.response!.statusCode == 404) {
        return 'Resource not found';
      }
      try {
        final errorData = e.response!.data;
        return errorData['message'] ?? errorData['error'] ?? 'Unknown error';
      } catch (_) {
        return 'Failed to parse error response';
      }
    } else {
      return e.message ?? 'Network error occurred';
    }
  }
}
