import 'dart:convert';

import 'package:mobile/models/Product.dart';

class CartItemListModel {
  late final Product product;
  late final int qty;

  CartItemListModel({
    required this.product,
    required this.qty,
  });
  CartItemListModel copyWith({
    Product? product,
    int? qty,
  }) {
    return CartItemListModel(
      product: product ?? this.product,
      qty: qty ?? this.qty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'qty': qty,
    };
  }

  factory CartItemListModel.fromMap(Map<String, dynamic> map) {
    return CartItemListModel(
      product: Product.fromMap(map['product']),
      qty: map['qty']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemListModel.fromJson(String source) =>
      CartItemListModel.fromMap(json.decode(source));

  @override
  String toString() => 'CartItemListModel(product: $product, qty: $qty)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItemListModel &&
        other.product == product &&
        other.qty == qty;
  }

  @override
  int get hashCode => product.hashCode ^ qty.hashCode;
}
