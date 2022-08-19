import 'package:flutter/material.dart';
import "../providers/products_provider.dart";
import "package:provider/provider.dart";

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productsProvider = Provider.of<ProductProvider>(context);

    var getProducts = productsProvider.products;

    return SizedBox(
        child: Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.comment),
          color: const Color.fromRGBO(74, 74, 74, 1),
        ),
        Text(
          '${getProducts[0].numberOfComments} Comments',
          style: const TextStyle(fontSize: 13),
        )
      ],
    ));
  }
}
