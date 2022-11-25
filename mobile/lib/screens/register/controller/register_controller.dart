import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/models/Register.dart';
import 'package:mobile/models/model_get/GetAccount.dart';
import 'package:mobile/screens/home/home_screen.dart';
import 'package:mobile/screens/login/login_screen.dart';
import 'package:mobile/screens/register/resgister_screen.dart';
import 'package:mobile/service/network_handler/network_handler.dart';

class RegisterController extends GetxController {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController fullName = TextEditingController();
  RxString gender = "".obs;
  RxString buildingId = "".obs;

  static RegisterController instance = Get.find();
  void register() async {
    try {
      Register registerModel = Register(
        userName: userName.text,
        password: password.text,
        phone: phone.text,
        fullName: fullName.text,
        gender: gender.toString(),
        buildingId: registerController.buildingId.value.toString(),
      );
      var response = await NetworkHandler.post(
          registerToJson(registerModel), "accounts", "");
      var data = json.decode(response);
      if (data['message'] == 'Success') {
        Get.off(() => const LoginPage());
      }
    } catch (e) {
      e.printError();
    }
  }
}
