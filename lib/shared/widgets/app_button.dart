import 'package:flutter/material.dart';
import 'package:flutter_starter/core/values/dimensions.dart';
import 'package:flutter_starter/core/values/styles.dart';

enum AppButtonVariant { filled, tonal, outlined, ghost, destructive }

enum AppButtonSize { small, medium, large }

enum AppButtonIconPosition { leading, trailing }

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.variant = AppButtonVariant.filled,
    this.size = AppButtonSize.medium,
    this.icon,
    this.iconPosition = AppButtonIconPosition.leading,
    this.isLoading = false,
    this.expand = false,
    this.width,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final IconData? icon;
  final AppButtonIconPosition iconPosition;
  final bool isLoading;
  final bool expand;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final disabled = onPressed == null || isLoading;

    // ── Colors ────────────────────────────────────────────────────────────────
    final Color bg;
    final Color fg;
    var border = BorderSide.none;

    if (disabled) {
      final transparent = variant == AppButtonVariant.outlined || variant == AppButtonVariant.ghost;
      bg = transparent ? Colors.transparent : cs.onSurface.withValues(alpha: 0.12);
      fg = cs.onSurface.withValues(alpha: 0.38);
      if (variant == AppButtonVariant.outlined) {
        border = BorderSide(color: cs.onSurface.withValues(alpha: 0.12));
      }
    } else {
      switch (variant) {
        case AppButtonVariant.filled:
          bg = cs.primary;
          fg = cs.onPrimary;
        case AppButtonVariant.tonal:
          bg = cs.primaryContainer;
          fg = cs.onPrimaryContainer;
        case AppButtonVariant.outlined:
          bg = Colors.transparent;
          fg = cs.primary;
          border = BorderSide(color: cs.outline);
        case AppButtonVariant.ghost:
          bg = Colors.transparent;
          fg = cs.primary;
        case AppButtonVariant.destructive:
          bg = cs.error;
          fg = cs.onError;
      }
    }

    // ── Size ──────────────────────────────────────────────────────────────────
    final (EdgeInsets padding, TextStyle textStyle, double iconSize) = switch (size) {
      AppButtonSize.small => (const EdgeInsets.symmetric(horizontal: 12, vertical: 8), AppTextStyles.labelMedium, 16.0),
      AppButtonSize.medium => (
          const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
          AppTextStyles.labelLarge,
          18.0
        ),
      AppButtonSize.large => (const EdgeInsets.symmetric(horizontal: 24, vertical: 17), AppTextStyles.labelLarge, 20.0),
    };

    // ── Content ───────────────────────────────────────────────────────────────
    Widget content;

    if (isLoading) {
      content = SizedBox.square(
        dimension: iconSize,
        child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(fg)),
      );
    } else if (icon != null) {
      final iconWidget = Icon(icon, size: iconSize, color: fg);
      final text = Text(label, style: textStyle.copyWith(color: fg), maxLines: 1, overflow: TextOverflow.ellipsis);
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: iconPosition == AppButtonIconPosition.leading
            ? [iconWidget, const SizedBox(width: 8), text]
            : [text, const SizedBox(width: 8), iconWidget],
      );
    } else {
      content = Center(
          child: Text(label, style: textStyle.copyWith(color: fg), maxLines: 1, overflow: TextOverflow.ellipsis));
    }

    // ── Button ────────────────────────────────────────────────────────────────
    final button = Material(
      color: bg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
        side: border,
      ),
      child: InkWell(
        onTap: disabled ? null : onPressed,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
        ),
        splashColor: fg.withValues(alpha: 0.12),
        highlightColor: fg.withValues(alpha: 0.06),
        child: Padding(padding: padding, child: content),
      ),
    );

    return expand
        ? SizedBox(width: double.infinity, child: button)
        : width != null
            ? SizedBox(width: width, child: button)
            : button;
  }
}
