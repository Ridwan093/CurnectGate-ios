import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Separate provider for password validation state
final passwordValidationProvider =
    StateNotifierProvider<PasswordValidationNotifier, PasswordValidationState>((
      ref,
    ) {
      return PasswordValidationNotifier();
    });

class PasswordValidationNotifier
    extends StateNotifier<PasswordValidationState> {
  PasswordValidationNotifier() : super(PasswordValidationState());

  void validate(String password) {
    state = PasswordValidationState(
      hasMinLength: password.length >= 9,
      hasNumber: password.contains(RegExp(r'[0-9]')),
      hasSpecialChar: password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
    );
  }
}

class PasswordValidationState {
  final bool hasMinLength;
  final bool hasNumber;
  final bool hasSpecialChar;

  PasswordValidationState({
    this.hasMinLength = false,
    this.hasNumber = false,
    this.hasSpecialChar = false,
  });

  bool get allvallid => hasSpecialChar && hasNumber && hasSpecialChar;
}

// Password visibility provider
final passwordVisibilityProvider = StateProvider<bool>((ref) => false);

class PasswordInput extends ConsumerWidget {
  final String hintText;
  final String label;
  final bool showErroindicator;
  final ValueChanged<String>? onChanged;

  const PasswordInput({
    super.key,
    required this.hintText,
    required this.label,
    this.onChanged,
    required this.showErroindicator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors.instance;
    final showPassword = ref.watch(passwordVisibilityProvider);
    final validationState = ref.watch(passwordValidationProvider);
    // final formState = ref.watch(formProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          obscureText: !showPassword,
          decoration: _buildInputDecoration(colors),
          onChanged: (value) {
            // Update main form provider
            ref.read(formProvider.notifier).updatePassword(value);
            // Update validation state
            ref.read(passwordValidationProvider.notifier).validate(value);
            onChanged?.call(value);
          },
        ),
        const SizedBox(height: 8),
        if (showErroindicator)
          _buildValidationMessages(validationState, colors),
      ],
    );
  }

  Widget _buildValidationMessages(
    PasswordValidationState state,
    AppColors colors,
  ) {
    return Column(
      children: [
        const SizedBox(height: 10),
        _buildValidationRow("At least one number", state.hasNumber, colors),
        _buildValidationRow(
          "At least 9 or more characters",
          state.hasMinLength,
          colors,
        ),
        _buildValidationRow(
          "At least 1 special character (e.g.!., @, #,\$,%,^)",
          state.hasSpecialChar,
          colors,
        ),
      ],
    );
  }

  Widget _buildValidationRow(String text, bool isValid, AppColors colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.error,
            size: 16,
            color: isValid ? colors.teal500 : colors.error600,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 12,
                color: isValid ? colors.teal500 : colors.error600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(AppColors colors) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.black400),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.black400),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.error600),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.error600),
      ),
      hintText: hintText,
      labelText: label,
      labelStyle: TextStyle(
        fontFamily: FontFamilies.interDisplay,
        color: colors.black300,
        fontSize: 13,
      ),
      errorStyle: TextStyle(
        fontFamily: FontFamilies.interDisplay,
        color: colors.error600,
        fontSize: 12,
      ),
      hintStyle: TextStyle(
        fontFamily: FontFamilies.interDisplay,
        color: colors.black300,
        fontSize: 13,
      ),
    );
  }
}
