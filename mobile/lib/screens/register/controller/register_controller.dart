import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/models/Register.dart';
import 'package:mobile/screens/home/home_screen.dart';
import 'package:mobile/screens/login/login_screen.dart';
import 'package:mobile/screens/register/resgister_screen.dart';
import 'package:mobile/service/network_handler/network_handler.dart';

class RegisterController extends GetxController {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  void register() async {
    try {
      Register registerModel = Register(
          userName: userName.text, password: password.text, phone: phone.text);
      var response =
          await NetworkHandler.post(registerToJson(registerModel), "accounts");
      var data = json.decode(response);
      debugPrint(data['message']);
      // NetworkHandler.storeToken(data['jwtToken']);
      if (data['message'] == 'Success') {
        Get.to(() => const LoginPage());
      }
    } catch (e) {
      e.printError();
    }
  }

  // void checkUserExist(String id) async {
  //   var response = await NetworkHandler.get('accounts/$id');
  //   var data = json.decode(response);
  //   debugPrint(data['msg']);
  // }
}
