import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodera_task/features/categories/data/repo_impl/category_repo.dart';
import 'package:qodera_task/features/categories/presentation/controller/categories_bloc.dart';
import 'package:qodera_task/features/categories/presentation/controller/categories_event.dart';
import 'package:qodera_task/features/products/data/repo_impl/product_repo.dart';
import 'package:qodera_task/features/products/presentation/controller/products_bloc.dart';
import 'package:qodera_task/features/products/presentation/controller/products_event.dart';

final List<BlocProvider<dynamic>> providers = [
  BlocProvider<ProductsBloc>(create: (_) => ProductsBloc(ProductRepo())..add(FetchProducts())),
  BlocProvider<CategoriesBloc>(create: (_) => CategoriesBloc(CategoryRepo())..add(FetchCategories())),
];
