import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/widgets/stepper_widget.dart';

class BannersSection extends StatefulWidget {
  const BannersSection({super.key});

  @override
  State<BannersSection> createState() => _BannersSectionState();
}

class _BannersSectionState extends State<BannersSection> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> bannersNotifier = ValueNotifier<int>(0);
  Timer? _autoScrollTimer;

  final List<String> banners = [
    "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp",
    "https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/1.webp",
    "https://cdn.dummyjson.com/product-images/beauty/powder-canister/1.webp",
    "https://cdn.dummyjson.com/product-images/beauty/red-lipstick/1.webp",
    "https://cdn.dummyjson.com/product-images/beauty/red-nail-polish/1.webp",
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!mounted) return;
      final nextPage = (_pageController.page?.round() ?? 0) + 1;
      if (nextPage < banners.length) {
        _pageController.animateToPage(nextPage, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    bannersNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: SizedBox(
            height: 180.h,
            child: ValueListenableBuilder<int>(
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
