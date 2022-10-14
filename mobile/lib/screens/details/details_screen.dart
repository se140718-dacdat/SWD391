import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 226, 158),
      appBar: buildAppBar(context),
      body: Body(
        product: product,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 160, 230, 160),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 30,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          iconSize: 30,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_outlined),
          iconSize: 30,
        ),
        const SizedBox(
          width: kDefaultPaddin / 2,
        )
      ],
    );
  }
}
