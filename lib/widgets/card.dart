import 'package:e_commerce_qlicue/widgets/comments.dart';
import 'package:e_commerce_qlicue/widgets/likes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../resources/products.dart';
import "../providers/products_provider.dart";

class SingleProduct extends StatefulWidget {
  const SingleProduct({Key? key}) : super(key: key);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  var products = Products.productData;

  @override
  Widget build(BuildContext context) {
    ProductProvider productsProvider = Provider.of<ProductProvider>(context);

    var getProducts = productsProvider.products;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 450,
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: ((context, index) {
            return Card(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                productsProvider.isLiked(index);
                              },
                              icon: getProducts[index].isLiked
                                  ? Image.asset(
                                      'assets/icons/heartitemenabled.png')
                                  : Image.asset('assets/icons/heartitem.png')),
                          IconButton(
                              onPressed: () {
                                productsProvider.addToCart(index);
                              },
                              icon: getProducts[index].isCart
                                  ? Image.asset(
                                      'assets/icons/favoriteditemenabled.png')
                                  : Image.asset(
                                      'assets/icons/favoriteditem.png')),
                        ],
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/product_details");
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 200,
                          child: Image(
                              image: AssetImage(getProducts[index].image)),
                        ),
                      ],
                    ),
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
                                    image:
                                        AssetImage("assets/icons/flag.png"))),
                            Text(
                              "Trending".toUpperCase(),
                              style: const TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        indent: 5.0,
                        endIndent: 5.0,
                        color: Color.fromARGB(110, 112, 120, 1),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 8.0, bottom: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getProducts[index].name,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(74, 74, 74, 1)),
                          ),
                          Text(
                            '\$${getProducts[index].price.toString()}',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(110, 112, 120, 1)),
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(children: const [Likes(), Comments()]),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
