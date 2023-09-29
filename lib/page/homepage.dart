import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_json_local_practice/page/details.dart';
import 'package:http/http.dart' as http;

import '../model/comentModel.dart';
import '../widgets/shopingcart_mathod.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Productmodel> post = [];
  Future<void> fetchPosts() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        post = data.map((post) => Productmodel.fromJson(post)).toList();
      });
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("E-Commerec with API")),
        body: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: _searchBox(),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Product"),
                TextButton(onPressed: () {}, child: const Text("See All"))
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: post.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                id: post[index].id,
                                title: post[index].title,
                                price: post[index].price,
                                description: post[index].description,
                                image: post[index].image,
                                rating: post[index].rating,
                                category: post[index].category)));
                  },
                  child: Card(
                    child: Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        child: Column(
                          children: [
                            Expanded(
                              child:
                                  Image.network(post[index].image.toString()),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                            post[index].title.toString(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.purple),
                                          )),
                                    ),
                                    Container(
                                      child: Text(
                                        post[index].category.toString(),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            child:
                                                Text('\$${post[index].price}'),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                ShoppingCart.addProduct(
                                                    product: Productmodel(
                                                        id: post[index].id,
                                                        title:
                                                            post[index].title,
                                                        price:
                                                            post[index].price,
                                                        description: post[index]
                                                            .description,
                                                        image:
                                                            post[index].image,
                                                        rating:
                                                            post[index].rating,
                                                        category: post[index]
                                                            .category,
                                                        quantity: post[index]
                                                            .quantity));
                                              },
                                              child: Text(
                                                  "Add To Cart".toUpperCase()))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              },
            ),
          ),
        ]));
  }

  _searchBox() {
    return const TextField(
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          hintText: "Search"),
    );
  }
}
