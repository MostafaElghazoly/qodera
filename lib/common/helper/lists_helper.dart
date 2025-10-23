import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListsHelper {
  static void setupScrollListener({
    required ScrollController scrollController,
    required VoidCallback loadMoreData,
  }) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMoreData();
      }
    });
  }

  static bool isScrollingUp({
    required ScrollController scrollController,
  }) {
    return scrollController.position.userScrollDirection ==
        ScrollDirection.forward;
  }

  static void scrollToIndex(int index, ScrollController controller) {
    final double itemWidth = 100.w;
    final double position = itemWidth * index;
    controller.animateTo(
      position,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  static double getResponsiveAspectRatio(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200) {
      return 1;
    } else if (screenWidth >= 800) {
      return 0.85;
    } else {
      return 0.64;
    }
  }
}
