import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/models/Category.dart';
import 'package:mobile/service/network_handler/network_handler.dart';

class CategoryController extends GetxController {
  var isLoading = false.obs;
  var listCates = <Categori>[].obs;

  static CategoryController instance = Get.find();
  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  setIsLoading(var isLoading) {
    if (listCates.value.isEmpty) {
      isLoading = false;
    } else {
      isLoading = true;
    }
  }

  Future<void> loadData() async {
    try {
      var response = await NetworkHandler.get("categories", "");
      var data = jsonDecode(response);
      if (data['statusCode'].toString() == "200") {
        listCates.value =
            List.from(data['data']).map((e) => Categori.fromMap(e)).toList();
        isLoading.value = true;
      } else {
        Get.snackbar(
            "Error Loading data!", "Server responsed: ${data['statusCode']}");
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }

  Future<List<Categori>?> fetchCategory() async {
    final response = await NetworkHandler.get("categories", "");
    var data = json.decode(response);
    if (data["statusCode"] == 200) {
      List<Categori> list = [];
      for (var x in data["data"]) {
        list.add(Categori.fromMap(x));
      }
      return list;
    } else {
      throw Exception("Errror load fail");
    }
  }
}
