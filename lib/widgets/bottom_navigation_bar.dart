import 'package:e_commerce_qlicue/providers/navigation_provider.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    NavigationProvider navigationProvider =
        Provider.of<NavigationProvider>(context);
    return BottomNavigationBar(
      fixedColor: Colors.white,
      selectedLabelStyle:
          const TextStyle(height: 1.7, color: Color.fromRGBO(255, 255, 255, 1)),
      unselectedLabelStyle: const TextStyle(
        height: 1.7,
        color: Colors.white,
      ),
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromRGBO(36, 36, 36, 1),
      items: [
        BottomNavigationBarItem(
            // backgroundColor: const Color.fromRGBO(36, 36, 36, 1),
            icon: Image.asset("assets/icons/browsebutton.png"),
            label: "browse".toUpperCase()),
        BottomNavigationBarItem(
            icon: Image.asset("assets/icons/hotitems.png"),
            label: "hot".toUpperCase()),
        BottomNavigationBarItem(
            icon: Image.asset("assets/icons/cart.png"),
            label: "Cart".toUpperCase()),
        BottomNavigationBarItem(
            icon: Image.asset("assets/icons/profile.png"),
            label: "profile".toUpperCase()),
      ],
      currentIndex: navigationProvider.currentIndex,
      onTap: (index) => {navigationProvider.currentIndex = index},
    );
  }
}
