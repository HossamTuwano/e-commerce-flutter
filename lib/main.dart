import 'package:e_commerce_qlicue/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import "package:e_commerce_qlicue/providers/products_provider.dart";
import 'providers/auth_provider.dart';
import "App.dart";

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ProductProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => NavigationProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
      )
    ],
    child: const App(),
  ));
}
