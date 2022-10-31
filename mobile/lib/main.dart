import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/controller/Account_Controller.dart';
import 'package:mobile/screens/home/home_screen.dart';
import 'package:mobile/screens/login/controller/login_controller.dart';

import 'screens/details/components/cart/controller/cart_controller.dart';

Future<void> main(List<String> args) async {
  HttpOverrides.global = MyHttpOverrides();
  Get.put(LoginController());
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
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
