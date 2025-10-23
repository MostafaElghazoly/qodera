import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodera_task/common/widgets/my_text_field.dart';
import 'package:qodera_task/features/home/presentation/view/widget/product_item.dart';
import '../widget/categories_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              toolbarHeight: 80.sp,
              flexibleSpace: FlexibleSpaceBar(
                title: MyTextField(),
                centerTitle: true,
                titlePadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
              ),
            ),
            SliverAppBar(
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: CategoriesSection(),
                centerTitle: true,
                titlePadding: EdgeInsets.symmetric(vertical: 10.h),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: 4.h),
                    child: ProductItem(),
                  );
                }, childCount: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
