import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/models/Post.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/screens/details/components/cart/add_to_cart_page.dart';
import 'package:mobile/screens/details/components/product_price_name.dart';
import 'package:mobile/screens/details/components/product_title_with_image.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.post});
  final Post post;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isMine = false;
  @override
  void initState() {
    isMine = widget.post.accountId == accountController.myAccount.value.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Obx(() {
            accountController.checkUserExist(widget.post.accountId.toString(),
                loginController.jwtToken.value);
            return SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  ProductTitleWithImage(post: widget.post),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.37),
                    padding: EdgeInsets.only(
                      top: size.height * 0.03,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin,
                    ),
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ProductPriceName(post: widget.post),
                          AddToCartPage(post: widget.post),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 10,
                                  top: 5,
                                ),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: isMine
                                        ? DecorationImage(
                                            image: accountController.myAccount
                                                        .value.avatarUrl
                                                        .toString() !=
                                                    "null"
                                                ? NetworkImage(accountController
                                                    .myAccount.value.avatarUrl
                                                    .toString())
                                                : const AssetImage(
                                                    "assets/images/profile.png",
                                                  ) as ImageProvider)
                                        : DecorationImage(
                                            image: accountController.accountPost
                                                        .value.avatarUrl
                                                        .toString() !=
                                                    "null"
                                                ? NetworkImage(accountController
                                                    .accountPost.value.avatarUrl
                                                    .toString())
                                                : const AssetImage(
                                                    "assets/images/profile.png",
                                                  ) as ImageProvider),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Obx(() {
                                    if (isMine) {
                                      return Text(
                                        accountController
                                            .myAccount.value.fullName
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      );
                                    } else {
                                      return Text(
                                        accountController
                                            .accountPost.value.fullName
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      );
                                    }
                                  }),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                        "Post at ${widget.post.createAt!.hour.toString().padLeft(2, '0')}:${widget.post.createAt!.minute.toString().padLeft(2, '0')}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPaddin),
                            child: Text(
                              widget.post.description.toString(),
                              style: const TextStyle(height: 1.5),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Contact: ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: kDefaultPaddin / 2),
                                child: isMine
                                    ? Text(
                                        accountController.myAccount.value.phone
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: Colors.redAccent),
                                      )
                                    : Text(
                                        accountController
                                            .accountPost.value.phone
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: Colors.redAccent),
                                      ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPaddin / 2),
                            child: TextFormField(
                              initialValue: "Your comment....",
                              decoration: const InputDecoration(
                                labelText: 'Comment',
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.send),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
