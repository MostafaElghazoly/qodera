import 'package:json_annotation/json_annotation.dart';
import 'product_model.dart';
part 'product_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  final List<ProductModel> products;
  ProductsResponse({required this.products});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) => _$ProductsResponseFromJson(json);
}
