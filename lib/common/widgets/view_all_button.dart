import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../constants/lang_keys.dart';
import '../constants/text_themes.dart';

class ViewAllButton extends StatelessWidget {
  final void Function()? onTap;
  const ViewAllButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            LangKeys.seeMore,
            textAlign: TextAlign.center,
            style: TextThemes.style12400.copyWith(color: AppColors.primary),
          ),
          SizedBox(width: 4.sp),
          Icon(Icons.arrow_forward, color: AppColors.primary, size: 15.sp),
        ],
      ),
    );
  }
}
