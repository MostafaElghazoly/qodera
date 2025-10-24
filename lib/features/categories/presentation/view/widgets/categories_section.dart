import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodera_task/common/constants/app_colors.dart';
import 'package:qodera_task/common/constants/text_themes.dart';
import 'package:qodera_task/common/widgets/app_loading.dart';
import 'package:qodera_task/features/categories/presentation/controller/categories_state.dart';
import '../../../../products/presentation/controller/products_bloc.dart';
import '../../../../products/presentation/controller/products_event.dart';
import '../../../data/models/category_model.dart';
import '../../controller/categories_bloc.dart';
import 'category_item.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return buildShimmerList();
        } else if (state is CategoriesError) {
          return Center(
            child: Text("Error: ${state.message}", style: TextThemes.style14700.copyWith(color: AppColors.black)),
          );
        } else if (state is CategoriesLoaded) {
          final categories = [CategoryModel(slug: '', name: 'All', url: ''), ...state.categories];
          return SizedBox(
            height: 40.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              itemCount: categories.length,
              separatorBuilder: (_, __) => SizedBox(width: 6.sp),
              itemBuilder: (context, index) {
                final category = categories[index];
                final productsBloc = context.read<ProductsBloc>();
                final selectedCategory = productsBloc.selectedCategory;
                final isSelected =
                    (selectedCategory == null && category.slug!.isEmpty) || (selectedCategory?.slug == category.slug);
                return GestureDetector(
                  onTap: () => productsBloc.add(SetSelectedCategory(category)),
                  child: CategoryItem(model: category, isSelected: isSelected),
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget buildShimmerList() => SizedBox(
    height: 40.h,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      itemCount: 8,
      separatorBuilder: (_, __) => SizedBox(width: 6.sp),
      itemBuilder: (_, __) => AppLoading.shimmer(height: 30.sp, width: 60.sp),
    ),
  );
}
