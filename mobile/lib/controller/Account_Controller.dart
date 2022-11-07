import 'dart:convert' show json;

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/models/Account.dart';
import 'package:mobile/models/Login.dart';
import 'package:mobile/models/Register.dart';
import 'package:mobile/models/model_get/GetAccount.dart';
import 'package:mobile/screens/register/resgister_screen.dart';
import 'package:mobile/service/network_handler/network_handler.dart';
import 'package:http/http.dart' as http;

class AccountController extends GetxController {
  static AccountController instance = Get.find();
  Rx<GetAccount> getAccount = GetAccount().obs;

  checkUserExist(String id, String token) async {
    try {
      var response = await NetworkHandler.get(
        'accounts/$id',
        token,
      );
      if (!response.isEmpty) {
        var data = json.decode(response);
        if (data['statusCode'] == 200) {
          getAccount.value = GetAccount.fromJson(data['data']);
        }
      }
      return null;
    } catch (e) {
      debugPrint("Error at account Controller checkUserExist $e");
    }
    return null;
  }
}
