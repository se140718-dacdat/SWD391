import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/constrain/controller.dart';

class GenderButton extends StatefulWidget {
  const GenderButton({super.key});
  @override
  State<GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  var isMale = false;
  var isFemale = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.white,
          )),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: InkWell(
              onTap: () {
                registerController.gender.value = "Female";
                setState(() {
                  isFemale = true;
                  isMale = false;
                });
                debugPrint(buildingController.listBuilDing.value.toString());
              },
              child: Container(
                color: isFemale == true ? Colors.red : Colors.white,
                child: Center(child: Text("Female")),
              ),
            ),
          ),
          Container(
              height: 80,
              child: VerticalDivider(
                color: Colors.black87,
                width: 5,
                thickness: 1.5,
              )),
          Flexible(
            flex: 1,
            child: InkWell(
              onTap: (() {
                registerController.gender.value = "Male";
                setState(() {
                  isMale = true;
                  isFemale = false;
                });
              }),
              child: Container(
                color: isMale == true ? Colors.red : Colors.white,
                child: Center(child: Text("Male")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
