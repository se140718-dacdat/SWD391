import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/screens/details/components/cart/cart_list/cast_list_background.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        leading: Container(
          child: InkWell(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              Get.back();
            },
          ),
        ),
      ),
      body: SafeArea(
        child: CartListBackGround(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(8),
                child: Text(
                  "List Item",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Obx(
                    () => ListView.builder(
                      // scrollDirection: Axis.vertical,
                      itemCount: cartController.cartItems.length,
                      itemBuilder: ((context, index) {
                        var currentItem = cartController.cartItems[index];
                        return Card(
                          color: Colors.indigo[300],
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
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
                                  child: currentItem.post.imageUrl!.isEmpty
                                      ? Image.asset(
                                          "assets/images/error.png",
                                          fit: BoxFit.fitHeight,
                                          width: 100,
                                          height: 100,
                                        )
                                      : Image.network(
                                          currentItem.post.imageUrl.toString(),
                                          fit: BoxFit.fitHeight,
                                          width: 100,
                                          height: 100,
                                        ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                      "${NumberFormat('###,###,###').format(currentItem.post.price!)} VND",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              _buildTFCustom("Description", "Input Description",
                  checkOutController.description),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Mode of payment: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "COD",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: () {
                    checkOutController.createCheckOut();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red[800]),
                  ),
                  child: Text("Payment"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTFCustom(
      String name, String hintText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   name,
        //   style: kLabelStyle,
        // ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextFormField(
            controller: controller,
            // textInputAction: loginController.userName,
            keyboardType: TextInputType.text,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14),
              prefixIcon: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 42, 73, 187),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return hintText;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
