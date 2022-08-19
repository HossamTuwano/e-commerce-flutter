import 'package:flutter/material.dart';
import "../resources/app_colors.dart";
import '../resources/avatars.dart';

class PeopleLiked extends StatefulWidget {
  const PeopleLiked({Key? key}) : super(key: key);

  @override
  State<PeopleLiked> createState() => _PeopleLikedState();
}

class _PeopleLikedState extends State<PeopleLiked> {
  var avatars = Avatars.getAvatars;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text("239 People Liked this"),
          const Divider(
            indent: 10.0,
            endIndent: 10.0,
            color: AppColors.COLOR_SECONDARY,
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: avatars.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(avatars[index]),
                        ),
                      ],
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }
}
