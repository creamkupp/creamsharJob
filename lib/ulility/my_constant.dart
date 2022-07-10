import 'package:flutter/material.dart';

class MyConatant {
  static Color primary = const Color.fromARGB(255, 125, 190, 244);
  static Color dark = const Color.fromARGB(255, 26, 45, 61);
  static Color light = const Color.fromARGB(255, 171, 59, 202);
  static Color active = const Color.fromARGB(255, 231, 127, 220);

  TextStyle h1Style() => TextStyle(
    fontSize: 48,
    fontFamily: 'Itim',
    fontWeight: FontWeight.bold,
    color: dark,
  );

  TextStyle h2Style() => TextStyle(
    fontSize: 24,
    fontFamily: 'Itim',
    fontWeight: FontWeight.w500,
    color: dark,
  );
  TextStyle h2WhiteStyle() => const TextStyle(
    fontSize: 24,
    fontFamily: 'Itim',
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );


  TextStyle h3Style() => TextStyle(
    fontSize: 20,
    fontFamily: 'Itim',
    fontWeight: FontWeight.w700,
    color: dark,
  );

  TextStyle h3ActiveStye() => TextStyle(
    fontSize: 22,
    fontFamily: 'Itim',
    fontWeight: FontWeight.w500,
    color: active,
  );

  BoxDecoration bgBox() => const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bg.png"),
          fit: BoxFit.cover,
        ),
      );
}
