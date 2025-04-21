import 'dart:math';

import 'package:flutter/material.dart';

import '../colors.dart';
class Sizes_Container extends StatelessWidget {
  const Sizes_Container({
    super.key,
    required this.isSelected,
    required this.e
  });

  final bool isSelected;
  final String e;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ?xprimaryColor.withOpacity(0.1):Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected?xprimaryColor:Colors.black12,
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: Text(e,style: TextStyle(
        color:isSelected?xprimaryColor: Colors.black,
        fontSize: 14,
      ),),
    );
  }
}
