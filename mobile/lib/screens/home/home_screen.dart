import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/logo_page.dart';
import 'package:mobile/screens/home/components/body.dart';
import 'package:mobile/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:mobile/screens/user/profile_screen.dart';
import 'package:mobile/screens/user/profile_screen_without_login.dart';
import 'package:mobile/service/network_handler/network_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  List<Widget> pages = [
    const Body(),
    const LogoPage(),
    const ProfileWithoutLogin(),
  ];
  @override
  void initState() {
    super.initState();
  }

  void checkLogin() async {
    String? token = await NetworkHandler.getToken();
    print("token: $token");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: buildAppBar(),
        body: pages[currentPage],
        bottomNavigationBar: NavigationBar(
          height: 50,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.control_point_outlined),
              label: "Post",
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "User",
            ),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          selectedIndex: currentPage,
        ),
      ),
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
