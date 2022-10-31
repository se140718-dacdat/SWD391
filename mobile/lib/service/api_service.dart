import 'package:get/get.dart';
import 'package:mobile/models/Account.dart';

class APIService extends GetConnect {
  void onInit() {
    httpClient.baseUrl = 'https://10.0.2.2:5001/api/authen/login';
  }
}
