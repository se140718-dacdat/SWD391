import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/controller/building_controller.dart';
import 'package:mobile/controller/category_controller.dart';
import 'package:mobile/controller/product_controller.dart';
import 'package:mobile/screens/home/home_screen.dart';
import 'package:mobile/screens/login/controller/login_controller.dart';
import 'package:mobile/screens/post/controller/post_controller.dart';
import 'package:mobile/screens/register/controller/register_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/details/components/cart/controller/cart_controller.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  Get.put(LoginController());
  Get.put(CategoryController());
  Get.put(RegisterController());
  Get.put(BuildingController());
  Get.put(PostController());
  Get.put(ProductController());
  var isLoggedIn = (preferences.getBool("isLoggedin") == null)
      ? false
      : preferences.getBool("isLoggedin");
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final isLoggedIn;
  MyApp({
    Key? key,
    required this.isLoggedIn,
  }) : super(key: key);
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "VinHomes App",
      theme: ThemeData(
        // Theme.of(context).textTheme.apply(bodyColor: kTextColor)
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontSize: 14.5,
            letterSpacing: 0.15,
            color: kTextColor,
          ),
          bodyText1: TextStyle(
            color: kTextColor,
            fontSize: 14,
          ),
          caption: TextStyle(
            fontSize: 11,
            color: kCaptionColor,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
