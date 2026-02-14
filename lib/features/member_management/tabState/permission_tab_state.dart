// Define permission types
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PermissionType {
  managePayments,
  accessAllNotifications,
  createManageVisitors,
  deactivatePass,
}

enum BottomSheetView {
  userDetails,
  permissions,
  deleteConfirmation,
  setCofew,
  setPermission,
  facility,
  parking,
  gateAccess,

  communty,
  nightAccess,
  setRestrictions,
  addRestrictions,
  removedRestrictions,
  setbasicpermission,
  visitorIvitaion,
  vendorLog,
  afterphoto,
  revokevendorconfirm,
  startConversation,
  selectedAdminforChat,
  selectedCommitteeChat,
  selectedSecurityChat,
  initChat,
  messageuplodefile,
  chatSettings,
  messageEmergency,
  reportviolation,
  reportfileuplode,
  resolutionTime,
  manageOTPforvisitor,
  generateOtpwithperiod,
  validatorcustom,
  scheduleOtp,
  revorkActiveOtp,
  revorkActiveOtpConfirmation,
  activeOTPHistory,
  fundingWithbankTransfer,
  payOustanding,
  confirmEntry,
  validatedOTP,
  valdationConfrm,
  accesGranted,
  specifyNumberofGust,
  digitalIdConfirm,
  digitalIdDeny,
  digitalIdApproved,
  digitalIDaprovedMessage,
  digitalIdDenymessage,
  workEmgencyContacts,
  residentEmgencyContacts,
  notificationReminderFilter,
  notificationSetting,
  addReminder,
  remidermarks,
  profileUpdat,
  profilePiceUpdate,
  deactivateAccount,
  changePassword,
  securityViolationTrack,
  securityCommentMaker,
  securitydismissViolation,
  mentainLog,
  additionForScan,
  additionForDissmissedEntry,
  optionForIdAndCode,
  optionForAll,
  optionForScan,
  denyEntry,
  workOdervalidation,
  workOderSeletion,
  vendorCodeCornfirm,
  vendorCodeApproved,
  vendorCodeDeny,
  vendorCodeDenyMessage,
  vendorCodeApprovedMessage,
  vendoraccesCodConfirm,
  vendorCheckIn,
  vendorCheckOut,
  vendorcheckinMessage,
  vendorCheckoutmessage,
  vendoraccesCodeDeny,
  vendorAccessCodeDeyMessage,

  validateWorker,
  validateVendor,
  visitorValidation,
  acceptCheckOut,
  checkOutWithpermitConfirm,
  checkoutPermitdeny,
  checkOutPermitApproved,
  cheoutPermitDenymessage,
  checkoutpermitapprovedmessaage,
  denyEntryConfirmation,
  commentvew,
  removedReminder,
  events,
  eventsDetails,
  eventRsvpDetails,
  permitAccces,
  addpermitItems,
  shedulPermit,
  schedulpermitItem,
  seletPermit,
  seletctEvent,
  createdEvent,
  myeventCode,
  eventSetting,
  checkEventcode,
  eventDeactive,
  fundingAmount,
  paymentSuccess,
  termsAndCondition,
}

// State notifier for permissions
class PermissionsNotifier extends StateNotifier<Set<PermissionType>> {
  PermissionsNotifier() : super(<PermissionType>{});

  void toggle(PermissionType permission) {
    final newState = Set<PermissionType>.from(state); // Create a new set
    if (newState.contains(permission)) {
      newState.remove(permission);
    } else {
      newState.add(permission);
    }
    state = newState;
  }
}

// Provider for permissions
final permissionsProvider =
    StateNotifierProvider<PermissionsNotifier, Set<PermissionType>>(
      (ref) => PermissionsNotifier(),
    );

// State provider for bottom sheet
final bottomSheetStateProvider = StateProvider<BottomSheetView>((ref) {
  return BottomSheetView.userDetails;
});
