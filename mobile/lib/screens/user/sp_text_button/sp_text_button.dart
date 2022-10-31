import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';

class SPTextButton extends StatelessWidget {
  const SPTextButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 60,
          ),
          width: MediaQuery.of(context).size.width,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: kHeading6,
            ),
          ),
        ),
      ),
    );
  }
}
