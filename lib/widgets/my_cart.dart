import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [Positioned(child: Text("hello"))],
    );
  }
}
