import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../constants/text_themes.dart';
import '../models/api_response.dart';
import 'loader.dart';

class LoadingWidget extends StatelessWidget {
  final ApiResponse loadingState;
  final Widget? child;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final bool isEmpty;
  final void Function()? onRetry;

  const LoadingWidget({
    super.key,
    required this.loadingState,
    this.child,
    this.loadingWidget,
    this.emptyWidget,
    this.isEmpty = false,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (loadingState.loading == true) {
      return loadingWidget ?? const Loader();
    }

    if (loadingState.error == true) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(loadingState.message),
            SizedBox(height: 10.sp),
            GestureDetector(
              onTap: onRetry,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Try again"), SizedBox(width: 8.sp), Icon(Icons.refresh)],
              ),
            ),
          ],
        ),
      );
    }

    if (loadingState.success == true && isEmpty) {
      return emptyWidget ??
          Center(child: Text("No data found", style: TextThemes.style18400.copyWith(color: AppColors.black)));
    }

    return child ?? const SizedBox.shrink();
  }
}
