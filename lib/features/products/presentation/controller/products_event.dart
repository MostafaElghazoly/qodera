import 'package:equatable/equatable.dart';

import '../../../categories/data/models/category_model.dart';

abstract class ProductsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchProducts extends ProductsEvent {
  final String? categorySlug;
  final String? searchText;

  FetchProducts({this.categorySlug, this.searchText});

  @override
  List<Object?> get props => [categorySlug, searchText];
}

class SetSelectedCategory extends ProductsEvent {
  final CategoryModel category;
  SetSelectedCategory(this.category);

  @override
  List<Object?> get props => [category];
}
