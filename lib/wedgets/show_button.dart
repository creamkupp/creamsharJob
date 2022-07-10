// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:creamsharjob/ulility/my_constant.dart';
import 'package:creamsharjob/wedgets/show_text.dart';
import 'package:flutter/material.dart';

class ShowButton extends StatelessWidget {
  final String label;
  final Function() pressFunc;
  const ShowButton({
    Key? key,
    required this.label,
    required this.pressFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(primary: MyConatant.active),
        onPressed: pressFunc,
        child: ShowText(
          text: label,
          textStyle: MyConatant().h2WhiteStyle(),
        ));
  }
}
