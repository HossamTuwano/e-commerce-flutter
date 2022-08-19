import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/products_provider.dart";

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    ProductProvider cartProducts = Provider.of<ProductProvider>(context);
    var cartDetails = cartProducts.cart;
    double total = cartProducts.subTotal() + cartProducts.tax();
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: cartDetails.isEmpty
              ? const Text("Your Cart Is empty")
              : ListView.builder(
                  itemCount: cartDetails.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Colors.white,
                        )),
                    elevation: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 120.0, top: 8),
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.black,
                          ),
                        ),
                        Image.asset(
                          cartDetails.isEmpty
                              ? "unknown"
                              : cartProducts.cart[index].image,
                          fit: BoxFit.fill,
                          width: 150,
                        ),
                        Text(
                            cartDetails.isEmpty
                                ? "unknown"
                                : cartProducts.cart[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        // const SizedBox(
                        // height: 6,
                        //),
                        const Text("Blue-Medium",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,
                              fontSize: 10,
                            )),
                        // const SizedBox(
                        //   height: 6,
                        // ),
                        Text(cartDetails[index].price.toString(),
                            style: const TextStyle(
                              color: Colors.black26,
                              fontSize: 40,
                            )),
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              children: [
                                // const SizedBox(
                                //   width: 1,
                                // ),
                                Image.asset(
                                  cartDetails[index].image,
                                  width: 19,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Image.asset(
                                  cartDetails[index].image,
                                  width: 19,
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
        ),
        Container(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff242424),
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              letterSpacing: 2),
                        ),
                        Text(
                          '\$${double.parse(cartProducts.subTotal().toStringAsFixed(2)).toString()}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            letterSpacing: 2,
                            color: Color(0xff777775),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 5,
                    thickness: 1,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Taxes:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff242424),
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              letterSpacing: 2),
                        ),
                        Text(
                          '\$${double.parse(cartProducts.tax().toStringAsFixed(2)).toString()}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            letterSpacing: 2,
                            color: Color(0xff777775),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 5,
                    thickness: 1,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'total:'.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff242424),
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              letterSpacing: 2),
                        ),
                        Text(
                          '\$${double.parse(total.toStringAsFixed(2)).toString()}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            letterSpacing: 2,
                            color: Color(0xff777775),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
