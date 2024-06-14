import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter/values/colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.focus,
    this.onTap,
    this.errorText,
    this.controller,
    this.width,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.validator,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onSaved,
    this.isPhoneNumber,
    this.readOnly,
    this.enabled = true,
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
  final bool? isPhoneNumber;
  final bool? readOnly;
  final bool enabled;

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
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // style: AppTextStyles.textFromFieldText,
      initialValue: widget.initialValue,
      enabled: widget.enabled,
      readOnly: widget.readOnly ?? false,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      focusNode: widget.focus,
      onTap: widget.onTap,
      cursorColor: AppColors.black,
      obscureText: isPasswordHide,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                child: isPasswordHide
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                onTap: () {
                  setState(() {
                    isPasswordHide = !isPasswordHide;
                  });
                },
              )
            : widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        suffixIconColor: AppColors.black.withOpacity(0.6),
        filled: true,
        // fillColor: !widget.enabled
        //     ? AppColors.lightGrey
        //     : AppColors.lightGrey.withOpacity(0.05),
        labelText: widget.labelText,
        errorText: widget.errorText,
        // labelStyle: AppTextStyles.textFromFieldLabel,
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppColors.black.withOpacity(0.05),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 1.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppColors.black.withOpacity(0.2),
            width: 1.5,
          ),
        ),
      ),
      onChanged: (content) {
        if (null != widget.onChanged) {
          widget.onChanged!(content);
        }
      },
      validator: widget.validator,
      onSaved: (value) {
        if (null != widget.onChanged) {
          widget.onSaved!(value);
        }
      },
      controller: widget.controller,
    );
  }
}
