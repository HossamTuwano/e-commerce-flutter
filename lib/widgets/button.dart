import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final Function() addCart;
  final String buttonText;
  final Color btnColor;
  final bool isCart;

  const CartButton(
      {required this.addCart,
      required this.buttonText,
      required this.btnColor,
      required this.isCart});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: addCart,
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsetsDirectional.only(top: 12, bottom: 12)),
          fixedSize: MaterialStateProperty.all(
            const Size.fromWidth(390),
          ),
          backgroundColor: MaterialStateProperty.all(btnColor)),
      child: SizedBox(
        height: 30,
        child: Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: isCart
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: 900,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        buttonText.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Expanded(
                        flex: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset('assets/icons/check_icon.png'),
                        )),
                  ],
                )
              : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    buttonText.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  )
                ]),
        ),
      ),
    );
  }
}
