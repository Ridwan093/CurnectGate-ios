import 'package:curnectgate/core/style/colors.dart';
import 'package:flutter/material.dart';

class AppLoader extends StatefulWidget {
  final LoaderSize size;
  final LoaderType type;
  final Color? color;
  final double strokeWidth;
  final String? loadingText;

  const AppLoader({
    super.key,
    this.size = LoaderSize.medium,
    this.type = LoaderType.circular,
    this.color,
    this.strokeWidth = 4.0,
    this.loadingText,
  });

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.instance;
    final color = widget.color ?? colors.yellow500;
    final size = _getSize(widget.size);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.type == LoaderType.circular) ...[
            RotationTransition(
              turns: _animation,
              child: SizedBox(
                width: 100, 
                 height: 100,
                child: CircularProgressIndicator(
                  value: 0.5,
                  color: color,
                  strokeWidth: widget.strokeWidth,
                  strokeCap: StrokeCap.round,
                ),
              ),
            ),
          ] else ...[
            SizedBox(
              width: size.width,
              height: size.height,
              child: CustomPaint(
                painter: _BouncingDotsPainter(
                  color: color,
                  animation: _animation,
                  dotCount: 3,
                ),
              ),
            ),
          ],
          if (widget.loadingText != null) ...[
            const SizedBox(height: 16),
            Text(
              widget.loadingText!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.black600,
                  ),
            ),
          ],
        ],
      ),
    );
  }

  Size _getSize(LoaderSize size) {
    switch (size) {
      case LoaderSize.small:
        return const Size(24, 24);
      case LoaderSize.medium:
        return const Size(36, 36);
      case LoaderSize.large:
        return const Size(48, 48);
    }
  }
}

class _BouncingDotsPainter extends CustomPainter {
  final Color color;
  final Animation<double> animation;
  final int dotCount;

  _BouncingDotsPainter({
    required this.color,
    required this.animation,
    required this.dotCount,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final dotRadius = size.height / 8;
    final centerY = size.height / 2;

    for (int i = 0; i < dotCount; i++) {
      final dotPosition = i / (dotCount - 1);
      final animationValue = (animation.value + dotPosition) % 1.0;
      final x = size.width * (0.25 + dotPosition * 0.5);
      final y = centerY - (animationValue * 10);

      canvas.drawCircle(
        Offset(x, y),
        dotRadius,
        Paint()..color = color.withOpacity(1 - animationValue * 0.5),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

enum LoaderSize { small, medium, large }
enum LoaderType { circular, bouncingDots }