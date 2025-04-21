import 'package:flutter/material.dart';

Color xbackgroundColor = const Color(0xfff9f9f9);
Color xprimaryColor = const Color(0xffC67C4E);
Color xsecondaryColor = const Color(0xffA2A2A2);
BoxDecoration buildGradientBackground() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromARGB(255, 17, 17, 17),
        Color.fromARGB(255, 49, 49, 49),
      ],
    ),
  );
}
