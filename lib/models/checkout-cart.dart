import 'package:flutter/material.dart';
import 'package:untitled1/colors.dart';
import 'package:untitled1/models/Cart-Provide.dart';
import '../Services/AddCoffeCheckout_Services.dart';
import 'Coffe-Model.dart';

class CheckOutBox extends StatelessWidget {
  final List<CoffeeModel> cartItems;

  CheckOutBox({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);

    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              filled: true,
              fillColor: xbackgroundColor,
              hintText: "Enter Discount Code",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              suffixIcon: TextButton(
                onPressed: () {},
                child: Text(
                  "Apply",
                  style: TextStyle(
                    color: xprimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("SubTotal", style: TextStyle(color: Colors.grey, fontSize: 16)),
              Text("\$${provider.totalprice()}", style: TextStyle(color: Colors.grey, fontSize: 16)),
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text("\$${provider.totalprice()}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: xprimaryColor,
              minimumSize: Size(double.infinity, 55),
            ),
            onPressed: () async {
              try {
                for (var item in cartItems) {
                  await AddCofee().AddCoffee(
                    name: item.name,
                    categ: item.category,
                    price: item.price.toString(), // Ensure it's a string
                    quntity: item.quntity.toString(), // Ensure it's a string
                  );
                }
                provider.clearCart();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Order placed successfully!"),
                    backgroundColor: Colors.green,
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Failed to Place Order"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Text(
              "Check Out",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
