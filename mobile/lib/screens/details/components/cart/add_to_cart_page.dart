import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/models/Post.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/screens/details/components/cart/cart_list/cart_list.dart';
import 'package:mobile/screens/login/login_screen.dart';

class AddToCartPage extends StatefulWidget {
  AddToCartPage({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  bool isChoose = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              if (loginController.isLogin.value == false) {
                Get.to(() => const LoginPage());
              } else {
                if (!isChoose) {
                  cartController.addItemInCart(widget.post);
                  setState(() {
                    isChoose = true;
                  });
                } else {
                  cartController.removeItemInCart(widget.post);
                  setState(() {
                    isChoose = false;
                  });
                }
              }
            },
            child: Container(
              margin: const EdgeInsets.only(right: kDefaultPaddin),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: kPrimeColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: kPrimeColor),
              ),
              child: Icon(
                Icons.favorite,
                size: 32,
                color: isChoose ? Colors.red : kWhiteColor,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => CartList());
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(kPrimeColor),
                ),
                child: Text(
                  'Buy Now'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
