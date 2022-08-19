import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../resources/app_colors.dart";
import "../resources/categories.dart";
import "../providers/navigation_provider.dart";

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  var categories = Categories.getCategories;
  var categoryNames = ["browse", "hot", "cart", "Profile"];

  @override
  Widget build(BuildContext context) {
    NavigationProvider categoryNameIndex =
        Provider.of<NavigationProvider>(context);
    // print(categories);
    return Container(
      padding: const EdgeInsets.only(left: 17.0, right: 17.0, top: 1.0),
      height: categoryNameIndex.currentIndex == 0 ||
              categoryNameIndex.currentIndex == 1
          ? 100
          : 56,
      color: AppColors.COLOR_PRIMARY,
      child: Column(
        children: [
          categoryNameIndex.currentIndex == 3
              ? TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Edit",
                        style: TextStyle(
                            color: AppColors.COLOR_SECONDARY, fontSize: 20),
                      ),
                      Text(
                        categoryNames[categoryNameIndex.currentIndex],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container()
                    ],
                  ))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(
                        image: AssetImage("assets/icons/menubutton.png")),
                    Text(
                      categoryNames[categoryNameIndex.currentIndex]
                          .toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 40,
                    )
                  ],
                ),

          categoryNameIndex.currentIndex == 0 ||
                  categoryNameIndex.currentIndex == 1
              ? SizedBox(
                  height: 40.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: ((context, index) {
                        return Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              child: TextButton(
                                style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(
                                        const Size.fromWidth(130.0)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            side: BorderSide(
                                                color:
                                                    categories[index] == "ALL"
                                                        ? Colors.transparent
                                                        : AppColors
                                                            .COLOR_SECONDARY),
                                            borderRadius:
                                                BorderRadius.circular(18.0))),
                                    backgroundColor: MaterialStateProperty.all(
                                        categories[index] == "ALL"
                                            ? Colors.red
                                            : AppColors.COLOR_PRIMARY)),
                                onPressed: () {},
                                child: Text(
                                  categories[index],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        );
                      })))
              : Container(),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(children: [
          //     TextButton(
          //       style: ButtonStyle(
          //           fixedSize:
          //               MaterialStateProperty.all(const Size.fromWidth(130.0)),
          //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //               RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(18.0))),
          //           backgroundColor: MaterialStateProperty.all(Colors.red)),
          //       onPressed: () {},
          //       child: Text(
          //         "all".toUpperCase(),
          //         style: const TextStyle(
          //             color: Colors.white,
          //             fontSize: 15,
          //             fontWeight: FontWeight.w300),
          //       ),
          //     ),
          //   ]),
          // )
        ],
      ),
    );
  }
}
