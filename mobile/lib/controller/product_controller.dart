import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/service/network_handler/network_handler.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  var listProducts = <Product>[].obs;
  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    try {
      var response = await NetworkHandler.get("products", "");
      var data = jsonDecode(response);
      if (data['statusCode'] == 200) {
        listProducts.value =
            List.from(data['data']).map((e) => Product.fromMap(e)).toList();
      } else {
        Get.snackbar(
            "Error Loading data!", "Server responsed: ${data['statusCode']}");
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }
}
