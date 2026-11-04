import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class ProceedButton extends StatefulWidget {
  final bool isValid;
  final Future<void> Function() onTap;
  const ProceedButton({required this.isValid, required this.onTap});

  @override
  State<ProceedButton> createState() => ProceedButtonState();
}

class ProceedButtonState extends State<ProceedButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0,
      upperBound: 0.04,
    );
    _scale = Tween(
      begin: 1.0,
      end: 0.96,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    if (!widget.isValid || _loading) return;
    await _ctrl.forward();
    await _ctrl.reverse();
    setState(() => _loading = true);
    try {
      await widget.onTap();
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.instance;
    return ScaleTransition(
      scale: _scale,
      child: GestureDetector(
        onTap: _handleTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 54,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.isValid ? colors.black600 : colors.grey400,
            borderRadius: BorderRadius.circular(14),
            boxShadow:
                widget.isValid
                    ? [
                      BoxShadow(
                        color: colors.black600.withOpacity(0.25),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                    : [],
          ),
          child: Center(
            child:
                _loading
                    ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.5,
                      ),
                    )
                    : Text(
                      'Proceed to Pay',
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                        fontSize: 15,
                        color: widget.isValid ? Colors.white : colors.black300,
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
