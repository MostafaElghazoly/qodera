import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/text_themes.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool isReadOnly, isObscureText, enabled;
  final String? hintText, initialValue;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix, prefix;
  final int? maxLines;
  final String? Function(String? value)? validator;
  final void Function(String value)? onFieldSubmitted;
  final void Function(String value)? onChanged;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  const MyTextField({
    super.key,
    this.controller,
    this.inputFormatters,
    this.maxLines = 1,
    this.enabled = true,
    this.isReadOnly = false,
    this.isObscureText = false,
    this.hintText,
    this.initialValue,
    this.hintStyle,
    this.suffix,
    this.prefix,
    this.onFieldSubmitted,
    this.onTap,
    this.onChanged,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      inputFormatters: inputFormatters,
      enabled: enabled,
      controller: controller,
      maxLines: maxLines,
      cursorColor: AppColors.primary,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      style: TextThemes.style14400,
      readOnly: isReadOnly,
      initialValue: initialValue,
      onTap: onTap,
      obscureText: isObscureText,
      onChanged: (value) {
        onChanged?.call(value);
      },
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        suffixIcon: Padding(padding: EdgeInsetsDirectional.only(end: 16.w), child: suffix),
        prefixIcon: prefix,
      ),
      validator: validator,
    );
  }
}
