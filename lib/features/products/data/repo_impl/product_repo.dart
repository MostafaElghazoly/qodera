import 'package:dio/dio.dart';
import '../models/product_response.dart';
import 'products_service.dart';

class ProductRepo {
  late final ProductsService _service;

  ProductRepo() {
    final dio = Dio();
    _service = ProductsService(dio);
  }

  Future<ProductsResponse> getProducts({String? categorySlug, String? searchText}) async {
    String endpoint = "/products";

    if (searchText != null && searchText.isNotEmpty) {
      endpoint = "/products/search";
    } else if (categorySlug != null && categorySlug.isNotEmpty) {
      endpoint = "/products/category/$categorySlug";
    }

    return await _service.getProducts(endpoint, searchText);
  }
}
