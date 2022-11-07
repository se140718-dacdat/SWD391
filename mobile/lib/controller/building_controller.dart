import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile/models/Building.dart';
import 'package:mobile/service/network_handler/network_handler.dart';

class BuildingController extends GetxController {
  var isLoading = true.obs;
  var listBuilDing = <Building>[].obs;
  Rx<Building> building = Building().obs;
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
            List.from(data['data']).map((e) => Building.fromJson(e)).toList();
      } else {
        Get.snackbar(
            "Error Loading data!", "Server responsed: ${data['statusCode']}");
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }

  Future<Building?> getBuildingById(String id) async {
    try {
      var response = await NetworkHandler.get("buildings/$id", "");
      var data = json.decode(response);
      if (data['message'] == 'Success') {
        building.value = Building.fromJson(data['data']);
        return building.value;
      }
      return null;
    } catch (e) {
      print("Error at Building Controller");
    }
  }
}
