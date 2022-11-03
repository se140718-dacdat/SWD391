import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/models/Category.dart';
import 'package:mobile/service/network_handler/network_handler.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
  var listCates = <Category>[].obs;

  static CategoryController instance = Get.find();
  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    try {
      var response = await NetworkHandler.get("categories", "");
      var data = jsonDecode(response);
      if (data['statusCode'].toString() == "200") {
        listCates.value =
            List.from(data['data']).map((e) => Category.fromMap(e)).toList();
      } else {
        Get.snackbar(
            "Error Loading data!", "Server responsed: ${data['statusCode']}");
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }
}
