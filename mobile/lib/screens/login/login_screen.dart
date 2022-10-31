import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/screens/register/resgister_screen.dart';

import 'controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  var isLogin = loginController.isLogin.toString();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        // appBar: AppBar(
        //   leading: Container(
        //     child: InkWell(
        //       onTap: Get.back(),
        //       child: Icon(
        //         Icons.arrow_back,
        //         size: 24,
        //         color: Colors.black,

        //       ),
        //     ),
        //   ),
        // ),
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
                      vertical: 80.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Sign In",
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
                        _buildUserNameTF(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        _buildPasswordTF(),
                        _buildForgotPW(),
                        _buildRememberMeCB(),
                        _buildLoginBTN(),
                        _buildSignUpBTN(),
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

  Widget _buildSignUpBTN() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const RegisterScreen());
      },
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Color.fromRGBO(22, 43, 117, 1),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up ',
              style: TextStyle(
                color: Color.fromRGBO(22, 43, 117, 1),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRememberMeCB() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.white,
              activeColor: const Color.fromRGBO(22, 43, 117, 1),
              onChanged: ((value) {
                setState(() {
                  _rememberMe = value;
                });
              }),
            ),
          ),
          const Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBTN() {
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
        onPressed: () {
          debugPrint(loginController.msg.toString());

          if (_formKey.currentState!.validate()) {
            loginController.login();
          }
        },
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildUserNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Username",
          style: kLabelStyle,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextFormField(
            controller: loginController.userName,
            keyboardType: TextInputType.text,
            style: const TextStyle(
              color: Color.fromARGB(255, 30, 54, 141),
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.person,
                color: Color.fromARGB(255, 42, 73, 187),
              ),
              hintText: 'Enter your Username',
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 110, 137, 235),
                fontFamily: 'OpenSans',
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "User name is not null";
              }
              debugPrint(loginController.msg.toString());
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
        const Text(
          "Password",
          style: kLabelStyle,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextFormField(
            controller: loginController.password,
            obscureText: true,
            style: const TextStyle(
              color: Color.fromARGB(255, 30, 54, 141),
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
                color: Color.fromARGB(255, 110, 137, 235),
                fontFamily: 'OpenSans',
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                debugPrint(loginController.msg.toString());
                return "Please enter password!!!";
              }
              // if (loginController.msg.toString() ==
              //     "Username Or Password wrong!!") {
              //   return "Username Or Password wrong!!";
              // }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPW() {
    return Container(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () => print('Forgot your password'),
        child: const Text(
          'Fogot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }
}
