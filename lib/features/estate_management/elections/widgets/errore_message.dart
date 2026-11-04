import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class AnimatedErrorCard extends StatefulWidget {
  final String message;
  final VoidCallback? onClose;

  const AnimatedErrorCard({super.key, required this.message, this.onClose});

  @override
  State<AnimatedErrorCard> createState() => _AnimatedErrorCardState();
}

class _AnimatedErrorCardState extends State<AnimatedErrorCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool _visible = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  void _close() async {
    await _controller.reverse();
    if (mounted) {
      setState(() => _visible = false);
    }
    widget.onClose?.call();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_visible) return const SizedBox.shrink();

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.instance.error200,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.instance.error700),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.error_outline, color: AppColors.instance.error700),
              const SizedBox(width: 10),

              /// MESSAGE
              Expanded(
                child: Text(
                  widget.message,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.4,
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                  ),
                ),
              ),

              /// CLOSE BUTTON
              GestureDetector(
                onTap: _close,
                child: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(Icons.close, size: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
