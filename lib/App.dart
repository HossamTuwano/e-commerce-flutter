import 'package:e_commerce_qlicue/pages/home.dart';
import 'package:flutter/material.dart';
import 'pages/product_details.dart';
import 'pages/login.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "e-commerce",
      home: const Login(),
      routes: {"/product_details": (context) => const ProductDetails()},
    );
  }
}
