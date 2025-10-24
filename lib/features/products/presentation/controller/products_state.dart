import 'package:equatable/equatable.dart';
import '../../data/models/product_model.dart';
import '../../../categories/data/models/category_model.dart';

abstract class ProductsState extends Equatable {
  final CategoryModel? selectedCategory;

  const ProductsState({this.selectedCategory});

  @override
  List<Object?> get props => [selectedCategory ?? ''];
}

class ProductsInitial extends ProductsState {
  const ProductsInitial({super.selectedCategory});
}

class ProductsLoading extends ProductsState {
  const ProductsLoading({super.selectedCategory});
}

class ProductsLoaded extends ProductsState {
  final List<ProductModel> products;
  const ProductsLoaded({required this.products, super.selectedCategory});

  @override
  List<Object?> get props => [products, selectedCategory ?? ''];
}

class ProductsError extends ProductsState {
  final String message;
  const ProductsError(this.message, {super.selectedCategory});

  @override
  List<Object?> get props => [message, selectedCategory ?? ''];
}
