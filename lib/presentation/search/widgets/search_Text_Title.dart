
import 'package:flutter/material.dart';

import '../../../core/Colors/colors.dart';

class searchTextTitle extends StatelessWidget {
  const searchTextTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: TextStyle(
          color: kWhite, fontWeight: FontWeight.bold, fontSize: 22),
    );
  }
}
