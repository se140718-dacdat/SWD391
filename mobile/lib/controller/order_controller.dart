import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/models/model_get/GetAccount.dart';
import 'package:mobile/models/model_post/PostOrder.dart';
import 'package:mobile/service/network_handler/network_handler.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();

  // Future<void> createOrder(String postId, String accountId, double total,
  //     String description, String transactionType) async {
  //   try {
  //     accountController.checkUserExist(accountId);
  //     PostOrder order = PostOrder(
  //       accountId: accountId,
  //       description: description,
  //       postId: postId,
  //       total: total,
  //       transactionType: transactionType,
  //       walletId: accountController.getAccount.value.wallet!.id.toString(),
  //     );
  //     var response =
  //         await NetworkHandler.post(postOrderToJson(order), "orders");
  //     var data = jsonDecode(response);
  //     debugPrint("${data.toString()}");
  //   } catch (e) {}
  // }
}
