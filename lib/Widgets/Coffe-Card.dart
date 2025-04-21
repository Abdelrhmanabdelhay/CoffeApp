import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/colors.dart';
import 'package:untitled1/models/Cart-Provide.dart';
import 'package:untitled1/models/Coffe-Model.dart';

class CoffeContainer extends StatefulWidget {
  CoffeContainer({super.key, required this.coffeeModel});
  final CoffeeModel coffeeModel;

  @override
  State<CoffeContainer> createState() => _CoffeContainerState();
}

class _CoffeContainerState extends State<CoffeContainer> {
  @override
  Widget build(BuildContext context) {
    final provider=CartProvider.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 120,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    widget.coffeeModel.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 55,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                        boxShadow: [
                    BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 2.5,
                  ),]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Icon(Icons.star, color: Colors.yellow, size: 12),
                        SizedBox(width: 5),
                        Text(widget.coffeeModel.rate.toString(), style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Prevent overflow
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 Text(
                  widget.coffeeModel.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                 Text(
                  widget.coffeeModel.category,
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      "\$${widget.coffeeModel.price}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: CupertinoButton(
                        color: xprimaryColor,
                        padding: EdgeInsets.zero,
                        borderRadius: BorderRadius.circular(10),
                        child: const Icon(Icons.add, size: 20),
                        onPressed: () {
                          provider.toogleproduct(widget.coffeeModel);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
