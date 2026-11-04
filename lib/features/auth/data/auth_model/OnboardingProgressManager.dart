import 'package:curnectgate/features/auth/data/auth_model/onbording_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProgressManager {
  static const String _key = 'onboarding_step';

  static Future<void> saveStep(OnboardingStep step) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, step.name);
  }

  // static Future<OnboardingStep> getStep() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final value = prefs.getString(_key);
  //   return OnboardingStep.values.firstWhere(
  //     (e) => e.name == value,
  //     orElse: () => OnboardingStep.completed,
  //   );
  // }

  static Future<OnboardingStep?> getStep() async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.getString(_key);
  if (value == null) return null; // ✅ no saved progress
  try {
    return OnboardingStep.values.firstWhere((e) => e.name == value);
  } catch (_) {
    return null; // ✅ if corrupted data
  }
}


  static Future<void> clearProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

// // After validating estate code
// await OnboardingProgressManager.saveStep(OnboardingStep.memberCode);

// // After validating member code
// await OnboardingProgressManager.saveStep(OnboardingStep.infoCheck);

// // After confirming info
// await OnboardingProgressManager.saveStep(OnboardingStep.password);

// // After setting password
// await OnboardingProgressManager.saveStep(OnboardingStep.otp);

// // After OTP verified successfully
// await OnboardingProgressManager.clearProgress();
