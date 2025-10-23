import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodera_task/common/constants/text_themes.dart';
import '../../../../../common/constants/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12.sp),
        border: Border.all(color: AppColors.primary),
      ),
      child: Center(child: Text("Men", style: TextThemes.style14500.copyWith(color: AppColors.black))),
    );
  }
}
