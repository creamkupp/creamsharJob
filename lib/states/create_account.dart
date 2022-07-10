import 'package:creamsharjob/ulility/my_constant.dart';
import 'package:creamsharjob/wedgets/show_icon_button.dart';
import 'package:creamsharjob/wedgets/show_image.dart';
import 'package:creamsharjob/wedgets/show_text.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: newAppbar(),
      body: ListView(
        children: [
          createCenter(widget: newImage()),
        ],
      ),
    );
  }

  Widget createCenter({required Widget widget}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [widget],
      );

  Container newImage() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: 250,
      height: 250,
      child: Stack(
        children: [
          ShowImage(
            path: 'images/rva.png',
          ),
          ShowIconButton(iconData: Icons.add_a_photo, presssFunc: (){},),
        ],
      ),
    );
  }

  AppBar newAppbar() {
    return AppBar(
      centerTitle: true,
      title: ShowText(
        text: 'create New Account',
        textStyle: MyConatant().h2Style(),
      ),
      backgroundColor: Colors.white,
      foregroundColor: MyConatant.dark,
      elevation: 0,
    );
  }
}
