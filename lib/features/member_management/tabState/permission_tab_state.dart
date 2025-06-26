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
  vendorLog,
  revokevendorconfirm,
  startConversation,
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
