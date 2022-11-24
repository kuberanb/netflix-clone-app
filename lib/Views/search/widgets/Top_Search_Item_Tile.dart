import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/Views/search/widgets/search_idle.dart';

import '../../../core/Colors/colors.dart';

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile({super.key,required this.title,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: 0.45 * screenWidth,
          height: 0.15 * screenHeight,
          decoration:  BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        SizedBox(
          width: 0.02 * screenWidth,
        ),
         Expanded(
          child: Text(
            title,
            style: const TextStyle(color: kWhite, fontSize: 18),
          ),
        ),
        // const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.play_circle,
            color: kWhite,
            size: 40,
          ),
        ),
      ],
    );
  }
}
