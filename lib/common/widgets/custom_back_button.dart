import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../helper/navigation/navigation.dart';

class CustomBackButton extends StatefulWidget {
  final void Function()? onTap;
  const CustomBackButton({super.key, this.onTap});
  @override
  State<CustomBackButton> createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap ?? Navigation().goBack(),
      child:
          Icon(Icons.arrow_back_ios_new, color: AppColors.black, size: 20.sp),
    );
  }
}
