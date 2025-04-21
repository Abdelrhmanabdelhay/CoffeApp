import 'package:flutter/material.dart';
import 'package:untitled1/Screens/Cart-Screen.dart';
import 'package:untitled1/models/Coffe-Model.dart';

import '../Screens/Details-Screen.dart';
import '../colors.dart';
import '../models/Cart-Provide.dart';
import 'CustomButoon.dart';
class NavBar_DetailsScreen extends StatefulWidget {
   NavBar_DetailsScreen({
    super.key,
    required this.widget,
    required this.coffeeModel
  });

  final CoffeDetails widget;
final CoffeeModel coffeeModel;
  @override
  State<NavBar_DetailsScreen> createState() => _NavBar_DetailsScreenState();
}

class _NavBar_DetailsScreenState extends State<NavBar_DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final provider=CartProvider.of(context);
    final finallist=provider.cart;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 25,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(12)
        ),
      ),
      child: Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Price",style: TextStyle(
                color: xsecondaryColor,
              ),
                textAlign: TextAlign.center,),
              SizedBox(height: 3,),
              Text("\$${widget.widget.coffe.price}",style: TextStyle(
                  color: xprimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),
            ],
          )),
          SizedBox(width: 240,child: CustomButton(title: "Buy Now", onTab: (){
            provider.toogleproduct(widget.coffeeModel);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Added to cart successfully ✅"),
                duration: Duration(seconds: 1),
              ),
            );
            Future.delayed(Duration(seconds: 1), () {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>CartPage())); // Make sure your cart screen route is named '/cart'
            });
          }),)
        ],
      ),
    );
  }
}
