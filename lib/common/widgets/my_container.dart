import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyContainer extends StatelessWidget {
  final double? height, width, horizontalPadding, verticalPadding;
  final Color? color;
  final Widget? child;
  const MyContainer(
      {super.key,
      this.height,
      this.width,
      this.color,
      this.horizontalPadding,
      this.child,
      this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 0.w,
          vertical: verticalPadding ?? 0.h),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: child,
    );
  }
}
