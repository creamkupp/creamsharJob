// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:creamsharjob/ulility/my_constant.dart';
import 'package:flutter/material.dart';

class ShowIconButton extends StatelessWidget {
  final IconData iconData;
  final Function() presssFunc;
  const ShowIconButton({
    Key? key,
    required this.iconData,
    required this.presssFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: presssFunc,
        icon: Icon(
          iconData,
          color: MyConatant.dark,
        ));
  }
}
