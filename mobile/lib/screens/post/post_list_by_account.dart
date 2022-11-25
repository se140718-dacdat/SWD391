import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/screens/home/components/item_card.dart';

class PostByAccount extends StatelessWidget {
  const PostByAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
          child: Column(
        children: [
          Center(
            child: Text(
              "${accountController.myAccount.value.fullName}'s Post",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
            ),
            height: Get.size.height / 1.2,
            width: Get.size.width / 1.1,
            child: FutureBuilder(
              future: postController.fetchPostByAccId(
                  loginController.user.value.id.toString(),
                  loginController.jwtToken.value),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return Column(children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.indigo[300],
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Center(child: Text("${index + 1}")),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    child:
                                        snapshot.data![index].imageUrl!.isEmpty
                                            ? Image.asset(
                                                "assets/images/error.png",
                                                fit: BoxFit.fitHeight,
                                                width: 100,
                                                height: 100,
                                              )
                                            : Image.network(
                                                snapshot.data![index].imageUrl
                                                    .toString(),
                                                fit: BoxFit.fitHeight,
                                                width: 100,
                                                height: 100,
                                              ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8,
                                          bottom: 8,
                                        ),
                                        child: AutoSizeText(
                                          snapshot.data![index].product!.name
                                              .toString(),
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                          ),
                                        ),
                                      ),
                                      Text(
                                          "${NumberFormat('###,###,###').format(snapshot.data![index].price!)} VND"),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('Delete')),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ]);
                } else if (snapshot.hasError) {
                  return Container(
                    child: Text("Not found data"),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ),
          )
        ],
      )),
    );
  }
}
