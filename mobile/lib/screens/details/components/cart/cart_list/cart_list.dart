import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/screens/details/components/cart/cart_list/cast_list_background.dart';
import 'package:mobile/screens/details/components/cart/controller/cart_controller.dart';
import 'package:mobile/screens/home/home_screen.dart';

class CartList extends StatelessWidget {
  CartList({super.key});
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: CartListBackGround(
        child: Obx(
          () => cartController.cartItems.length == 0
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Nothing in Cart",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => HomeScreen());
                        },
                        child: Text('Back to Home Page'),
                      )
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Obx(
                          () => ListView.builder(
                            itemCount: cartController.cartItems.length,
                            itemBuilder: (context, index) {
                              var currentItem = cartController.cartItems[index];
                              return Card(
                                clipBehavior: Clip.none,
                                color: Colors.indigo[300],
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        (index + 1).toString(),
                                        style: const TextStyle(
                                          color: kWhiteColor,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                        ),
                                        child: Image.asset(
                                          currentItem.product.img,
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 20,
                                            ),
                                            child: Text(
                                              currentItem.product.name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ),
                                          Text(currentItem.product.price
                                              .toString()),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                cartController
                                                    .removeThisItemInCart(
                                                        currentItem);
                                                print("Delete Btn");
                                              },
                                              child: const Text('Delete')),
                                          // ElevatedButton(
                                          //   onPressed: () {},
                                          //   child: const Text('Update'),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 5,
                      ),
                      child: Container(
                        // color: Colors.red[400],
                        padding: EdgeInsets.only(
                          bottom: 5,
                          left: 10,
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Obx(
                              () => AutoSizeText(
                                "Total amount: \$ ${cartController.totalAmount.toString()}",
                                style: TextStyle(
                                  color: Colors.red[400],
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                maxFontSize: 30,
                                minFontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      // backgroundColor: Colors.transparent,
      title: const Text(
        "Item List",
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
