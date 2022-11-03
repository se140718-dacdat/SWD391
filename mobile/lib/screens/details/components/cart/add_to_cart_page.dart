import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/screens/details/components/cart/cart_list/cart_list.dart';
import 'package:mobile/screens/details/components/cart/controller/cart_controller.dart';

class AddToCartPage extends StatefulWidget {
  AddToCartPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  CartController cartController = Get.find();

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
              if (!isChoose) {
                cartController.addItemInCart(widget.product);
                setState(() {
                  isChoose = true;
                });
              } else {
                cartController.removeItemInCart(widget.product);
                setState(() {
                  isChoose = false;
                });
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
