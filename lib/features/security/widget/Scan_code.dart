import 'package:curnectgate/core/style/colors.dart';
import 'package:flutter/material.dart';

class ScannerOverlay extends StatefulWidget {
  final double scanAreaSize;

  const ScannerOverlay({super.key, required this.scanAreaSize});

  @override
  ScannerOverlayState createState() => ScannerOverlayState();
}

class ScannerOverlayState extends State<ScannerOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: widget.scanAreaSize).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scanner frame border
        Container(
          width: widget.scanAreaSize,
          height: widget.scanAreaSize,
          decoration: BoxDecoration(
          
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        // Animated scanning line
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Positioned(
              top: _animation.value,
              left: 0,
              right: 0,
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                    AppColors.instance.grey200.withOpacity(0.1),
                     AppColors.instance.grey200,
                      AppColors.instance.grey200.withOpacity(0.1),
                    ],
                    stops: const [0.1, 0.5, 0.9],
                  ),
                ),
              ),
            );
          },
        ),

        // Corner indicators
        _buildCornerIndicator(Alignment.topLeft),
        _buildCornerIndicator(Alignment.topRight),
        _buildCornerIndicator(Alignment.bottomLeft),
        _buildCornerIndicator(Alignment.bottomRight),
      ],
    );
  }

  Widget _buildCornerIndicator(Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color:
                  alignment == Alignment.topLeft ||
                          alignment == Alignment.bottomLeft
                      ? AppColors.instance.grey200
                      : Colors.transparent,
              width: 3,
            ),
            right: BorderSide(
              color:
                  alignment == Alignment.topRight ||
                          alignment == Alignment.bottomRight
                      ?  AppColors.instance.grey200
                      : Colors.transparent,
              width: 3,
            ),
            top: BorderSide(
              color:
                  alignment == Alignment.topLeft ||
                          alignment == Alignment.topRight
                      ?  AppColors.instance.grey200
                      : Colors.transparent,
              width: 3,
            ),
            bottom: BorderSide(
              color:
                  alignment == Alignment.bottomLeft ||
                          alignment == Alignment.bottomRight
                      ?  AppColors.instance.grey200
                      : Colors.transparent,
              width: 3,
            ),
            
          ),

        ),
      ),
    );
  }
}
