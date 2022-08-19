import 'package:flutter/material.dart';
import "../providers/products_provider.dart";
import "package:provider/provider.dart";

class Likes extends StatefulWidget {
  const Likes({Key? key}) : super(key: key);

  @override
  State<Likes> createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productsProvider = Provider.of<ProductProvider>(context);

    var getProducts = productsProvider.products;
    return Row(children: [
      IconButton(
        iconSize: 20.3,
        color: const Color.fromRGBO(74, 74, 74, 1),
        onPressed: () {},
        icon: const Icon(Icons.favorite),
      ),
      Text(
        '${getProducts[0].numberOfLikes} Likes',
        style: TextStyle(fontSize: 13),
      )
    ]);
  }
}
