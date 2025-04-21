import 'package:flutter/material.dart';
class PromoContainer extends StatelessWidget {
  const PromoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: NetworkImage("assets/coffee-shop/banner.png",),fit: BoxFit.cover,)
      ),
    );
  }
}
