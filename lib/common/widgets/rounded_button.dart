import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../constants/text_themes.dart';
import '../models/button_model.dart';
import 'loader.dart';

class RoundedButton extends StatelessWidget {
  final ButtonModel model;
  const RoundedButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: model.enabled ? model.onPressed : null,
      child: Container(
        height: model.height ?? 52.h,
        width: model.width ?? 300.sp,
        decoration: BoxDecoration(
          color: _getButtonColor(),
          border: model.enabled ? Border.all(color: model.borderColor ?? AppColors.primary) : null,
          borderRadius: BorderRadius.circular(model.radius ?? 10.sp),
        ),
        child: Center(
          child:
              model.isLoading
                  ? const Loader(color: AppColors.white)
                  : Text(
                    model.title ?? "",
                    style:
                        model.textStyle ??
                        TextThemes.style16700.copyWith(color: model.textColor ?? AppColors.backGround2),
                  ),
        ),
      ),
    );
  }

  _getButtonColor() {
    if (model.enabled == false) {
      return AppColors.disabled;
    }
    return model.color ?? AppColors.primary;
  }
}
