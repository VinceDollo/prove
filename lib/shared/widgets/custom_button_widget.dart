import 'package:flutter/material.dart';
import 'package:flutter_starter/core/values/colors.dart';
import 'package:flutter_starter/core/values/dimensions.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget._({
    required this.text,
    required this.onPressed,
    this.width,
    this.prefixIcon,
    this.color,
    this.isLoading = false,
    this.isEnabled = true,
    this.isOutlined = false,
    Key? key,
  }) : super(key: key);

  factory CustomButtonWidget.outlined({
    required String text,
    required VoidCallback onPressed,
    double? width,
    Widget? prefixIcon,
    Color? color,
    bool isLoading = false,
    bool isEnabled = true,
    Key? key,
  }) {
    return CustomButtonWidget._(
      text: text,
      onPressed: onPressed,
      width: width,
      prefixIcon: prefixIcon,
      isLoading: isLoading,
      isEnabled: isEnabled,
      isOutlined: true,
      color: color,
      key: key,
    );
  }

  factory CustomButtonWidget.filled({
    required String text,
    required VoidCallback onPressed,
    double? width,
    Widget? prefixIcon,
    Color? color,
    bool isLoading = false,
    bool isEnabled = true,
    Key? key,
  }) {
    return CustomButtonWidget._(
      text: text,
      onPressed: onPressed,
      width: width,
      prefixIcon: prefixIcon,
      isLoading: isLoading,
      isEnabled: isEnabled,
      color: color,
      key: key,
    );
  }

  final String text;
  final VoidCallback onPressed;
  final double? width;
  final Widget? prefixIcon;
  final bool isLoading;
  final bool isEnabled;
  final bool isOutlined;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? AppColors.primary;

    final buttonContent = isLoading
        ? SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              color: isOutlined && isEnabled && !isLoading ? color : Colors.white,
              strokeWidth: 2.5,
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null) ...[
                IconTheme(
                  data: IconThemeData(
                    color: isOutlined ? buttonColor : Colors.white,
                  ),
                  child: prefixIcon!,
                ),
                const SizedBox(width: AppDimensions.paddingS),
              ],
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: isOutlined ? buttonColor : Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          );

    final button = ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: isOutlined ? Colors.transparent : (isEnabled ? buttonColor : Colors.grey.shade400),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingM,
          vertical: AppDimensions.paddingM,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          side: isOutlined && isEnabled && !isLoading
              ? BorderSide(color: isEnabled ? buttonColor : Colors.grey.shade400, width: 1.5)
              : BorderSide.none,
        ),
      ),
      onPressed: isEnabled && !isLoading ? onPressed : null,
      child: buttonContent,
    );

    return SizedBox(
      width: width ?? double.infinity,
      child: button,
    );
  }
}
