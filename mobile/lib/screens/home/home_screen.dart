import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/logo_page.dart';
import 'package:mobile/screens/home/components/body.dart';
import 'package:mobile/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:mobile/screens/post/post_screen.dart';
import 'package:mobile/screens/user/profile_screen.dart';
import 'package:mobile/screens/user/profile_screen_without_login.dart';
import 'package:mobile/service/network_handler/network_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  var isLogged = false;
  List<Widget> pages = [
    const Body(),
    const PostScreen(),
    const ProfileWithoutLogin(),
  ];
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  void checkLogin() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    isLogged = preferences.getBool("isLoggedin")!;
    debugPrint("isLogged:${isLogged}");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: buildAppBar(),
        body: pages[currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          selectedItemColor: Colors.purple,
          selectedIconTheme: IconThemeData(
            size: 30,
          ),
          onTap: (value) {
            this.setState(() {
              this.currentPage = value;
            });
          },
          iconSize: 24,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.control_point_outlined),
              label: "Post",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "User",
            ),
          ],
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
