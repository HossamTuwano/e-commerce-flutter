import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  var star = [
    "assets/icons/starfilled.png",
    "assets/icons/starfilled.png",
    "assets/icons/starfilled.png",
    "assets/icons/starfilled.png",
    "assets/icons/starempty.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 100.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: star.length,
            itemBuilder: ((context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Image(image: AssetImage(star[index]))),
                ],
              );
            })),
      ),
    );
  }
}
