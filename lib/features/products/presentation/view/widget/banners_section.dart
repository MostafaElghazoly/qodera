import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/stepper_widget.dart';

class BannersSection extends StatelessWidget {
  BannersSection({super.key});
  final PageController _pageController = PageController();
  final ValueNotifier<int> bannersNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    List<String> banners = [
      "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp",
      "https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/1.webp",
      "https://cdn.dummyjson.com/product-images/beauty/powder-canister/1.webp",
      "https://cdn.dummyjson.com/product-images/beauty/red-lipstick/1.webp",
      "https://cdn.dummyjson.com/product-images/beauty/red-nail-polish/1.webp",
    ];
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: SizedBox(
            height: 180.h,
            child: ValueListenableBuilder(
              valueListenable: bannersNotifier,
              builder: (context, value, child) {
                return Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: banners.length,
                        onPageChanged: (value) => bannersNotifier.value = value,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.sp)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.sp),
                                child: Image.network(banners[index]),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    StepperWidget(items: banners, selectedIndex: value),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
