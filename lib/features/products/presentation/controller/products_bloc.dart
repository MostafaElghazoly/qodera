import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo_impl/product_repo.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepo repository;

  ProductsBloc(this.repository) : super(ProductsInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductsLoading());
      try {
        final response = await repository.getProducts();
        emit(ProductsLoaded(response.products));
      } catch (e) {
        emit(ProductsError(e.toString()));
      }
    });
  }
}
