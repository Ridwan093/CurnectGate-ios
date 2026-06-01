import 'dart:math' as math;

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DeleteAccount extends ConsumerStatefulWidget {
  const DeleteAccount({super.key});

  @override
  ConsumerState<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends ConsumerState<DeleteAccount>
    with TickerProviderStateMixin {
  final TextEditingController _confirmController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isDeleteTyped = false;

  late AnimationController _shakeController;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _confirmController.dispose();
    _passwordController.dispose();
    _shakeController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _onConfirmChanged(String value) {
    setState(() {
      _isDeleteTyped = value.trim().toUpperCase() == 'DELETE';
    });
  }

  bool get _canSubmit =>
      _isDeleteTyped && _passwordController.text.trim().isNotEmpty;

  void _submit() {
    if (!_canSubmit) {
      _shakeController.forward(from: 0);
      return;
    }
    ref
        .read(formProvider.notifier)
        .deleteAccount(
          confirmation: _confirmController.text.toLowerCase().trim(),
          context: context,
          password: _passwordController.text.trim(),
          ref: ref,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(formProvider).deActivatAccountLoading;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Close button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close, color: AppColors.instance.black500),
                onPressed: () => context.pop(),
              ),
            ),

            // Animated danger icon
            Center(
              child: ScaleTransition(
                scale: _pulseAnimation,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.instance.error500.withOpacity(0.12),
                    border: Border.all(
                      color: AppColors.instance.error500.withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.delete_forever,
                    size: 34,
                    color: AppColors.instance.error500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Title
            Center(
              child: Text(
                'Delete Account',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  color: AppColors.instance.error600,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Warning banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.instance.error500.withOpacity(0.07),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.instance.error500.withOpacity(0.25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: AppColors.instance.error500,
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'This action is permanent',
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontWeight: FontFamilies.bold,
                          fontSize: 13,
                          color: AppColors.instance.error600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Deleting your account will permanently remove all your data, including your profile, activity history, and cannot be undone.',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 12,
                      color: AppColors.instance.black400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Type DELETE label
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 13,
                  color: AppColors.instance.black400,
                ),
                children: [
                  const TextSpan(text: 'Type '),
                  TextSpan(
                    text: 'DELETE',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      color: AppColors.instance.error600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const TextSpan(text: ' to confirm'),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // "DELETE" confirmation field with shake animation
            _ShakeWidget(
              controller: _shakeController,
              child: TextField(
                controller: _confirmController,
                onChanged: _onConfirmChanged,
                textCapitalization: TextCapitalization.characters,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  letterSpacing: 2,
                  color:
                      _isDeleteTyped
                          ? AppColors.instance.error600
                          : AppColors.instance.black600,
                ),
                decoration: InputDecoration(
                  hintText: 'DELETE',
                  hintStyle: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black300,
                    letterSpacing: 2,
                  ),
                  suffixIcon:
                      _isDeleteTyped
                          ? Icon(
                            Icons.check_circle_rounded,
                            color: AppColors.instance.error500,
                          )
                          : null,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color:
                          _isDeleteTyped
                              ? AppColors.instance.error500
                              : AppColors.instance.black300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.instance.error500,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Password label
            Text(
              'Enter your password',
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 13,
                color: AppColors.instance.black400,
              ),
            ),
            const SizedBox(height: 8),

            // Password field
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              onChanged: (_) => setState(() {}),
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
              ),
              decoration: InputDecoration(
                hintText: 'Enter password',
                hintStyle: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.instance.black400,
                    size: 20,
                  ),
                  onPressed:
                      () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.instance.black300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.instance.black500,
                    width: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 28),

            // Delete button
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _canSubmit ? 1.0 : 0.45,
              child: InkWell(
                onTap: isLoading ? null : _submit,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color:
                        _canSubmit
                            ? AppColors.instance.error500
                            : AppColors.instance.grey400,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child:
                        isLoading
                            ? SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: Colors.white,
                              ),
                            )
                            : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.delete_forever_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Delete My Account',
                                  style: TextStyle(
                                    fontFamily: FontFamilies.interDisplay,
                                    fontSize: 15,
                                    fontWeight: FontFamilies.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Cancel
            Center(
              child: TextButton(
                onPressed: () => context.pop(),
                child: Text(
                  'Cancel, keep my account',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 13,
                    color: AppColors.instance.black400,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

/// Shake animation widget for wrong input feedback
class _ShakeWidget extends StatelessWidget {
  final Widget child;
  final AnimationController controller;

  const _ShakeWidget({required this.child, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: child,
      builder: (context, child) {
        final sineValue = math.sin(controller.value * math.pi * 4);
        return Transform.translate(
          offset: Offset(sineValue * 8, 0),
          child: child,
        );
      },
    );
  }
}
