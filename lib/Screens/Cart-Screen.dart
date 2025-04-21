import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untitled1/colors.dart';
import 'package:untitled1/models/Cart-Provide.dart';
import 'package:untitled1/models/checkout-cart.dart';

import '../Bottom-nav-bar.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final provider=CartProvider.of(context);
    final finallist=provider.cart;
    productQuntit(IconData icon,int index){
      return GestureDetector(
        onTap: (){
icon ==Icons.add? provider.incremntQtn(index):provider.decremntQtn(index);
        },
        child: Icon(icon,size: 20,),
      );
    }
    return  Scaffold(
      backgroundColor: Color(0xffeeeeee),
      bottomSheet: CheckOutBox(cartItems: finallist,),
      body: ListView(
        children: [
          Row(
            children: [
              IconButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>BottomNav()));
              }, icon: Icon(Iconsax.backward)),
              const SizedBox(height: 150),
              SizedBox(width: 125,),
              const Text(
                "MyCart",
                style: TextStyle(
                    color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true, itemCount: finallist.length,itemBuilder: (context,index){
            final cartitems=finallist[index];
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width:double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                          ),
                          padding: EdgeInsets.all(20),
                          child: Image.network(cartitems.image),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cartitems.name,style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 5,),
                            Text(cartitems.category,style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 5,),
                            Text("\$${cartitems.price.toString()}",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(top: 35,right: 35,child: Column(
                  children: [
                    IconButton(onPressed: (){
                      finallist.removeAt(index);
                      setState(() {

                      });
                    }, icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    )),
                    SizedBox(height: 10,),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: xbackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children:
                        [
                          SizedBox(width: 10,),
                          productQuntit(Icons.add, index),
                          SizedBox(width: 10,),
                          Text(cartitems.quntity.toString(),style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(width: 10,),
                          productQuntit(Icons.remove, index),
                          SizedBox(width: 10,),
                        ],
                      ),
                    )

                  ],
                ))
              ],
            );
          })

        ],
      ),
    );
  }
}
