import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile/models/Building.dart';
import 'package:mobile/service/network_handler/network_handler.dart';

class BuildingController extends GetxController {
  var isLoading = true.obs;
  var listBuilDing = <Building>[].obs;

  static BuildingController instance = Get.find();

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    try {
      var response = await NetworkHandler.get("buildings", "");
      var data = jsonDecode(response);
      if (data['statusCode'].toString() == "200") {
        listBuilDing.value =
            List.from(data['data']).map((e) => Building.fromMap(e)).toList();
      } else {
        Get.snackbar(
            "Error Loading data!", "Server responsed: ${data['statusCode']}");
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }
}
