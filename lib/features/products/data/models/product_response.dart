import 'package:json_annotation/json_annotation.dart';
import 'product_model.dart';
part 'product_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  final List<ProductModel> products;
  final int total;
  final int skip;
  final int limit;

  ProductsResponse({required this.products, required this.total, required this.skip, required this.limit});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) => _$ProductsResponseFromJson(json);
}
