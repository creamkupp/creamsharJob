// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:creamsharjob/ulility/my_constant.dart';
import 'package:creamsharjob/wedgets/show_text.dart';
import 'package:flutter/material.dart';

class ShowTextButton extends StatelessWidget {
  final String label;
  final Function() pressFunc;
  const ShowTextButton({
    Key? key,
    required this.label,
    required this.pressFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: pressFunc,
        child: ShowText(
          text: label,
          textStyle: MyConatant().h3ActiveStye(),
        ));
  }
}
