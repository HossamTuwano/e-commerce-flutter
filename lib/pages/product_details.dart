import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import "../widgets/likes.dart";
import "../widgets/comments.dart";
import '../widgets/button.dart';
import "../widgets/people_liked.dart";
import "../widgets/reviews.dart";
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    ProductProvider selectedProduct = Provider.of<ProductProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text("Product Details"),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Image(
                      image: AssetImage("assets/icons/heartitem.png"),
                    ),
                    Image(
                        image:
                            AssetImage("assets/icons/favoriteditemenabled.png"))
                  ],
                )),
            Stack(
              children: [
                SizedBox(
                  height: 180,
                  width: 200,
                  child: Image(
                      image: AssetImage(selectedProduct.products[0].image)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 8.0),
                          child: const Image(
                              image: AssetImage("assets/icons/flag.png"))),
                      Text(
                        "Trending".toUpperCase(),
                        style: const TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 8.0, bottom: 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Samsung A70 2020",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(74, 74, 74, 1)),
                        ),
                        Text(
                          "\$949.00",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(110, 112, 120, 1)),
                        )
                      ]),
                ),
                const Divider(
                    thickness: 0.8,
                    indent: 5.0,
                    endIndent: 5.0,
                    color: AppColors.COLOR_SECONDARY),
              ]),
            ),
            Row(children: const [Likes(), Comments()]),
            const CartButton(),
            const SizedBox(height: 15.0),
            const PeopleLiked(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("AVAERAGE REVIEW"),
            ),
            const Divider(
                thickness: 0.8,
                indent: 15.0,
                endIndent: 15.0,
                color: AppColors.COLOR_SECONDARY),
            const Reviews()
          ]),
        ),
      ),
    );
  }
}
