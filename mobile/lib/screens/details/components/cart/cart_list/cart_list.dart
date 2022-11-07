import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/screens/checkout/checkout.dart';
import 'package:mobile/screens/details/components/cart/cart_list/cast_list_background.dart';
import 'package:mobile/screens/details/components/cart/controller/cart_controller.dart';
import 'package:mobile/screens/home/home_screen.dart';
import 'package:mobile/screens/user/sp_solid_btn/sp_solid_btn.dart';

class CartList extends StatelessWidget {
  CartList({super.key});

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
                      const Text(
                        "Nothing in Cart",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => const HomeScreen());
                        },
                        child: const Text('Back to Home Page'),
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
                        padding: const EdgeInsets.all(8),
                        child: Obx(
                          () => ListView.builder(
                            itemCount: cartController.cartItems.length,
                            itemBuilder: (context, index) {
                              var currentItem = cartController.cartItems[index];
                              return Card(
                                // clipBehavior: Clip.none,
                                color: Colors.indigo[300],
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                        ),
                                        child: Image.network(
                                          currentItem.post.imageUrl.toString(),
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                            ),
                                            child: AutoSizeText(
                                              currentItem.post.product!.name
                                                  .toString(),
                                              maxLines: 2,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30,
                                              ),
                                            ),
                                          ),
                                          Text(
                                              "${NumberFormat('###,###,###').format(currentItem.post.price!)} VND"),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                cartController
                                                    .removeThisItemInCart(
                                                        currentItem);
                                                cartController.totalQty.value--;
                                              },
                                              child: const Text('Delete')),
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
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          left: 10,
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Obx(
                              () => AutoSizeText(
                                "Total amount: \$ ${cartController.totalAmount}",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red[900]),
                        ),
                        onPressed: () {
                          Get.to(() => const CheckOut());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 45,
                          child: const Center(
                              child: Text(
                            "Check Out",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
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
