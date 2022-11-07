import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/models/Post.dart';
import 'package:mobile/models/Product.dart';
import 'package:intl/intl.dart';

class ItemCard extends StatelessWidget {
  final Post post;
  final VoidCallback press;
  const ItemCard({
    Key? key,
    required this.post,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var fomatterNum = NumberFormat('###,###,###');
    return GestureDetector(
      onTap: press,
      child: Column(
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
                post.imageUrl.toString(),
                // cacheHeight: 140,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                      ),
                      child: AutoSizeText(
                        post.product!.name.toString(),
                        maxLines: 1,
                        style: const TextStyle(
                            color: kTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        // post.price.toString()
                        "${NumberFormat('###,###,###').format(post.price!)} VND",

                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(
              //         top: 5,
              //         bottom: 10,
              //       ),
              //       child: Text(
              //         post.building!.name.toString(),
              //         style: TextStyle(color: kTextColor, fontSize: 18),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
          Column(
            children: [
              Text(
                "Post at ${post.createAt!.hour.toString().padLeft(2, '0')}:${post.createAt!.minute.toString().padLeft(2, '0')}  ",
                style: TextStyle(
                  color: kTextLightColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
