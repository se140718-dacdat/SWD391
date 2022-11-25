import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/constrain/controller.dart';
import 'package:mobile/models/Post.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/screens/details/details_screen.dart';
import 'package:mobile/screens/home/components/categories.dart';
import 'package:mobile/screens/home/components/item_card.dart';
import 'package:mobile/screens/post/controller/post_controller.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 8,
              right: 8,
              bottom: 8,
            ),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: CustomSearch(),
                          );
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 218, 231, 218),
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Search something...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.search),
                          // suffixIcon: const Icon(Icons.add_circle_sharp),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPaddin / 2),
                  child: Text(
                    "Explore Categories",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const Categories(),
          // postController.listPosts.isEmpty
          //     ? Column(
          //         children: [
          //           Center(
          //             child: Text(
          //               "Nothing to Show!!!",
          //               style: TextStyle(
          //                 fontSize: 40,
          //               ),
          //             ),
          //           ),
          //           SizedBox(
          //             height: 20,
          //           ),
          //           Text("List Suggestion"),
          //           SizedBox(
          //             height: 20,
          //           ),
          //         ],
          //       )
          //     :
          ShowListPost(),
        ],
      ),
    );
  }

  Widget ShowListPost() {
    return Expanded(
      child: Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Container(
              child: FutureBuilder(
                future: postController.cateId.value == ""
                    ? postController.fetchPostData()
                    : postController
                        .fetchPostByCategoryId(postController.cateId.value),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      itemCount: snapshot.data!.length,
                      // products.length
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        mainAxisSpacing: kDefaultPaddin,
                        crossAxisSpacing: kDefaultPaddin,
                      ),
                      itemBuilder: (context, index) => ItemCard(
                        post: snapshot.data![index],
                        press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(post: snapshot.data![index]),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      child: Text("Not found data"),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  var listPosts = postController.listAllPosts.value;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var listMatchQuery = <Post>[].obs;
    for (var item in listPosts) {
      if (item.product!.name!.toLowerCase().contains(query.toLowerCase())) {
        listMatchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: listMatchQuery.length,
      itemBuilder: (context, index) {
        var result = listMatchQuery[index];
        return ListTile(
          title: Text(result.product!.name.toString()),
          onTap: () {
            print("A");
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var listMatchQuery = <Post>[].obs;
    for (var item in listPosts) {
      if (item.product!.name!.toLowerCase().contains(query.toLowerCase())) {
        listMatchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: listMatchQuery.length,
      itemBuilder: (context, index) {
        var result = listMatchQuery[index];
        return ListTile(
          title: Text(result.product!.name.toString()),
          onTap: () {
            Get.to(
              () =>
                  DetailsScreen(post: postController.listAllPosts.value[index]),
            );
          },
        );
      },
    );
  }
}
