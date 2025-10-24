import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class TextFieldsStyles {
  static OutlineInputBorder disableOutlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.grey0, width: 1.w),
    borderRadius: BorderRadius.circular(12.r),
  );
  static OutlineInputBorder disableRoundedInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.grey0, width: 1.w),
    borderRadius: BorderRadius.circular(12.r),
  );
  static OutlineInputBorder enableOutlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.grey0, width: 1.w),
    borderRadius: BorderRadius.circular(12.r),
  );
  static OutlineInputBorder enableRoundedInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.grey0, width: 1.w),
    borderRadius: BorderRadius.circular(12.r),
  );
  static OutlineInputBorder errorRoundedInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.redOne, width: 1.w),
    borderRadius: BorderRadius.circular(12.r),
  );

  static OutlineInputBorder veryRoundedInputBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(12.r),
  );
}
