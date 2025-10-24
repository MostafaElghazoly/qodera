import 'package:dio/dio.dart';
import '../models/category_model.dart';
import '../repo_impl/categories_service.dart';

class CategoryRepo {
  late final CategoriesService _service;

  CategoryRepo() {
    final dio = Dio();
    _service = CategoriesService(dio);
  }

  Future<List<CategoryModel>> getCategories() async {
    return await _service.getCategories();
  }
}
