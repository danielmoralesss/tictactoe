import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';

class GoldButton extends StatelessWidget {
  const GoldButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.height = 56,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final double height;

  @override
  Widget build(BuildContext context) {
    final disabled = onPressed == null;
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: disabled ? AppColors.surfaceHigher : AppColors.primary,
          foregroundColor: disabled ? AppColors.textSecondary : Colors.white,
          shadowColor: Colors.black.withValues(alpha: .12),
          elevation: disabled ? 0 : 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        icon: icon != null ? Icon(icon, size: 22) : const SizedBox.shrink(),
        label: Text(
          label,
          style: GoogleFonts.inter(fontWeight: FontWeight.w800, fontSize: 16),
        ),
      ),
    );
  }
}
