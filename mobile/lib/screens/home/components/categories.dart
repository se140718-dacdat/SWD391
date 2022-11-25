import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/controller/category_controller.dart';
import 'package:mobile/models/Category.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 3),
      child: SizedBox(
        height: 25,
        child: FutureBuilder(
          future: categoryController.fetchCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => buildCategory(index),
              );
            } else if (snapshot.hasError) {
              return Container(
                child: Text("Not Found Data"),
              );
            } else {
              return Container(
                child: Center(
                    // child: CircularProgressIndicator(),
                    ),
              );
            }
          },
        ),
      ),
    );
    // );
  }

  Widget buildCategory(int index) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          postController.cateId.value =
              categoryController.listCates.value[index].id.toString();
          postController.fetchPostByCategoryId(
              categoryController.listCates.value[index].id.toString());
          setState(() {
            selectedIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryController.listCates.value[index].name.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? kTextColor : kTextLightColor,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: kDefaultPaddin / 4),
                height: 2,
                width: 50,
                color:
                    selectedIndex == index ? Colors.black : Colors.transparent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
