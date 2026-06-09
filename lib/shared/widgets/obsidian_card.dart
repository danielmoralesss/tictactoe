import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class ObsidianCard extends StatelessWidget {
  const ObsidianCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.color,
    this.radius = 22,
    this.glow = false,
  });

  final Widget child;
  final EdgeInsets padding;
  final Color? color;
  final double radius;
  final bool glow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? AppColors.surface,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: glow ? AppColors.primaryMuted : AppColors.ghostBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .06),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}
