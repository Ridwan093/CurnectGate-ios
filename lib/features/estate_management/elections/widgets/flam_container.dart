import 'package:flutter/material.dart';

import 'dart:math';

// class FlameBorder extends StatefulWidget {
//   final Widget child;

//   const FlameBorder({super.key, required this.child});

//   @override
//   State<FlameBorder> createState() => _FlameBorderState();
// }

// class _FlameBorderState extends State<FlameBorder>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     )..repeat(); // 🔥 infinite flame animation
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (_, __) {
//         return Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(14),
//             border: Border.all(width: 3, color: Colors.transparent),
//           ),
//           child: ShaderMask(
//             shaderCallback: (rect) {
//               return LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   AppColors
//                   Colors.red.shade600,
//                   Colors.yellow.shade400,
//                 ],
//                 stops: [
//                   _controller.value,
//                   _controller.value + 0.2,
//                   _controller.value + 0.4,
//                 ],
//                 tileMode: TileMode.decal,
//               ).createShader(rect);
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(14),
//                 border: Border.all(
//                   width: 3,
//                   color: Colors.white, // Base border
//                 ),
//               ),
//               child: widget.child,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class FireBorder extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final double borderWidth;

  const FireBorder({
    super.key,
    required this.child,
    this.borderRadius = 16,
    this.borderWidth = 4,
  });

  @override
  State<FireBorder> createState() => _FireBorderState();
}

class _FireBorderState extends State<FireBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return CustomPaint(
          painter: FirePainter(
            animationValue: _controller.value,
            radius: widget.borderRadius,
            borderWidth: widget.borderWidth,
          ),
          child: widget.child,
        );
      },
    );
  }
}

class FirePainter extends CustomPainter {
  final double animationValue;
  final double radius;
  final double borderWidth;

  FirePainter({
    required this.animationValue,
    required this.radius,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final gradient = SweepGradient(
      startAngle: 0,
      endAngle: 3.14 * 2,
      colors: [
        Colors.orange.withOpacity(0.8),
        Colors.red.withOpacity(0.8),
        Colors.yellow.withOpacity(0.9),
        Colors.orange.withOpacity(0.8),
      ],
      stops: [
        animationValue,
        animationValue + 0.1,
        animationValue + 0.3,
        animationValue + 0.5,
      ],
      tileMode: TileMode.mirror,
    );

    final paint =
        Paint()
          ..shader = gradient.createShader(rect)
          ..style = PaintingStyle.fill
          ..strokeWidth = borderWidth
          ..maskFilter = const MaskFilter.blur(
            BlurStyle.outer,
            8,
          ); // 🔥 Blur glow

    final borderRect = RRect.fromRectAndRadius(
      rect.deflate(borderWidth),
      Radius.circular(radius),
    );

    canvas.drawRRect(borderRect, paint);
  }

  @override
  bool shouldRepaint(covariant FirePainter oldDelegate) => true;
}





class GlowingBorder extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final bool isWinner;

  const GlowingBorder({
    super.key,
    required this.child,
    this.borderRadius = 16,
    required this.isWinner,
  });

  @override
  State<GlowingBorder> createState() => _GlowingBorderState();
}

class _GlowingBorderState extends State<GlowingBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isWinner) return widget.child;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: SweepGradient(
              colors: const [
                Colors.teal,
                Colors.yellow,
                Colors.teal,
                Colors.yellow,
              ],
              transform: GradientRotation(_controller.value * 2 * pi),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(widget.borderRadius - 2),
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
