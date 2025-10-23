import 'package:dio/dio.dart';
import 'package:qodera_task/features/products/data/repo_impl/products_service.dart';
import '../models/product_response.dart';

class ProductRepo {
  late final ProductsService _service;

  ProductRepo() {
    final dio = Dio();
    _service = ProductsService(dio);
  }

  Future<ProductsResponse> getProducts() async {
    return await _service.getProducts();
  }
}
