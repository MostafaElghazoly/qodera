import 'package:flutter/material.dart';

class ButtonModel {
  double? width;
  double? height;
  double? radius;
  IconData? icon;
  Color? color;
  Color? textColor;
  TextStyle? textStyle;
  Color? borderColor;
  bool fill;
  String? title;
  VoidCallback? onPressed;
  bool isLoading;
  bool enabled;

  ButtonModel({
    this.fill = true,
    this.height,
    this.color,
    this.borderColor,
    this.icon,
    this.width,
    this.textColor,
    this.textStyle,
    this.title,
    this.radius,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
  });
}
