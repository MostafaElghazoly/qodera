import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodera_task/common/constants/text_field_styles.dart';
import 'package:qodera_task/common/constants/text_themes.dart';

import 'app_colors.dart';

ThemeData buildAppTheme(context) {
  return ThemeData(
    useMaterial3: false,
    fontFamily: "Lexend",
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      titleTextStyle: TextThemes.style14700.copyWith(color: AppColors.backGround),
      elevation: 0,
      iconTheme: IconThemeData(size: 28.w, color: AppColors.primary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      hintStyle: TextThemes.style14400.copyWith(color: AppColors.black.withOpacity(0.45)),
      border: TextFieldsStyles.disableOutlineInputBorder,
      enabledBorder: TextFieldsStyles.disableOutlineInputBorder,
      focusedBorder: TextFieldsStyles.enableOutlineInputBorder,
      errorBorder: TextFieldsStyles.errorRoundedInputBorder,
      focusedErrorBorder: TextFieldsStyles.disableOutlineInputBorder,
      errorStyle: TextThemes.style9500,
    ),
  );
}
