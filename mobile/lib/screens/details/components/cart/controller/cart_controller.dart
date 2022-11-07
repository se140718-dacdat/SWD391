import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/models/Post.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/screens/details/components/cart/cart_model/cart_list_model.dart';

class CartController extends GetxController {
  var numOfItems = 1.obs;
  var totalQty = 0.obs;
  dynamic totalAmount = 0.obs;
  var cartItems = <CartItemListModel>[].obs;

  static CartController instance = Get.find();

  void removeItem(Post product) {
    if (numOfItems > 1) {
      numOfItems.value--;
    }
  }

  void addItem() {
    numOfItems.value++;
  }

  void addItemInCart(Post post) {
    if (totalQty.value < 0) {
      totalQty.value = 0;
    }
    final index = cartItems.indexWhere((element) => element.post == post);
    if (index > 0) {
      cartItems[index] = CartItemListModel(
          post: post, qty: (numOfItems.value + cartItems[index].qty));
    } else {
      cartItems.add(CartItemListModel(post: post, qty: numOfItems.value));
    }
    totalQty.value = totalQty.value + numOfItems.value;
    numOfItems.value = 1;
    totalAmount =
        (totalAmount + ((post.product!.price!.toInt()) * numOfItems.value));
  }

  void removeItemInCart(Post post) {
    final index = cartItems.indexWhere((element) => element.post == post);
    cartItems.remove(CartItemListModel(post: post, qty: numOfItems.value));
    totalQty.value = totalQty.value - numOfItems.value;
    totalAmount =
        (totalAmount - ((post.product!.price!.toInt()) * numOfItems.value));
    if (totalQty.value < 0) {
      totalQty.value = 0;
    }
    if (totalAmount.value < 0) {
      totalAmount.value = 0;
    }
  }

  void removeThisItemInCart(CartItemListModel currentItem) {
    cartItems.remove(currentItem);
    debugPrint(cartItems.value.toList().toString());

    // totalAmount = totalAmount - currentItem.product.price;
    totalAmount = (totalAmount -
        ((currentItem.post.product!.price!.toInt()) * numOfItems.value));
  }
}
