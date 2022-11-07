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
          ),
        ),
        child,
      ]),
    );
  }
}
