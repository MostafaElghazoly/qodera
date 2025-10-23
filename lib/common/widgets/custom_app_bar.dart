import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../constants/text_themes.dart';
import 'custom_back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool hasBackButton;
  final bool hasBottomBorder;
  final Widget? actions;
  final Widget? centeredWidget;

  const CustomAppBar({
    super.key,
    this.title,
    required this.hasBackButton,
    this.centeredWidget,
    this.hasBottomBorder = true,
    this.actions,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70.sp,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: hasBottomBorder ? AppColors.grey21 : AppColors.white, width: 1.w)),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Visibility(visible: hasBackButton, child: PositionedDirectional(start: 0.w, child: CustomBackButton())),
            centeredWidget ??
                Text(title ?? "", style: TextThemes.style20700.copyWith(color: AppColors.black.withOpacity(0.85))),
            Visibility(visible: actions != null, child: PositionedDirectional(end: 0.w, child: actions ?? SizedBox())),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.sp);
}
