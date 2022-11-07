import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/models/ProductPost.dart';
import 'package:mobile/service/network_handler/network_handler.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  var listProducts = <Product>[].obs;
  Rx<ProductPost> proPost = ProductPost().obs;

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
      print("Error at ProductController loadData");
    }
  }

  Future<void> createProduct() async {
    try {
      ProductPost pro = ProductPost(
          categoryId: postController.categoryId.value,
          description: postController.productDescription.text,
          name: postController.productName.text,
          price: double.tryParse(postController.price.text),
          quantity: postController.quantity);
      debugPrint("product: ${productPostToJson(pro)}");
      var response =
          await NetworkHandler.post(productPostToJson(pro), "products", "");
      var data = jsonDecode(response);
      if (data['message'] == 'Success') {
        proPost.value = ProductPost.fromJson(data['data']);
      }
    } catch (e) {
      print("Error at ProductController createProduct: $e");
    }
  }

  Future<ProductPost?> getProductById(String id) async {
    try {
      var response = await NetworkHandler.get("products/$id", "");
      var data = json.decode(response);
      if (data['message'] == 'Success') {
        proPost.value = ProductPost.fromJson(data['data']);
        return proPost.value;
      }
      return null;
    } catch (e) {
      print("Error at ProductController getProductById: $e");
    }
  }
}
