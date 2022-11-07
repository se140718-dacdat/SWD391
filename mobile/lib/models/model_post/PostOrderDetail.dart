// To parse this JSON data, do
//
//     final postOrderDetail = postOrderDetailFromJson(jsonString);

import 'dart:convert';

PostOrderDetail postOrderDetailFromJson(String str) =>
    PostOrderDetail.fromJson(json.decode(str));

String postOrderDetailToJson(PostOrderDetail data) =>
    json.encode(data.toJson());

class PostOrderDetail {
  PostOrderDetail({
    this.productId,
    this.orderId,
    this.quantity,
    this.price,
  });

  String? productId;
  String? orderId;
  int? quantity;
  int? price;

  factory PostOrderDetail.fromJson(Map<String, dynamic> json) =>
      PostOrderDetail(
        productId: json["productId"],
        orderId: json["orderId"],
        quantity: json["quantity"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "orderId": orderId,
        "quantity": quantity,
        "price": price,
      };
}
