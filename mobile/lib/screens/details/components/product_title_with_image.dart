import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/models/Post.dart';
import 'package:mobile/models/Product.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Image.network(
                  post.imageUrl.toString(),
                  fit: BoxFit.fitHeight,
                  width: size.width / 5,
                  height: size.height / 2.9,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
