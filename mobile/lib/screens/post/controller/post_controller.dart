import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/models/Post.dart';
import 'package:mobile/models/model_get/GetAccount.dart';
import 'package:mobile/models/model_post/PostCreateModel.dart';
import 'package:mobile/models/ProductPost.dart';
import 'package:mobile/screens/home/components/body.dart';
import 'package:mobile/service/network_handler/network_handler.dart';

class PostController extends GetxController {
  static PostController instance = Get.find();
  TextEditingController productName = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController postDescription = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController imageUrl = TextEditingController();

  RxString accountId = "".obs;
  RxString categoryId = "".obs;
  RxString buildingId = "".obs;
  // RxString imageUrl = "".obs;
  int quantity = 1;
  var listPosts = <Post>[].obs;
  var listAllPosts = <Post>[].obs;
  var isLoading = false.obs;
  var cateId = "".obs;
  late GetAccount postAccount;

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
          imageUrl: imageUrl.text,
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
        if (data['message'] == 'Success') {
          print("Create Succesfull!");
        } else {
          print("Create Fail!");
        }
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
        listPosts.value = List.from(data["data"]["post"])
            .map((e) => Post.fromJson(e))
            .toList();
        listAllPosts.value = List.from(data["data"]["post"])
            .map((e) => Post.fromJson(e))
            .toList();
        isLoading.value = true;
      } else {
        isLoading.value = false;
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

  Future<List<Post>> fetchPostData() async {
    try {
      final response =
          await await NetworkHandler.get("posts?page=1&pageSize=100", "");
      var data = json.decode(response);
      debugPrint(data['data']['post'].toString());
      if (data["statusCode"] == 200) {
        List<Post> list = [];
        for (var x in data["data"]['post']) {
          list.add(Post.fromJson(x));
        }

        return list;
      }
    } catch (e) {
      print("Error at PostController fetchPostData() + $e");
    }
    return [];
  }

  Future<List<Post>> fetchPostByCategoryId(String id) async {
    try {
      var response = await NetworkHandler.get("posts/catecories?id=${id}", "");
      var data = json.decode(response);
      if (data['statusCode'] == 200) {
        List<Post> list = [];
        for (var x in data['data']) {
          list.add(Post.fromJson(x));
        }
        return list;
      }
    } catch (e) {
      print("Error at PostController fetchPostByCategoryId $e");
    }
    return [];
  }

  Future<List<Post>> fetchPostByAccId(String id, String token) async {
    try {
      var response = await NetworkHandler.get("posts/accounts?id=${id}", token);
      var data = json.decode(response);
      debugPrint("dataACCID: ${data}");
      if (data['statusCode'] == 200) {
        List<Post> list = [];
        for (var x in data['data']) {
          list.add(Post.fromJson(x));
        }
        return list;
      }
    } catch (e) {
      print("Error at PostController fetchPostByAccId $e");
    }
    return [];
  }
}
