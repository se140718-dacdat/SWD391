// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final productPost = productPostFromJson(jsonString);

import 'dart:convert';

ProductPost productPostFromJson(String str) =>
    ProductPost.fromJson(json.decode(str));

String productPostToJson(ProductPost data) => json.encode(data.toJson());

class ProductPost {
  ProductPost({
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.categoryId,
  });

  String? name;
  String? description;
  double? price;
  int? quantity;
  String? categoryId;

  factory ProductPost.fromJson(Map<String, dynamic> json) => ProductPost(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
        "quantity": quantity,
        "categoryId": categoryId,
      };
  @override
  String toString() {
    return 'ProductPost(name: $name, description: $description, price: $price, quantity: $quantity, categoryId: $categoryId)';
  }
}
