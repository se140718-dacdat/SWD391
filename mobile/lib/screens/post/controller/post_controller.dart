import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/models/Post.dart';
import 'package:mobile/models/model_post/PostCreateModel.dart';
import 'package:mobile/models/ProductPost.dart';
import 'package:mobile/service/network_handler/network_handler.dart';

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
  RxString imageUrl = "".obs;
  int quantity = 1;
  var listPosts = <Post>[].obs;

  @override
  onInit() {
    super.onInit();
    loadData();
  }

  Future<void> createPost() async {
    try {
      ProductPost proPost = ProductPost(
        categoryId: categoryId.value,
        description: productDescription.text,
        name: productName.value.text,
        price: double.tryParse(price.value.text),
        quantity: int.parse(quantity.toString()),
      );
      await productController.createProduct();
      var building = await buildingController.getBuildingById(buildingId.value);
      if (productController.proPost.value != null && building != null) {
        PostCreateModel post = PostCreateModel(
          accountId: accountId.value,
          buildingId: buildingId.value,
          imageUrl: imageUrl.value.toString(),
          price: int.parse(price.text.toString()),
          title: title.text.toString(),
          categoryId: categoryId.value,
          postDescription: postDescription.text.toString(),
          productDescription: productDescription.text.toString(),
          productName: productName.text.toString(),
          quantity: quantity,
        );
        debugPrint("Post: ${postCreateModelToJson(post)}");
        var response = await NetworkHandler.postWithToken(
            postCreateModelToJson(post),
            "posts",
            loginController.jwtToken.value.toString());
        var data = json.decode(response);
        debugPrint('data: ${data}');
        if (response == "") {
          print("Wrong");
        } else {
          var data = json.decode(response);
        }
        // if (data['message'] == 'Success') {
        //   print("Create Succesfull!");
        // } else {
        //   print("Create Fail!");
        // }
      }
    } catch (e) {
      print("Error at PostController createPost: $e");
    }
  }

  Future<void> loadData() async {
    try {
      var response = await NetworkHandler.get("posts", "");
      var data = jsonDecode(response);
      if (data['statusCode'] == 200) {
        listPosts.value =
            List.from(data['data']).map((e) => Post.fromJson(e)).toList();
      } else {
        Get.snackbar(
            "Error Loading data!", "Server responsed: ${data['statusCode']}");
      }
    } catch (e) {
      print("Error at PostController loadData: ${e.toString()}");
    }
  }

  Future<void> getPostByCateID(String id) async {
    try {
      var response = await NetworkHandler.get("posts/catecories?id=${id}", "");
      var data = json.decode(response);
      if (data['statusCode'] == 200) {
        listPosts.value =
            List.from(data['data']).map((e) => Post.fromJson(e)).toList();
      }
    } catch (e) {
      print("Error at PostController getPostByCateID $e");
    }
  }
}
