import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter/values/colors.dart';
import 'package:flutter_starter/values/dimensions.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    required this.controller,
    Key? key,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.focus,
    this.onTap,
    this.errorText,
    this.width,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.validator,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onSaved,
    this.isPhoneNumber = false,
    this.readOnly = false,
    this.enabled = true,
    this.autofocus = false,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  final String? initialValue;
  final String? labelText;
  final void Function()? onTap;
  final FocusNode? focus;
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final double? width;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final String? errorText;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final bool isPhoneNumber;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isPasswordHide = false;

  @override
  void initState() {
    super.initState();

    if (widget.isPassword) {
      isPasswordHide = true;
    }

    if (widget.initialValue != null) {
      widget.controller!.text = widget.initialValue!;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      keyboardType: widget.isPhoneNumber ? TextInputType.phone : widget.keyboardType,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      inputFormatters: widget.isPhoneNumber
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ]
          : widget.inputFormatters,
      minLines: widget.minLines,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      maxLength: widget.maxLength,
      focusNode: widget.focus,
      onTap: widget.onTap,
      autofocus: widget.autofocus,
      textCapitalization: widget.textCapitalization,
      cursorColor: AppColors.primary,
      obscureText: isPasswordHide,
      decoration: InputDecoration(
        fillColor: widget.enabled ? Colors.grey.withValues(alpha: 0.1) : Colors.grey.shade300,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordHide = !isPasswordHide;
                  });
                },
                child: Icon(
                  isPasswordHide ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black.withValues(alpha: 0.6),
                ),
              )
            : widget.suffixIcon,
        filled: true,
        labelText: widget.labelText,
        hintText: widget.hintText,
        errorText: widget.errorText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          borderSide: BorderSide(
            color: Colors.black.withValues(alpha: 0.05),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.black.withValues(alpha: 0.2),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          borderSide: BorderSide(
            color: Colors.black.withValues(alpha: 0.2),
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          borderSide: BorderSide(
            color: Colors.black.withValues(alpha: 0.2),
            width: 1.5,
          ),
        ),
      ),
      onChanged: widget.onChanged,
      validator: widget.validator,
      onSaved: widget.onSaved,
    );
  }
}
