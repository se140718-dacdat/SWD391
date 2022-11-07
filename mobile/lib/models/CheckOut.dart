// To parse this JSON data, do
//
//     final checkOut = checkOutFromJson(jsonString);

import 'dart:convert';

CheckOut checkOutFromJson(String str) => CheckOut.fromJson(json.decode(str));

String checkOutToJson(CheckOut data) => json.encode(data.toJson());

class CheckOut {
  CheckOut({
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

  factory CheckOut.fromJson(Map<String, dynamic> json) => CheckOut(
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
}
