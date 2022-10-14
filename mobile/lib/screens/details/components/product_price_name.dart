import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/models/Product.dart';

class ProductPriceName extends StatelessWidget {
  const ProductPriceName({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Name Product",
                style: TextStyle(color: Colors.black87),
              ),
              Text(
                product.name,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: kDefaultPaddin,
        ),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(text: "Price\n"),
              TextSpan(
                text: "\$${product.price}",
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
