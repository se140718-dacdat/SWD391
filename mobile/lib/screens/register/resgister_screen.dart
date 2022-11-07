import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/models/Account.dart';
import 'package:mobile/screens/user/dropdown_btn/dropdown_btn.dart';
import 'package:mobile/screens/user/gender_btn/gender_btn.dart';

import '../login/controller/login_controller.dart';
import 'controller/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool check = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back,
              size: 28,
            ),
            onTap: () {
              Get.back();
            },
          ),
          leadingWidth: 40,
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logoVH.png'),
                      opacity: 0.1,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 152, 243, 193),
                        Color.fromARGB(255, 132, 231, 177),
                        Color.fromARGB(255, 124, 236, 175),
                        Color.fromARGB(255, 138, 243, 185),
                      ],
                      stops: [0.1, 0.4, 0.7, 0.9],
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 30.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Register",
                          style: TextStyle(
                            color: Color.fromRGBO(22, 43, 117, 1),
                            fontFamily: 'OpenSans',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _buildTFCustom("User name", "Input User Name",
                            registerController.userName),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _buildPasswordTF(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _buildRe_PasswordTF(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _buildTFCustom("Full Name", "Input Full Name",
                            registerController.fullName),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const GenderButton(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        DropDownBuilding(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _buildPhoneTF(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _buildRegisterBTN(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTFCustom(
      String name, String hintText, TextEditingController controller) {
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
            keyboardType: TextInputType.text,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14),
              prefixIcon: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 42, 73, 187),
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

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // const Text(
        //   "Password",
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
            controller: registerController.password,
            obscureText: true,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color.fromARGB(255, 42, 73, 187),
              ),
              hintText: 'Enter Password',
              hintStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRe_PasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // const Text(
        //   "Re-Password",
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
            controller: registerController.rePassword,
            obscureText: true,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color.fromARGB(255, 42, 73, 187),
              ),
              hintText: 'Enter Re-Password',
              hintStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              // errorText: validationPwd(),
            ),
            validator: (String? value) {
              var pwd = registerController.password.text;
              if (value == null) {
                return 'Is not null';
              }
              if (value != pwd) {
                return 'Is not match!!';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // const Text(
        //   "Phone",
        //   style: kLabelStyle,
        // ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            controller: registerController.phone,
            keyboardType: TextInputType.phone,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.phone,
                color: Color.fromARGB(255, 42, 73, 187),
              ),
              hintText: 'Enter your Phone Number',
              hintStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterBTN() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        )),
        child: const Text(
          'REGISTER',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // debugPrint(registerController.buildingId.value.toString());
            registerController.register();
          }
        },
      ),
    );
  }

  String? validationPwd() {
    String pwd = registerController.password.text;
    String rePwd = registerController.rePassword.text;
    if (rePwd.isEmpty) {
      return 'Not Empty';
    } else if (rePwd != pwd) {
      return "Not Match";
    } else if (rePwd == pwd) {
      return "";
    }
    return null;
  }
}
