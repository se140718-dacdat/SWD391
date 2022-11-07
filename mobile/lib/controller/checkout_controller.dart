import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/models/model_post/PostCheckOut.dart';
import 'package:mobile/screens/home/home_screen.dart';
import 'package:mobile/service/network_handler/network_handler.dart';

class CheckOutController extends GetxController {
  TextEditingController description = TextEditingController();
  var cartList = <CartList>[].obs;
  static CheckOutController instance = Get.find();
  var isCheckOut = false.obs;
  Future<void> createCheckOut() async {
    try {
      debugPrint(cartController.cartItems.value.length.toString());
      // List jsonList = [];
      // cartController.cartItems.value.map((e) => jsonList.add(cartList))
      for (var i = 0; i < cartController.cartItems.value.length; i++) {
        CartList cart = CartList(
          id: cartController.cartItems.value[i].post.id,
          quantity: cartController.cartItems.value[i].qty,
        );
        cartList.add(cart);
      }
      debugPrint(json.encode(cartList.toJson()));
      PostCheckOut cout = PostCheckOut(
        accountId: accountController.getAccount.value.id,
        transactionType: "COD",
        walletId: accountController.getAccount.value.wallet!.id,
        description: description.text.toString(),
        cartList: cartList.toJson(),
      );
      debugPrint(cout.toString());
      var response = await NetworkHandler.post(postCheckOutToJson(cout),
          "checkouts", loginController.jwtToken.toString());
      debugPrint("response: ${postCheckOutToJson(cout)}");
      var data = json.decode(response);
      debugPrint(data.toString());
      if (data['message'] == 'Success') {
        print("Success");
        isCheckOut.value = true;
        Get.to(() => const HomeScreen());
      }
    } catch (e) {}
  }
}
