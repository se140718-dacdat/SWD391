// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

import 'package:mobile/models/Building.dart';
import 'package:mobile/models/Product.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.accountId,
    this.price,
    this.createAt,
    this.buildingId,
    this.lastUpdateAt,
    this.building,
    this.product,
  });

  String? id;
  String? title;
  String? description;
  String? imageUrl;
  String? accountId;
  int? price;
  DateTime? createAt;
  String? buildingId;
  dynamic lastUpdateAt;
  Building? building;
  Product? product;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        accountId: json["accountId"],
        price: json["price"],
        createAt: DateTime.parse(json["createAt"]),
        buildingId: json["buildingId"],
        lastUpdateAt: json["lastUpdateAt"],
        building: Building.fromJson(json["building"]),
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "imageUrl": imageUrl,
        "accountId": accountId,
        "price": price,
        "createAt": createAt!.toIso8601String(),
        "buildingId": buildingId,
        "lastUpdateAt": lastUpdateAt,
        "building": building!.toJson(),
        "product": product!.toJson(),
      };
}
