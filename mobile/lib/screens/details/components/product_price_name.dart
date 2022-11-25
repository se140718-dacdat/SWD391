import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/models/Post.dart';
import 'package:mobile/models/Product.dart';

class ProductPriceName extends StatelessWidget {
  const ProductPriceName({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
        ),
        Container(
          child: AutoSizeText(
            textAlign: TextAlign.start,
            post.product!.name.toString(),
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.black87, fontWeight: FontWeight.bold),
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
                text: "${NumberFormat('###,###,###').format(post.price!)} VND",
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
