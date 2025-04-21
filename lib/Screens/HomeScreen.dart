import 'package:flutter/material.dart';
import 'package:untitled1/Widgets/Coffe-View.dart';
import 'package:untitled1/Widgets/Location-and-search.dart';
import 'package:untitled1/Widgets/Promo-Container.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: Stack(
        children: [
          Positioned(
              height: 220,
              left: 0,
              right: 0,
              child:LocationContainer()),
          Positioned.fill(
              top: 220,
              child: CoffeView() ),
          Positioned(
              height: 150,
              top: 180,
              left: 0,
              right: 0,
              child: PromoContainer()),
        ],
      ),
    );
  }
}
