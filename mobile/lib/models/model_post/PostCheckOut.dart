// To parse this JSON data, do
//
//     final checkOut = checkOutFromJson(jsonString);

import 'dart:convert';

PostCheckOut postCheckOutFromJson(String str) =>
    PostCheckOut.fromJson(json.decode(str));

String postCheckOutToJson(PostCheckOut data) => json.encode(data.toJson());

class PostCheckOut {
  PostCheckOut({
    this.accountId,
    this.walletId,
    this.description,
    this.transactionType,
    this.cartList,
  });

  String? accountId;
  String? walletId;
  String? description;
  String? transactionType;
  List<CartList>? cartList;

  factory PostCheckOut.fromJson(Map<String, dynamic> json) => PostCheckOut(
        accountId: json["accountId"],
        walletId: json["walletId"],
        description: json["description"],
        transactionType: json["transactionType"],
        cartList: List<CartList>.from(
            json["cartList"].map((x) => CartList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "accountId": accountId,
        "walletId": walletId,
        "description": description,
        "transactionType": transactionType,
        "cartList": List<dynamic>.from(cartList!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'PostCheckOut(accountId: $accountId, walletId: $walletId, description: $description, transactionType: $transactionType, cartList: $cartList)';
  }
}

class CartList {
  CartList({
    this.id,
    this.quantity,
  });

  String? id;
  int? quantity;

  factory CartList.fromJson(Map<String, dynamic> json) => CartList(
        id: json["id"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
      };
  @override
  String toString() {
    return '{id: $id, quantity: $quantity}';
  }
}
