import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.child,
    this.safeArea = true,
    this.padding,
  });

  final Widget child;
  final bool safeArea;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    Widget content = Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.background, AppColors.backgroundSoft],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        Positioned.fill(child: CustomPaint(painter: _NotebookGridPainter())),
        Positioned(
          top: -110,
          right: -80,
          child: Container(
            width: 230,
            height: 230,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: .08),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          left: -70,
          bottom: -80,
          child: Container(
            width: 210,
            height: 210,
            decoration: BoxDecoration(
              color: AppColors.oColor.withValues(alpha: .06),
              shape: BoxShape.circle,
            ),
          ),
        ),
        if (padding != null)
          Positioned.fill(child: Padding(padding: padding!, child: child))
        else
          Positioned.fill(child: child),
      ],
    );

    return safeArea ? SafeArea(child: content) : content;
  }
}

class _NotebookGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.divider.withValues(alpha: .32)
      ..strokeWidth = 1;
    const step = 32.0;

    for (double x = 0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
