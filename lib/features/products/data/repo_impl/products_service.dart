import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/product_response.dart';

part 'products_service.g.dart';

@RestApi(baseUrl: "https://dummyjson.com")
abstract class ProductsService {
  factory ProductsService(Dio dio, {String baseUrl}) = _ProductsService;

  @GET("/products")
  Future<ProductsResponse> getProducts();
}
