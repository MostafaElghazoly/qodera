import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

class PasswordVisibilityWidget extends StatelessWidget {
  final bool isVisible;
  final Function(bool visible) onVisibilityChanged;

  const PasswordVisibilityWidget({
    super.key,
    required this.isVisible,
    required this.onVisibilityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onVisibilityChanged(!isVisible);
      },
      child: Icon(
        isVisible ? Icons.visibility_off : Icons.visibility,
        color: AppColors.black,
        size: 18.sp,
      ),
    );
  }
}
