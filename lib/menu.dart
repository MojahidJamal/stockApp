import 'package:stock/test.dart';

import 'package:stock/items_page.dart';

class Menu {
  List<Test> _test = [];
  double _totalPrice = 0.0;

  void add(Test test) {
    _test.add(test);
    // _totalPrice += test.price;
  }

  void remove(Test test) {
    // _totalPrice -= test.price;
    _test.remove(test);
  }

  int get count {
    return _test.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<Test> get basketItems {
    return _test;
  }
}
