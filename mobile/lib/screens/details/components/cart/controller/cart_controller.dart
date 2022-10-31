import 'package:get/get.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/screens/details/components/cart/cart_model/cart_list_model.dart';

class CartController extends GetxController {
  var numOfItems = 1.obs;
  var totalQty = 0.obs;
  dynamic totalAmount = 0.obs;
  var cartItems = <CartItemListModel>[].obs;
  void removeItem(Product product) {
    if (numOfItems > 1) {
      numOfItems.value--;
    }
  }

  void addItem() {
    numOfItems.value++;
  }

  void addItemInCart(Product product) {
    final index = cartItems.indexWhere((element) => element.product == product);
    if (index > 0) {
      cartItems[index] = CartItemListModel(
          product: product, qty: (numOfItems.value + cartItems[index].qty));
    } else {
      cartItems.add(CartItemListModel(product: product, qty: numOfItems.value));
    }
    totalQty.value = totalQty.value + numOfItems.value;
    numOfItems.value = 1;
    totalAmount = (totalAmount + ((product.price.toInt()) * numOfItems.value));
  }

  void removeItemInCart(Product product) {
    cartItems.remove(product);
    totalQty.value = totalQty.value - numOfItems.value;
  }

  void removeThisItemInCart(CartItemListModel currentItem) {
    cartItems.remove(currentItem);
    // totalAmount = totalAmount - currentItem.product.price;
    totalAmount = (totalAmount -
        ((currentItem.product.price.toInt()) * numOfItems.value));
  }
}
