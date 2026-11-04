import 'package:flutter/material.dart';

class ChatSettingsSkeleton extends StatefulWidget {
  const ChatSettingsSkeleton({super.key});

  @override
  State<ChatSettingsSkeleton> createState() => _ChatSettingsSkeletonState();
}

class _ChatSettingsSkeletonState extends State<ChatSettingsSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _box(double h, double w) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final opacity = 0.3 + (_controller.value * 0.5);

        return Opacity(
          opacity: opacity,
          child: Container(
            height: h,
            width: w,
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _box(50, double.infinity),
        const SizedBox(height: 20),
        Wrap(
          runAlignment: WrapAlignment.spaceAround,
          spacing: 10,

          children: [_box(40, 70), _box(40, 70), _box(40, 90)],
        ),
        const SizedBox(height: 30),
        _box(50, double.infinity),
      ],
    );
  }
}
