// To parse this JSON data, do
//
//     final postCreateModel = postCreateModelFromJson(jsonString);

import 'dart:convert';

PostCreateModel postCreateModelFromJson(String str) =>
    PostCreateModel.fromJson(json.decode(str));

String postCreateModelToJson(PostCreateModel data) =>
    json.encode(data.toJson());

class PostCreateModel {
  PostCreateModel({
    this.title,
    this.postDescription,
    this.imageUrl,
    this.accountId,
    this.price,
    this.buildingId,
    this.productName,
    this.productDescription,
    this.quantity,
    this.categoryId,
  });

  String? title;
  String? postDescription;
  String? imageUrl;
  String? accountId;
  int? price;
  String? buildingId;
  String? productName;
  String? productDescription;
  int? quantity;
  String? categoryId;

  factory PostCreateModel.fromJson(Map<String, dynamic> json) =>
      PostCreateModel(
        title: json["title"],
        postDescription: json["postDescription"],
        imageUrl: json["imageUrl"],
        accountId: json["accountId"],
        price: json["price"],
        buildingId: json["buildingId"],
        productName: json["productName"],
        productDescription: json["productDescription"],
        quantity: json["quantity"],
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "postDescription": postDescription,
        "imageUrl": imageUrl,
        "accountId": accountId,
        "price": price,
        "buildingId": buildingId,
        "productName": productName,
        "productDescription": productDescription,
        "quantity": quantity,
        "categoryId": categoryId,
      };
}
