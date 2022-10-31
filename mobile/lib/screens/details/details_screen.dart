import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/screens/details/components/body.dart';
import 'package:mobile/screens/details/components/cart/cart_list/cart_list.dart';
import 'package:mobile/screens/details/components/cart/controller/cart_controller.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.product});
  final Product product;
  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 226, 158),
      appBar: buildAppBar(context),
      body: Body(
        product: product,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.add_shopping_cart_outlined),
      //     ),
      //     // BottomNavigationBarItem()
      //   ],
      // ),
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
        const SizedBox(
          width: kDefaultPaddin / 3,
        ),
        Badge(
          badgeContent: Obx(
            () => Text(
              cartController.totalQty.value.toString(),
            ),
          ),
          position: BadgePosition.topEnd(),
          showBadge: true,
          child: IconButton(
            onPressed: () {
              Get.to(() => CartList());
            },
            icon: const Icon(
              Icons.favorite,
            ),
            iconSize: 30,
          ),
        ),
        const SizedBox(
          width: kDefaultPaddin / 3,
        ),
      ],
    );
  }
}
