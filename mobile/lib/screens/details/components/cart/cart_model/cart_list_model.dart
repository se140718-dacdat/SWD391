import 'dart:convert';

import 'package:mobile/models/Post.dart';
import 'package:mobile/models/Product.dart';

class CartItemListModel {
  late final Post post;
  late final int qty;

  CartItemListModel({
    required this.post,
    required this.qty,
  });
  CartItemListModel copyWith({
    Post? post,
    int? qty,
  }) {
    return CartItemListModel(
      post: post ?? this.post,
      qty: qty ?? this.qty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'post': post.toJson(),
      'qty': qty,
    };
  }

  factory CartItemListModel.fromMap(Map<String, dynamic> map) {
    return CartItemListModel(
      post: Post.fromJson(map['post']),
      qty: map['qty']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemListModel.fromJson(String source) =>
      CartItemListModel.fromMap(json.decode(source));

  @override
  String toString() => 'CartItemListModel(post: $post, qty: $qty)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItemListModel && other.post == post && other.qty == qty;
  }

  @override
  int get hashCode => post.hashCode ^ qty.hashCode;
}
