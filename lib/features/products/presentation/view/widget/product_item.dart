import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodera_task/common/constants/app_colors.dart';
import 'package:qodera_task/common/constants/text_themes.dart';

import '../../../data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel model;
  const ProductItem({super.key, required this.model});

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
              child: Image.network(model.images?[0] ?? "", fit: BoxFit.fill),
            ),
          ),
          SizedBox(width: 16.sp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title ?? "", style: TextThemes.style16700),
                Text(
                  model.description ?? "",
                  style: TextThemes.style12500,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Wrap(
                  spacing: 8.sp,
                  runSpacing: 8.sp,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(model.price.toString(), style: TextThemes.style16700),
                    Text(model.getPriceBeforeDiscount(), style: TextThemes.style14700.copyWith(color: AppColors.grey,decoration: TextDecoration.lineThrough)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
