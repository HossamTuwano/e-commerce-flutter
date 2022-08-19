import 'package:e_commerce_qlicue/pages/cart.dart';
import 'package:e_commerce_qlicue/pages/profile.dart';
import 'package:e_commerce_qlicue/providers/navigation_provider.dart';
import 'package:e_commerce_qlicue/widgets/card.dart';
import 'package:e_commerce_qlicue/widgets/Header.dart';
import 'package:e_commerce_qlicue/pages/hot.dart';
import 'package:provider/provider.dart';
import "../widgets/bottom_navigation_bar.dart";
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pages = [
    SingleProduct(),
    const HotPage(),
    const Cart(),
    const Profile()
  ];
  //  Text('${navigationProvider.currentIndex}')

  @override
  Widget build(BuildContext context) {
    NavigationProvider navigationProvider =
        Provider.of<NavigationProvider>(context);
    return Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            const Header(),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: pages[navigationProvider.currentIndex],
              ),
            )
          ],
        )),
        bottomNavigationBar: const BottomNavigation());
  }
}
