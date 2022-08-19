import 'package:e_commerce_qlicue/resources/products.dart';
import 'package:flutter/cupertino.dart';
// import '../widgets/profile.txt';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[];

  get currentIndex => _currentIndex;

  set currentIndex(dynamic index) {
    _currentIndex = index;
    notifyListeners();
  }

  pages() {
    notifyListeners();
  }
}

class NavigationPages {}
