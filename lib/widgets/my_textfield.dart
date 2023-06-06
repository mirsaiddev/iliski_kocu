import 'package:flutter/material.dart';
import 'package:iliski_kocu/theme/colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.labelText,
    this.obscureText = false,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
    this.maxLines,
    this.padding,
    this.contentPadding,
    this.onEditingComplete,
    this.labelStyle,
    this.borderRadius = 12,
    this.textInputAction,
    this.validator,
    this.maxLength,
  }) : super(key: key);

  final String labelText;
  final String? initialValue;
  final bool obscureText, readOnly;
  final TextEditingController? controller;
  final Widget? suffixIcon, prefixIcon;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final TextStyle? labelStyle;
  final int? maxLines;
  final double borderRadius;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      initialValue: initialValue,
      onTap: onTap,
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      readOnly: readOnly,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      validator: validator,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelStyle: labelStyle,
        contentPadding: contentPadding,
        fillColor: Colors.indigo,
        focusColor: Colors.green,
        hoverColor: Colors.yellow,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: MyColors.grey,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: MyColors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: MyColors.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: MyColors.primary,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: MyColors.primary,
          ),
        ),
        alignLabelWithHint: true,
        suffixIcon: suffixIcon,
        suffixIconColor: MyColors.primary,
        prefixIcon: prefixIcon,
        iconColor: MyColors.primary,
        labelText: labelText,
      ),
    );
  }
}
