import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/screens/login/login_screen.dart';

class SPSolidButton extends StatelessWidget {
  const SPSolidButton(
      {Key? key, required this.text, this.onPressed, required this.minusWidth})
      : super(key: key);
  final String text;
  final Function()? onPressed;
  final num minusWidth;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(kButtonColor),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width - minusWidth,
        height: 45,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
