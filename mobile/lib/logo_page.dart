import 'package:flutter/material.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 100, bottom: 100),
                  child: Image.asset(
                    "assets/images/logoVH.png",
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const Center(
            child: Text(
              "App Name",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
