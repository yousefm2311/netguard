import 'package:flutter/material.dart';
import '../../app/themes/app_dimensions.dart';

class NgCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? elevation;
  final double? borderRadius;
  final VoidCallback? onTap;

  const NgCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.elevation,
    this.borderRadius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget cardContent = Padding(
      padding: padding ?? const EdgeInsets.all(AppDimensions.cardPadding),
      child: child,
    );

    if (onTap != null) {
      cardContent = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius ?? AppDimensions.radiusLg),
        child: cardContent,
      );
    }

    return Card(
      color: color,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? AppDimensions.radiusLg),
        side: BorderSide(color: Theme.of(context).cardTheme.shape is RoundedRectangleBorder 
            ? (Theme.of(context).cardTheme.shape as RoundedRectangleBorder).side.color 
            : Colors.transparent),
      ),
      child: cardContent,
    );
  }
}
