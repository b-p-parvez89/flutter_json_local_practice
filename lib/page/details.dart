// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../model/comentModel.dart';
import '../widgets/shopingcart_mathod.dart';

class DetailsPage extends StatefulWidget {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  DetailsPage(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.rating,
      required this.category});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int isSelected = -1;

  List<String> size = ['S', 'M', 'L', 'XL', 'XXL'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(widget.category.toString()),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(child: Image.network(widget.image.toString())),
            const SizedBox(
              height: 10,
            ),
            Text(widget.title.toString().toUpperCase(),
                style: _textstyle(
                    size: 16, color: Colors.purple, weight: FontWeight.bold)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              child: SingleChildScrollView(
                child: Text(widget.description.toString(),
                    style: _textstyle(
                        size: 12,
                        color: Colors.black,
                        weight: FontWeight.normal)),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(widget.category.toString(),
                style: _textstyle(
                    size: 12, color: Colors.black, weight: FontWeight.normal)),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("\$ ${widget.price}"),
                  ),
                ),
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Rating: ${widget.rating!.rate}/5.00"),
                      Text("${widget.rating!.count}"),
                    ],
                  ),
                ))
              ],
            ),
            Container(
              child: Row(children: [
                Text("Size: "),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: size.length,
                    itemBuilder: (contex, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            isSelected = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isSelected == index
                                  ? Colors.purple
                                  : const Color.fromARGB(26, 199, 196, 196),
                              border: Border.all(
                                  color: Color.fromARGB(31, 115, 105, 105))),
                          child: Center(
                            child: Text(
                              size[index],
                              style: TextStyle(
                                  color: isSelected == index
                                      ? Colors.white
                                      : Colors.purple),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 5,
                      );
                    },
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    ShoppingCart.addProduct(
                        product: Productmodel(
                      title: widget.title,
                      description: widget.description,
                      price: widget.price,
                      id: widget.id,
                      category: widget.category,
                      image: widget.image,
                      rating: widget.rating,
                     
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.purple),
                    child: const Text(
                      "Add To Card",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.purple),
                    child: const Text(
                      "Add To Favorite",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _textstyle(
      {required double size,
      required Color color,
      required FontWeight weight}) {
    return TextStyle(fontSize: size, color: color, fontWeight: weight);
  }
}
