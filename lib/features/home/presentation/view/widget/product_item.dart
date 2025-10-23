import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodera_task/common/constants/app_colors.dart';
import 'package:qodera_task/common/constants/text_themes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.sp),
        border: Border.all(color: AppColors.grey),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 60.sp,
            width: 60.sp,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.sp)),
              child: Image.network("https://thumbs.dreamstime.com/b/set-care-beauty-products-skin-29817248.jpg",fit: BoxFit.fill,),
            ),
          ),
          SizedBox(width: 16.sp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("جزمة كالفن كلاين جينز", style: TextThemes.style16700),
                Text("1000", style: TextThemes.style16700),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
