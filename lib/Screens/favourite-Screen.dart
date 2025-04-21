import 'package:flutter/material.dart';

import '../colors.dart';
import '../models/Cart-Provide.dart';
import '../models/FacoouriteProvider.dart';
class FavouirtePage extends StatefulWidget {
  const FavouirtePage({super.key});

  @override
  State<FavouirtePage> createState() => _FavouirtePageState();
}

class _FavouirtePageState extends State<FavouirtePage> {
  @override
  Widget build(BuildContext context) {
    final provider=FavouriteProvider.of(context);
    final finallist=provider.cart;
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              const Text(
                "Favourite",
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
