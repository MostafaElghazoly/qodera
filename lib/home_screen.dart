import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodera_task/features/products/presentation/view/widget/banners_section.dart';
import 'package:qodera_task/features/products/presentation/view/widget/products_section.dart';
import 'package:qodera_task/features/products/presentation/view/widget/search_section.dart';
import 'features/products/presentation/controller/products_bloc.dart';
import 'features/products/presentation/controller/products_state.dart';
import 'features/categories/presentation/view/widgets/categories_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  toolbarHeight: 80.sp,
                  flexibleSpace: FlexibleSpaceBar(
                    title: SearchSection(),
                    centerTitle: true,
                    titlePadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                  ),
                ),
                BannersSection(),
                SliverAppBar(
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: CategoriesSection(),
                    centerTitle: true,
                    titlePadding: EdgeInsets.symmetric(vertical: 10.h),
                  ),
                ),
                ProductsSection(),
              ],
            );
          },
        ),
      ),
    );
  }
}
