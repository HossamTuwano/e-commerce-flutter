import 'package:flutter/material.dart';
import '../resources/products.dart';

class ProductProvider with ChangeNotifier {
  // getProducts() {

  List<Products> cart = [];

  List<Products> products = [
    Products(
      id: 1,
      name: "PS4 dual shock controller",
      price: 109.9,
      image: "assets/images/product-images/image-controller.jpg",
      isLiked: false,
      isCart: false,
      numberOfComments: 123,
      numberOfLikes: 120,
    ),
    Products(
      id: 2,
      name: "hossam",
      price: 99.9,
      image: "assets/images/product-images/image-hdd.webp",
      isLiked: false,
      isCart: false,
      numberOfComments: 123,
      numberOfLikes: 120,
    ),
    Products(
      id: 3,
      name: "hp Laptop",
      price: 909.9,
      image: "assets/images/product-images/image-laptop.jpg",
      isLiked: false,
      isCart: false,
      numberOfComments: 123,
      numberOfLikes: 120,
    ),
    Products(
      id: 4,
      name: "Samsung galaxy 2020",
      price: 300.9,
      image: "assets/images/product-images/image-phone.jpg",
      isLiked: false,
      isCart: false,
      numberOfComments: 123,
      numberOfLikes: 120,
    ),
    Products(
      id: 5,
      name: "hd Television",
      price: 400.9,
      image: "assets/images/product-images/image-tv.jpg",
      isLiked: false,
      isCart: false,
      numberOfComments: 123,
      numberOfLikes: 120,
    ),
  ];
  // notifyListeners();
  // }

  void isLiked(index) {
    products[index].isLiked = !products[index].isLiked;
    notifyListeners();
  }

  void addToCart(index) {
    if (cart.contains(products[index])) {
      products[index].isCart = !products[index].isCart;
      int cartIndex = cart
          .indexWhere((Products product) => product.id == products[index].id);
      cart.removeAt(cartIndex);
    } else {
      products[index].isCart = !products[index].isCart;

      cart.add(products[index]);
    }

    notifyListeners();
  }

  subTotal() {
    double total = 0.0;
    for (var cartPrice in cart) {
      total += cartPrice.price;
    }

    return total;
  }

  tax() {
    double tax = 18 / 100;
    double totalTax = 0.0;
    List eachprice = [];
    for (var cartPrice in cart) {
      eachprice.add(cartPrice.price * tax);
    }

    for (var itemTax in eachprice) {
      totalTax += itemTax;
    }

    return totalTax;
  }
}
