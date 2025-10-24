import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../categories/data/models/category_model.dart';
import '../../data/repo_impl/product_repo.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepo repository;
  CategoryModel? selectedCategory;

  ProductsBloc(this.repository) : super(ProductsInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductsLoading());
      try {
        final response = await repository.getProducts(categorySlug: event.categorySlug, searchText: event.searchText);

        if (response.products.isEmpty) {
          emit(ProductsError("No products found."));
        } else {
          emit(ProductsLoaded(products: response.products));
        }
      } catch (e) {
        emit(ProductsError("Failed to fetch products: ${e.toString()}"));
      }
    });

    on<SetSelectedCategory>((event, emit) async {
      selectedCategory = event.category;
      add(FetchProducts(categorySlug: selectedCategory?.slug));
    });
  }
}
