import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final double price;
  final double discountPercentage;
  final List<String>? images;

  ProductModel({this.id, this.title, this.description, this.price = 0, this.discountPercentage = 0, this.images});

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  getPriceBeforeDiscount() => (price + discountPercentage).toString();
}
