import 'package:flutter/material.dart';
import "../providers/products_provider.dart";
import "package:provider/provider.dart";

// class Likes extends StatefulWidget {
//   // const Likes({Key? key}) : super(key: key);
//   const Likes(Widget icon, Widget text);

//   @override
//   State<Likes> createState() => _LikesState();
// }

// class _LikesState extends State<Likes> {
//   @override
//   Widget build(BuildContext context) {
//     ProductProvider productsProvider = Provider.of<ProductProvider>(context);

//     var getProducts = productsProvider.products;
//     return Row(children: [
//       IconButton(
//         iconSize: 20.3,
//         color: const Color.fromRGBO(74, 74, 74, 1),
//         onPressed: () {},
//         icon: const Icon(Icons.favorite),
//       ),
//       Text(
//         '${getProducts[0].numberOfLikes} Likes',
//         style: TextStyle(fontSize: 13),
//       )
//     ]);
//   }
// }

class Likes extends StatelessWidget {
  final int numberOfLikes;
  final bool isLiked;
  final Function() like;

  const Likes(
      {required this.numberOfLikes, required this.isLiked, required this.like});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
          iconSize: 20.3,
          color: Colors.red,
          onPressed: like,
          icon: isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_outline)),
      Text('$numberOfLikes Likes')
    ]);
  }
}
