import 'package:flutter/cupertino.dart';

class ItemDataModel {
  String? title;
  String? percentage;
  String? subTitle;
  String? iconPath;
  VoidCallback? onTap;
  double? width;
  double? height;
  Widget? widget;
  Color? color;
  Color? textColor;
  Color? iconColor;
  bool? hasSubTitle;
  TextStyle? textStyle;
  bool enabled;
  bool isDataLoading;
  ItemDataModel(
      {this.title,
      this.percentage,
      this.subTitle,
      this.iconPath,
      this.onTap,
      this.widget,
      this.textColor,
      this.iconColor,
      this.width,
      this.enabled = true,
      this.isDataLoading = false,
      this.hasSubTitle,
      this.height,
      this.color,
      this.textStyle});
}
