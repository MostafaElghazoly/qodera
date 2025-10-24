import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodera_task/features/products/presentation/view/widget/product_item.dart';
import '../../../../../common/widgets/app_loading.dart';
import '../../controller/products_bloc.dart';
import '../../controller/products_state.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          sliver: Builder(
            builder: (context) {
              if (state is ProductsLoading) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: AppLoading.shimmer(height: 100.sp, width: double.infinity),
                    );
                  }, childCount: 10),
                );
              } else if (state is ProductsError) {
                return SliverToBoxAdapter(child: Center(child: Text("Error: ${state.message}")));
              } else if (state is ProductsLoaded) {
                final products = state.products;
                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final product = products[index];
                    return Padding(padding: EdgeInsets.symmetric(vertical: 4.h), child: ProductItem(model: product));
                  }, childCount: products.length),
                );
              }
              return const SliverToBoxAdapter(child: Center(child: Text("No products yet")));
            },
          ),
        );
      },
    );
  }
}
