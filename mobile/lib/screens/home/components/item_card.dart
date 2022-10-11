import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/models/Product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  // final Function press;
  const ItemCard({
    Key? key,
    required this.product,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            // height: 150,
            // width: 150,
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(
              product.img,
              // cacheHeight: 140,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            product.name,
            style: TextStyle(color: kTextLightColor),
          ),
        ),
        Text(
          // product.price.toString()
          "\$${product.price}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
