import 'dart:io';

import 'package:creamsharjob/ulility/my_constant.dart';
import 'package:creamsharjob/ulility/my_dialog.dart';
import 'package:creamsharjob/ulility/my_process.dart';
import 'package:creamsharjob/wedgets/show_button.dart';
import 'package:creamsharjob/wedgets/show_form.dart';
import 'package:creamsharjob/wedgets/show_icon_button.dart';
import 'package:creamsharjob/wedgets/show_image.dart';
import 'package:creamsharjob/wedgets/show_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var educations = MyConatant.educations;
  String? education, name, address, special, email, password;
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: newAppbar(),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
        child: ListView(
          children: [
            createCenter(widget: newImage()),
            formName(),
            dropDownEducate(),
            formAddress(),
            formSpecial(),
            formEmail(),
            formPassword(),
            buttonCreateAccount(),
          ],
        ),
      ),
    );
  }

  Widget buttonCreateAccount() {
    return createCenter(
      widget: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: 250,
        child: ShowButton(
          label: 'Create Account',
          pressFunc: () {
            if (file == null) {
              MyDialog(context: context).normalDialog(
                  title: 'No Image ?', subTitle: 'Please Take Photo');
            } else if ((name?.isEmpty ?? true) ||
                (address?.isEmpty ?? true) ||
                (special?.isEmpty ?? true) ||
                (email?.isEmpty ?? true) ||
                (password?.isEmpty ?? true)) {
              MyDialog(context: context).normalDialog(
                  title: 'Have Space ?', subTitle: 'Please Fill Every Blank');
            } else if (education == null) {
              MyDialog(context: context).normalDialog(
                  title: '??????????????????????????????????????? ?',
                  subTitle: "?????????????????????????????? ???????????????????????????????????????");
            } else {}
          },
        ),
      ),
    );
  }

  Widget formPassword() {
    return createCenter(
      widget: ShowForm(
        hint: 'Password :',
        iconData: Icons.lock_outline,
        changeFunc: (String string) {
          password = string.trim();
        },
      ),
    );
  }

  Widget formEmail() {
    return createCenter(
      widget: ShowForm(
        hint: 'Email :',
        iconData: Icons.email_outlined,
        changeFunc: (String string) {
          email = string.trim();
        },
      ),
    );
  }

  Widget formSpecial() {
    return createCenter(
      widget: ShowForm(
        hint: '????????????????????????????????????????????? :',
        iconData: Icons.star_border_outlined,
        changeFunc: (String string) {
          special = string.trim();
        },
      ),
    );
  }

  Widget formAddress() {
    return createCenter(
      widget: ShowForm(
        maxLine: 3,
        textInputType: TextInputType.multiline,
        hint: 'Address :',
        iconData: Icons.home_outlined,
        changeFunc: (String string) {
          address = string.trim();
        },
      ),
    );
  }

  Widget dropDownEducate() {
    return createCenter(
        widget: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.only(top: 16),
      decoration: MyConatant().curveBorder(),
      width: 250,
      height: 40,
      child: DropdownButton<dynamic>(
        underline: const SizedBox(),
        hint: const ShowText(text: '??????????????????????????????????????????????????????????????????'),
        value: education,
        items: educations
            .map(
              (e) => DropdownMenuItem(
                child: ShowText(text: e),
                value: e,
              ),
            )
            .toList(),
        onChanged: (value) {
          education = value;
          setState(() {});
        },
      ),
    ));
  }

  Widget formName() {
    return createCenter(
      widget: ShowForm(
        hint: 'Display Name :',
        iconData: Icons.fingerprint,
        changeFunc: (String string) {
          name = string.trim();
        },
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
          file == null
              ? const ShowImage(
                  path: 'images/rva.png',
                )
              : CircleAvatar(
                  radius: 125,
                  backgroundImage: FileImage(file!),
                ),
          Positioned(
            right: 0,
            bottom: 0,
            child: ShowIconButton(
              size: 36,
              iconData: Icons.add_a_photo,
              presssFunc: () {
                MyDialog(context: context).normalDialog(
                  title: 'Source Image ?',
                  subTitle: "Please Tap Camara or Gallery",
                  label1: 'Camera',
                  label2: 'Gallery',
                  pressFunc1: () async {
                    Navigator.pop(context);
                    await MyProcess()
                        .takePhoto(source: ImageSource.camera)
                        .then((value) {
                      setState(() {
                        file = value;
                      });
                    });
                  },
                  pressFunc2: () async {
                    Navigator.pop(context);
                    await MyProcess()
                        .takePhoto(source: ImageSource.gallery)
                        .then((value) {
                      setState(() {
                        file = value;
                      });
                    });
                  },
                );
              },
            ),
          ),
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
