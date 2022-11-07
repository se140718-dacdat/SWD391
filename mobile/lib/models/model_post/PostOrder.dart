// To parse this JSON data, do
//
//     final postOrder = postOrderFromJson(jsonString);

import 'dart:convert';

PostOrder postOrderFromJson(String str) => PostOrder.fromJson(json.decode(str));

String postOrderToJson(PostOrder data) => json.encode(data.toJson());

class PostOrder {
  PostOrder({
    this.postId,
    this.accountId,
    this.total,
    this.walletId,
    this.description,
    this.transactionType,
  });

  String? postId;
  String? accountId;
  double? total;
  String? walletId;
  String? description;
  String? transactionType;

  factory PostOrder.fromJson(Map<String, dynamic> json) => PostOrder(
        postId: json["postId"],
        accountId: json["accountId"],
        total: json["total"],
        walletId: json["walletId"],
        description: json["description"],
        transactionType: json["transactionType"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "accountId": accountId,
        "total": total,
        "walletId": walletId,
        "description": description,
        "transactionType": transactionType,
      };
}
