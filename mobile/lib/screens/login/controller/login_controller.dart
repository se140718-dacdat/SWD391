import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/models/Account.dart';
import 'package:mobile/models/Login.dart';
import 'package:mobile/screens/home/components/body.dart';
import 'package:mobile/screens/home/home_screen.dart';
import 'package:mobile/screens/login/login_screen.dart';
import 'package:mobile/screens/register/resgister_screen.dart';
import 'package:mobile/screens/user/profile_screen.dart';
import 'package:mobile/service/network_handler/network_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  static final client = http.Client();
  static LoginController instance = Get.find();
  Rx<Account> user = Account().obs;
  RxBool isLogin = false.obs;
  RxString msg = "".obs;
  RxString jwtToken = "".obs;
  RxBool rememberMe = false.obs;

  void login() async {
    Login loginModel = Login(userName: userName.text, password: password.text);
    debugPrint(loginToJson(loginModel));
    var response =
        await NetworkHandler.post(loginToJson(loginModel), "authen/login", "");
    var data = json.decode(response);
    msg.value = data['message'];

    if (data['message'] == 'Username Or Password wrong!!') {
      msg.value = data['message'];

      Get.to(() => const LoginPage());
    }
    if (data['message'] == 'Success') {
      msg.value = data['message'];
      user.value = Account.fromMap(data["data"]);
      jwtToken.value = user.value.jwtToken.toString();
      debugPrint(jwtToken.value);
      debugPrint("id: ${user.value.id}");
      msg.value = "";
      isLogin.value = true;
      Get.to(() => const HomeScreen());
    }
  }

  Future<void> logout() async {
    user.value.id = "";
    user.value.fullName = "";
    user.value.avatarUrl = "null";
    user.value.description = "";
    user.value.gender = "";
    user.value.phone = "";
    user.value.jwtToken = "";
    user.value.role = "";
    if (rememberMe.value != true) {
      userName.text = "";
      password.text = "";
    }

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isLoggedin", false);
    sharedPreferences.setString("userId", "");
    isLogin.value = false;
    Get.offAll(() => const HomeScreen());
  }
}
