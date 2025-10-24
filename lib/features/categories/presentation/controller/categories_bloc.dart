import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo_impl/category_repo.dart';
import 'categories_event.dart';
import 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoryRepo repository;

  CategoriesBloc(this.repository) : super(CategoriesInitial()) {
    on<FetchCategories>((event, emit) async {
      emit(CategoriesLoading());
      try {
        final response = await repository.getCategories();
        emit(CategoriesLoaded(response));
      } catch (e) {
        emit(CategoriesError(e.toString()));
      }
    });
  }
}
