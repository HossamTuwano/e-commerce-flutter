import 'package:flutter/material.dart';
import "../resources/app_colors.dart";

class CartButton extends StatefulWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsetsDirectional.only(top: 12, bottom: 12)),
          fixedSize: MaterialStateProperty.all(
            const Size.fromWidth(390),
          ),
          backgroundColor: MaterialStateProperty.all(AppColors.COLOR_RED)),
      child: Text(
        "Add to Cart".toUpperCase(),
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
      ),
    );
  }
}
