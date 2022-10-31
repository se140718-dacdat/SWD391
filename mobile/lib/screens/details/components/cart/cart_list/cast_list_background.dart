import 'package:flutter/material.dart';

class CartListBackGround extends StatelessWidget {
  const CartListBackGround({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logoVH.png'),
              opacity: 0.1,
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 152, 243, 193),
                Color.fromARGB(255, 132, 231, 177),
                Color.fromARGB(255, 124, 236, 175),
                Color.fromARGB(255, 138, 243, 185),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
        ),
        child,
      ]),
    );
  }
}
