import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodera_task/common/widgets/my_text_field.dart';
import 'features/products/data/repo_impl/product_repo.dart';
import 'features/products/presentation/controller/products_bloc.dart';
import 'features/products/presentation/controller/products_event.dart';
import 'features/products/presentation/controller/products_state.dart';
import 'features/categories/presentation/view/widgets/categories_section.dart';
import 'features/products/presentation/view/widget/product_item.dart';

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
        child: BlocProvider(
          create: (_) => ProductsBloc(ProductRepo())..add(FetchProducts()),
          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              return CustomScrollView(
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
                    sliver: Builder(
                      builder: (context) {
                        if (state is ProductsLoading) {
                          return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
                        } else if (state is ProductsError) {
                          return SliverToBoxAdapter(child: Center(child: Text("Error: ${state.message}")));
                        } else if (state is ProductsLoaded) {
                          final products = state.products;
                          return SliverList(
                            delegate: SliverChildBuilderDelegate((context, index) {
                              final product = products[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.h),
                                child: ProductItem(model: product),
                              );
                            }, childCount: products.length),
                          );
                        }
                        return const SliverToBoxAdapter(child: Center(child: Text("No products yet")));
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
