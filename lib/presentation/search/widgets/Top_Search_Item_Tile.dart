import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/presentation/search/widgets/search_idle.dart';

import '../../../core/Colors/colors.dart';

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: 0.35 * screenWidth,
          height: 0.15 * screenHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        SizedBox(
          width: 0.02 * screenWidth,
        ),
        const Expanded(
          child: Text(
            'Movie Name ',
            style: TextStyle(color: kWhite, fontSize: 18),
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
