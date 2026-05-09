import 'package:flutter/material.dart';
import '../../app/themes/app_dimensions.dart';
import '../../app/themes/app_colors.dart';

enum NgButtonVariant { filled, outlined, ghost }

class NgButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final IconData? icon;
  final NgButtonVariant variant;
  final bool loading;
  final bool shrink;
  final bool fullWidth;

  const NgButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.variant = NgButtonVariant.filled,
    this.loading = false,
    this.shrink = false,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget buttonContent = loading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18),
                const SizedBox(width: 8),
              ],
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          );

    Widget button;

    switch (variant) {
      case NgButtonVariant.filled:
        button = FilledButton(
          onPressed: loading ? null : onTap,
          style: shrink ? FilledButton.styleFrom(
            minimumSize: const Size(0, 36),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.s16),
          ) : null,
          child: buttonContent,
        );
        break;
      case NgButtonVariant.outlined:
        button = OutlinedButton(
          onPressed: loading ? null : onTap,
          style: OutlinedButton.styleFrom(
            minimumSize: shrink ? const Size(0, 36) : const Size(0, AppDimensions.buttonHeight),
            tapTargetSize: shrink ? MaterialTapTargetSize.shrinkWrap : null,
            padding: shrink ? const EdgeInsets.symmetric(horizontal: AppDimensions.s16) : null,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radiusMd)),
            side:  BorderSide(color: AppColors.primaryBlue),
            foregroundColor: AppColors.primaryBlue,
          ),
          child: buttonContent,
        );
        break;
      case NgButtonVariant.ghost:
        button = TextButton(
          onPressed: loading ? null : onTap,
          style: TextButton.styleFrom(
            minimumSize: shrink ? const Size(0, 36) : const Size(0, AppDimensions.buttonHeight),
            tapTargetSize: shrink ? MaterialTapTargetSize.shrinkWrap : null,
            padding: shrink ? const EdgeInsets.symmetric(horizontal: AppDimensions.s16) : null,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radiusMd)),
            foregroundColor: AppColors.primaryBlue,
          ),
          child: buttonContent,
        );
        break;
    }

    if (fullWidth && !shrink) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }
}
