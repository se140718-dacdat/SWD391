import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/screens/details/components/product_price_name.dart';
import 'package:mobile/screens/details/components/product_title_with_image.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                ProductTitleWithImage(product: product),
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
                        ProductPriceName(product: product),
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
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://scontent.fsgn15-1.fna.fbcdn.net/v/t39.30808-6/289519586_3195193710724605_4600458332758181816_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=NkA8nBL3DkgAX8Fyvij&tn=-BWEPSkXPHbPHFuQ&_nc_ht=scontent.fsgn15-1.fna&oh=00_AT9u4GPj7RBLjd8dVKI5ru18qDVnp23aHJdslbEMLxuREA&oe=634C6A82"),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                  "Phạm Thành Long",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("Đăng lúc 12:09 ngày 13/09/2000"),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPaddin),
                          child: Text(
                            product.description,
                            style: const TextStyle(height: 1.5),
                          ),
                        ),
                        Row(
                          children: const <Widget>[
                            Expanded(
                              child: Text(
                                "Thông tin liên hệ: ",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: kDefaultPaddin / 2),
                              child: Text(
                                "0918805311",
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
          )
        ],
      ),
    );
  }
}
