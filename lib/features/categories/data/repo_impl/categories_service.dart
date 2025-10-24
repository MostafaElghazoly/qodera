import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../models/category_model.dart';

part 'categories_service.g.dart';

@RestApi(baseUrl: "https://dummyjson.com")
abstract class CategoriesService {
  factory CategoriesService(Dio dio, {String baseUrl}) = _CategoriesService;

  @GET("/products/categories")
  Future<List<CategoryModel>> getCategories();
}
