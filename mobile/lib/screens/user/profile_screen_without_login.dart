import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/screens/home/home_screen.dart';
import 'package:mobile/screens/login/login_screen.dart';
import 'package:mobile/screens/post/post_list_by_account.dart';
import 'package:mobile/screens/user/footer_content.dart';
import 'package:mobile/screens/user/profile_item/profile_item.dart';
import 'package:mobile/screens/user/sp_solid_btn/sp_solid_btn.dart';
import 'package:mobile/service/utils/coming_soon.dart';

class ProfileWithoutLogin extends StatefulWidget {
  const ProfileWithoutLogin({super.key});

  @override
  State<ProfileWithoutLogin> createState() => _ProfileWithoutLoginState();
}

class _ProfileWithoutLoginState extends State<ProfileWithoutLogin> {
  double topContainerHeight = 190;
  String img = loginController.user.value.avatarUrl.toString();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: topContainerHeight,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: topContainerHeight * .58,
                        color: kWhiteColor,
                      ),
                      Container(
                        height: topContainerHeight * .42,
                        color: kDummyBGColor,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              height: 132,
                              width: 132,
                              child: Card(
                                child: Container(
                                  // color: Colors.grey.withOpacity(0.2),
                                  // child: Image.asset(
                                  //   "assets/images/profile.png",
                                  //   color: Colors.red,

                                  //   // opacity: ,
                                  // ),
                                  child: img == "null"
                                      ? const Icon(
                                          Icons.person,
                                          size: 100,
                                        )
                                      : Image.asset(
                                          img,
                                          width: 132,
                                          height: 132,
                                          alignment: Alignment.center,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Obx(() {
                              return loginController.isLogin.value
                                  ? Center(
                                      child: AutoSizeText(
                                        loginController.user.value.fullName
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 30, color: Colors.white),
                                        maxLines: 1,
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: SPSolidButton(
                                        text: "LOG IN/SIGN UP",
                                        minusWidth: 210,
                                        onPressed: () {
                                          Get.to(() => const LoginPage());
                                        },
                                      ),
                                    );
                            }),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: kWhiteColor,
              child: Column(
                children: [
                  ProfileItem(
                    title: "My Post",
                    assetName: "picture.png",
                    subTitle: "Check your post",
                    isLast: false,
                    onTap: () {
                      if (loginController.isLogin.value == false) {
                        Get.to(LoginPage());
                      } else {
                        Get.to(const PostByAccount());
                      }
                    },
                  ),
                  ProfileItem(
                    title: 'Orders',
                    assetName: 'orders.png',
                    subTitle: "Check your order status",
                    isLast: false,
                    onTap: () {
                      if (loginController.isLogin.value == false) {
                        Get.bottomSheet(const LoginPage());
                      } else {
                        Get.to(
                          () => const ComingSoon(),
                        );
                      }
                    },
                  ),
                  ProfileItem(
                    title: 'Help Center',
                    assetName: 'help-center.png',
                    subTitle: "Help regarding your recent purchase",
                    isLast: false,
                    onTap: () {
                      Get.to(
                        () => const ComingSoon(),
                      );
                    },
                  ),
                  ProfileItem(
                    title: 'Wishlist',
                    assetName: 'wishlist.png',
                    subTitle: "Your most loved style",
                    isLast: true,
                    onTap: () {
                      Get.to(
                        () => const ComingSoon(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: kWhiteColor,
              child: Column(
                children: [
                  ProfileItem(
                    title: 'Scan for coupon',
                    assetName: 'qr.png',
                    isLast: false,
                    onTap: () {
                      Get.to(
                        () => const ComingSoon(),
                      );
                    },
                  ),
                  ProfileItem(
                    title: 'Refer & Earn',
                    assetName: 'salary.png',
                    isLast: true,
                    onTap: () {
                      Get.to(
                        () => const ComingSoon(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const FooterContent(),
            Container(
              child: loginController.isLogin.value
                  ? SPSolidButton(
                      text: "Log Out",
                      minusWidth: 100,
                      onPressed: (() {
                        loginController.logout();
                        Get.offAll(const HomeScreen());
                        setState(() {
                          img = "null";
                        });
                      }),
                    )
                  : const SizedBox(
                      height: 18,
                    ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              "APP VERSION 0.0.1",
              style: Theme.of(context).textTheme.overline,
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
