import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodera_task/common/constants/text_themes.dart';
import 'package:qodera_task/features/categories/data/models/category_model.dart';
import '../../../../../common/constants/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel model;
  final bool isSelected;
  const CategoryItem({super.key, required this.model, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary.withOpacity(0.5) : Colors.grey[200],
        borderRadius: BorderRadius.circular(12.sp),
        border: Border.all(color: isSelected ? AppColors.primary : Colors.grey),
      ),
      child: Center(child: Text(model.name ?? "", style: TextThemes.style14500.copyWith(color: AppColors.black))),
    );
  }
}
