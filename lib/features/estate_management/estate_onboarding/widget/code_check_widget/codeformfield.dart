import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/model/estate_code_validator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReUsableForm extends ConsumerWidget {
  final String hintText;
  final String label;
  final int length;

  const ReUsableForm({
    super.key,
    required this.hintText,
    required this.length,
    required this.label,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(estateCodeFormProvider);
    final notifier = ref.read(estateCodeFormProvider.notifier);
    final colors = AppColors.instance;

    return TextFormField(
      onChanged: (code) => notifier.updateCode(code, length),
      initialValue: state.code,
      decoration: _buildInputDecoration(state, colors),
      validator: (_) => state.errorMessage,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'[a-zA-Z0-9!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/? ]'),
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration(
    EstateCodeFormState state,
    AppColors colors,
  ) {
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
      suffixIcon:
          state.errorMessage != null
              ? Icon(Icons.error, color: colors.error600)
              : null,
      errorText: state.errorMessage,
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
