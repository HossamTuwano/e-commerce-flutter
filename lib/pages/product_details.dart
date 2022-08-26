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
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    int index =
        productProvider.products.indexOf((productProvider.selectedProduct!));
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
                  children: [
                    IconButton(
                        onPressed: () {
                          productProvider.isLiked(index);
                        },
                        icon: productProvider.selectedProduct!.isLiked
                            ? Image.asset("assets/icons/heartitemenabled.png")
                            : Image.asset("assets/icons/heartitem.png")),
                    IconButton(
                        onPressed: () {
                          productProvider.addToCart(index);
                        },
                        icon: productProvider.selectedProduct!.isCart
                            ? Image.asset(
                                "assets/icons/favoriteditemenabled.png")
                            : Image.asset("assets/icons/favoriteditem.png")),
                  ],
                )),
            Stack(
              children: [
                SizedBox(
                  height: 180,
                  width: 200,
                  child: Image(
                      image:
                          AssetImage(productProvider.selectedProduct!.image)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: productProvider.selectedProduct!.isTrending
                      ? Row(
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
                        )
                      : Container(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 8.0, bottom: 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productProvider.selectedProduct!.name.toString(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(74, 74, 74, 1)),
                        ),
                        Text(
                          productProvider.selectedProduct!.price.toString(),
                          style: const TextStyle(
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
            Row(children: [
              Likes(
                  numberOfLikes: productProvider.selectedProduct!.numberOfLikes,
                  isLiked: productProvider.selectedProduct!.isLiked,
                  like: () {
                    productProvider.isLiked(index);
                  }),
              const Comments()
            ]),
            CartButton(
                addCart: () {
                  productProvider.addToCart(index);
                },
                buttonText: productProvider.selectedProduct!.isCart
                    ? "Added to Cart"
                    : "Add to Cart",
                btnColor: productProvider.selectedProduct!.isCart
                    ? AppColors.COLOR_GRAY
                    : AppColors.COLOR_RED,
                isCart: productProvider.selectedProduct!.isCart),
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
            const Reviews(),
          ]),
        ),
        bottomNavigationBar: productProvider.cart.isNotEmpty
            ? BottomAppBar(
                elevation: 9.0,
                child: Container(
                  padding: EdgeInsets.only(top: 8.0),
                  height: 90,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 255, 223, 225),
                      Colors.white
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/icons/downswipearrow.png'),
                      ListTile(
                        leading: Image.asset(productProvider.cart[index].image),
                        trailing: Image.asset('assets/icons/viewcart_btn.png'),
                        title: Text(productProvider.selectedProduct!.name),
                        subtitle:
                            Text('\$${productProvider.selectedProduct!.price}'),
                      ),
                    ],
                  ),
                ))
            : SizedBox(),
      ),
    );
  }
}
