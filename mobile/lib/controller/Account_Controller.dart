import 'dart:convert' show json;

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/models/Account.dart';
import 'package:mobile/models/Login.dart';
import 'package:mobile/models/Register.dart';
import 'package:mobile/screens/register/resgister_screen.dart';
import 'package:mobile/service/network_handler/network_handler.dart';
import 'package:http/http.dart' as http;

class AccountController extends GetxController {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  static final client = http.Client();
  static AccountController instance = Get.find();

  void login() async {
    Login loginModel = Login(userName: userName.text, password: password.text);
    var response =
        await NetworkHandler.post(loginToJson(loginModel), "authen/login");
    var data = json.decode(response);
    debugPrint(data['msg']);
    if (data['msg'] == null) {
      Get.to(() => const RegisterScreen());
    }
  }

  // void checkUserExist(String id) async {
  //   var response = await NetworkHandler.get('accounts/$id');
  //   var data = json.decode(response);
  //   debugPrint(data['msg']);
  // }

  void register() async {
    // Account accountModel =
    //     Account(userName: userName.text, password: password.text);
    // var response =
    //     await NetworkHandler.post(accountToJson(accountModel), "accounts");
    // var data = json.decode(response);
    // debugPrint(data['message']);
    // if (data['message'] == null) {
    //   Get.to(() => const RegisterScreen());
    // }
  }
  // int getID(String id) async {
  //   var response = await NetworkHandler.
  // }
}
