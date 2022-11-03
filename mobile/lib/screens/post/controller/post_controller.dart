import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  static PostController instance = Get.find();
  TextEditingController productName = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController postDescription = TextEditingController();
  TextEditingController title = TextEditingController();

  RxString accountId = "".obs;
  RxString categoryId = "".obs;
  RxString buildingId = "".obs;
}
