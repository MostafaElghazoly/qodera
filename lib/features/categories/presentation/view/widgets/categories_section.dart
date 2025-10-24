import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodera_task/common/constants/app_colors.dart';
import 'package:qodera_task/common/constants/text_themes.dart';
import 'package:qodera_task/features/categories/data/repo_impl/category_repo.dart';
import 'package:qodera_task/features/categories/presentation/controller/categories_event.dart';
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
  ValueNotifier<int> selectedCategoryNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoriesBloc(CategoryRepo())..add(FetchCategories()),
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CategoriesError) {
            return Center(
              child: Text("Error: ${state.message}", style: TextThemes.style14700.copyWith(color: AppColors.black)),
            );
          } else if (state is CategoriesLoaded) {
            final categories = [CategoryModel(slug: '', name: 'All', url: ''), ...state.categories];
            return ValueListenableBuilder(
              valueListenable: selectedCategoryNotifier,
              builder: (context, value, child) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => SizedBox(width: 6.sp),
                  itemBuilder: (context, index) {
                    final isSelected = value == index;
                    final category = categories[index];
                    return GestureDetector(
                      onTap: () {
                        context.read<ProductsBloc>().add(SetSelectedCategory(category));
                        selectedCategoryNotifier.value = index;
                      },
                      child: CategoryItem(model: categories[index], isSelected: isSelected),
                    );
                  },
                );
              },
            );
          }
          return Center(child: Text("No products yet", style: TextThemes.style14700.copyWith(color: AppColors.black)));
        },
      ),
    );
  }
}
