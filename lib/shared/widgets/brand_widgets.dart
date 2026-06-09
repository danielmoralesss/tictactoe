import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class UniSonBadge extends StatelessWidget {
  const UniSonBadge({super.key, this.size = 76});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(size * .24),
        border: Border.all(color: AppColors.ghostBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size * .18),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Image.asset('assets/images/logo_unison.png', fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class EyebrowText extends StatelessWidget {
  const EyebrowText(this.text, {super.key, this.color = AppColors.primary});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.4,
      ),
    );
  }
}

class SoftStatusDot extends StatelessWidget {
  const SoftStatusDot({super.key, this.color = AppColors.primary});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
