import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/screens/login/controller/login_controller.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/screens/user/profile_screen_without_login.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBGColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Text(
            'Profile',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      body: ProfileWithoutLogin(),
    );
  }
}
