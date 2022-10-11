import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.greenAccent,
      elevation: 0,
      title: const Text(
        "VinHome2Hand",
        style: TextStyle(
          color: Colors.black87,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.home,
          color: Colors.black87,
          size: 30,
        ),
        onPressed: () {},
      ),
    );
  }
}
