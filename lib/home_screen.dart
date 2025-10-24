import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodera_task/common/widgets/my_text_field.dart';
import 'package:qodera_task/features/products/presentation/view/widget/products_section.dart';
import 'features/products/presentation/controller/products_bloc.dart';
import 'features/products/presentation/controller/products_event.dart';
import 'features/products/presentation/controller/products_state.dart';
import 'features/categories/presentation/view/widgets/categories_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  Timer? _debounce;

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
                    title: MyTextField(
                      controller: _searchCtrl,
                      hintText: "Search here",
                      suffix:
                          (_searchCtrl.text.isNotEmpty)
                              ? GestureDetector(
                                onTap: () {
                                  setState(() => _searchCtrl.text = '');
                                  final bloc = context.read<ProductsBloc>();
                                  final selectedSlug = bloc.selectedCategory?.slug;
                                  if (selectedSlug != null && selectedSlug.isNotEmpty) {
                                    bloc.add(FetchProducts(categorySlug: selectedSlug));
                                  } else {
                                    bloc.add(FetchProducts());
                                  }
                                },
                                child: Icon(Icons.close),
                              )
                              : null,
                      onChanged: (value) {
                        _searchCtrl.text = value;
                        _debounce?.cancel();
                        _debounce = Timer(const Duration(milliseconds: 1500), () {
                          context.read<ProductsBloc>().add(FetchProducts(searchText: value));
                        });
                      },
                    ),
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
                ProductsSection(),
              ],
            );
          },
        ),
      ),
    );
  }
}
