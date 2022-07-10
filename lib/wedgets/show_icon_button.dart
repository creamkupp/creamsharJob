// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:creamsharjob/ulility/my_constant.dart';

class ShowIconButton extends StatelessWidget {
  final IconData iconData;
  final Function() presssFunc;
  final double? size;
  const ShowIconButton({
    Key? key,
    required this.iconData,
    required this.presssFunc,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: presssFunc,
        icon: Icon(
          iconData,
          color: MyConatant.dark,
          size: size ?? 24,
        ));
  }
}
