import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/models/Building.dart';

class DropDownBuilding extends StatefulWidget {
  DropDownBuilding({super.key});

  @override
  State<DropDownBuilding> createState() => _DropDownBuildingState();
}

class _DropDownBuildingState extends State<DropDownBuilding> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: const [
              Icon(
                Icons.list,
                size: 16,
                color: Color.fromARGB(255, 42, 73, 187),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  'Select Building',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: buildingController.listBuilDing.value
              .map(
                (element) => DropdownMenuItem(
                  value: element.id,
                  child: Text("${element.name}"),
                  onTap: () {
                    registerController.buildingId.value = "${element.id}";
                    //
                  },
                ),
              )
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          itemHeight: 40,
        ),
      ),
    );
  }
}
