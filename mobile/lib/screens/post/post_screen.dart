import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/screens/home/home_screen.dart';
import 'package:mobile/screens/login/login_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String? selectedValueCate;
  String? selectedValueBuild;
  File? _image;
  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;

    return Obx(
      () {
        // debugPrint(loginController.isLogin.value.toString());
        if (loginController.isLogin.value == false) {
          return AlertDialog(
            title: const Text("Login?"),
            content: const Text("You must login first to use this fearture!!!"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Get.to(() => const LoginPage());
                },
                child: const Text("OK"),
              ),
            ],
          );
        } else {
          return SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logoVH.png'),
                        opacity: 0.1,
                      ),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 40.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Create New Post",
                            style: TextStyle(
                              color: Color.fromRGBO(22, 43, 117, 1),
                              fontFamily: 'OpenSans',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          _buildTFCustom(
                              "Title",
                              "Please input post title",
                              postController.title,
                              Icons.info_outline,
                              TextInputType.text),
                          const SizedBox(
                            height: 15.0,
                          ),
                          _buildTFCustom(
                              "Post Description",
                              "Please input post description",
                              postController.postDescription,
                              Icons.info_outline,
                              TextInputType.text),
                          const SizedBox(
                            height: 15.0,
                          ),
                          _buildDropDownCate(sizeScreen),
                          const SizedBox(
                            height: 15.0,
                          ),
                          _buildTFCustom(
                              "Product Name",
                              "Please Input Product Name",
                              postController.productName,
                              Icons.info_outline,
                              TextInputType.text),
                          const SizedBox(
                            height: 15.0,
                          ),
                          _buildTFCustom(
                              "Product Description",
                              "Please input product description",
                              postController.productDescription,
                              Icons.info_outline,
                              TextInputType.text),
                          const SizedBox(
                            height: 15.0,
                          ),
                          _buildDropDownBuilding(sizeScreen),
                          const SizedBox(
                            height: 15.0,
                          ),
                          _buildTFCustom(
                              "Price",
                              "Please input product price",
                              postController.price,
                              Icons.attach_money_outlined,
                              TextInputType.number),
                          const SizedBox(
                            height: 15.0,
                          ),
                          // imagePicked(),
                          _buildTFCustom(
                              "Input url Image",
                              "Get URL Image",
                              postController.imageUrl,
                              Icons.image_outlined,
                              TextInputType.text),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                postController.accountId.value =
                                    loginController.user.value.id.toString();
                                postController.createPost();
                                Get.to(() => const HomeScreen());
                              },
                              child: Text("Post"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  _buildDropDownCate(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: AutoSizeText(
                "Select Category:",
                style: kLabelStyle,
                maxLines: 1,
              ),
            ),
            Expanded(
              flex: 2,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  buttonWidth: size.width * 0.7,
                  buttonPadding: const EdgeInsets.symmetric(horizontal: 30),
                  hint: Row(
                    children: const [
                      Icon(
                        Icons.list,
                        size: 20,
                        color: Color.fromARGB(255, 42, 73, 187),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          'Select Category',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  items: categoryController.listCates.value
                      .map(
                        (element) => DropdownMenuItem(
                          value: element.id,
                          child: Text(
                            "${element.name}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            postController.categoryId.value = "${element.id}";
                            debugPrint(
                                "post CAte: ${postController.categoryId.value.toString()}");
                          },
                        ),
                      )
                      .toList(),
                  value: selectedValueCate,
                  onChanged: (value) {
                    setState(() {
                      selectedValueCate = value as String;
                    });
                  },
                  itemHeight: 50,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildDropDownBuilding(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: AutoSizeText(
                "Select Building:",
                style: kLabelStyle,
                maxLines: 1,
              ),
            ),
            Expanded(
              flex: 2,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  buttonWidth: size.width * 0.7,
                  buttonPadding: const EdgeInsets.symmetric(horizontal: 30),
                  hint: Row(
                    children: const [
                      Icon(
                        Icons.list,
                        size: 20,
                        color: Color.fromARGB(255, 42, 73, 187),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          'Select Building',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  items: buildingController.listBuilDing.value
                      .map(
                        (element) => DropdownMenuItem(
                          value: element.id,
                          child: Text(
                            "${element.name}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            postController.buildingId.value = "${element.id}";
                            debugPrint(
                                "post BUi: ${postController.buildingId.value.toString()}");
                          },
                        ),
                      )
                      .toList(),
                  value: selectedValueBuild,
                  onChanged: (value) {
                    setState(() {
                      selectedValueBuild = value as String;
                    });
                  },
                  itemHeight: 50,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTFCustom(String name, String hintText,
      TextEditingController controller, IconData icon, TextInputType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   name,
        //   style: kLabelStyle,
        // ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextFormField(
            controller: controller,
            // textInputAction: loginController.userName,
            keyboardType: type,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                icon,
                color: const Color.fromARGB(255, 42, 73, 187),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return hintText;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  // Widget imagePicked() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       Container(
  //         child: TextButton.icon(
  //           onPressed: () {
  //             _pickImage(ImageSource.camera);
  //           },
  //           label: Text(
  //             "Choose Image",
  //             style: TextStyle(
  //               fontSize: 18,
  //             ),
  //           ),
  //           icon: Icon(
  //             Icons.camera_alt_outlined,
  //           ),
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 10.0,
  //       ),
  //       Center(
  //         child: _image == null
  //             ? Text("No image selected!")
  //             : Image(
  //                 image: FileImage(_image!),
  //                 // height: MediaQuery.of(context).size.height * 0.5,
  //                 width: MediaQuery.of(context).size.width * 0.5,
  //               )
  //         // CircleAvatar(
  //         //     backgroundImage: FileImage(_image!),
  //         //   )
  //         ,
  //       )
  //     ],
  //   );
  // }

  // Future _pickImage(ImageSource source) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return null;
  //     File? img = File(image.path);
  //     setState(() {
  //       _image = img;
  //     });
  //     postController.imageUrl.value = _image!.path.toString();
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }
  // }
}
