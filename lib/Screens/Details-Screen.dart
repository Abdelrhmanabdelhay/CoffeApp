import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:untitled1/Widgets/CustomButoon.dart';
import 'package:untitled1/models/Cart-Provide.dart';
import 'package:untitled1/models/Coffe-Model.dart';
import 'package:untitled1/models/FacoouriteProvider.dart';
import '../Bottom-nav-bar.dart';
import '../Widgets/NavBar_DetailsScreen.dart';
import '../Widgets/Sizes_Container.dart';
import '../colors.dart';

class CoffeDetails extends StatefulWidget {
  CoffeDetails({super.key, required this.coffe});
  final CoffeeModel coffe;

  @override
  State<CoffeDetails> createState() => _CoffeDetailsState();
}

class _CoffeDetailsState extends State<CoffeDetails> {
  String selectedindex="M";
  @override
  Widget build(BuildContext context) {
    final provider=FavouriteProvider.of(context);
    return Scaffold(
      backgroundColor: xbackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 65),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => BottomNav()));
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                const Text(
                  "Details",
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                 GestureDetector(
                     onTap: (){
                       provider.tooglefavourite(widget.coffe);
                     },
                     child: Icon(Icons.favorite,color:provider.isExist(widget.coffe)?Colors.red:null )),
              ],
            ),
            const SizedBox(height: 25),
            // Coffee Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.coffe.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),

            const SizedBox(height: 20),

            // Coffee Name & Type
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      widget.coffe.name,
                      style:const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Ice/Hot",
                      style: TextStyle(
                        color: xsecondaryColor,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Image.network("assets/coffee-shop/ic_star_filled.png", width: 18, height: 18),
                        const SizedBox(width: 5),
                         Text(
                          widget.coffe.rate.toString(),
                          style:const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "(230)",
                          style: TextStyle(
                              color: xsecondaryColor, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 120,),
                      ],
                    ),

                  ],
                ),
                Row(
                  children: [
                    'assets/coffee-shop/bike.png',
                    'assets/coffee-shop/bean.png',
                    'assets/coffee-shop/milk.png'
                  ].map((e) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Image.network(e, height: 20, width: 20),
                    ),
                  )).toList(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.black12,indent: 15,endIndent: 15,),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Descripton",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                ReadMoreText(widget.coffe.description,
                  trimLength: 125,
                  trimMode: TrimMode.Length,
                  trimCollapsedText: "Read More",
                  trimExpandedText: "Read Less",
                  style: TextStyle(
                    color: xsecondaryColor,
                    fontSize: 15,
                  ),
                  moreStyle: TextStyle(
                      color: xprimaryColor,
                      fontWeight: FontWeight.w600
                  ),
                  lessStyle: TextStyle(
                      color: xprimaryColor,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Size",style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(height: 20,),
                Row(
                  children: ["S","","M","","L"].map((e) {
                   if(e=="") return SizedBox(width: 25,);
                   bool isSelected=selectedindex==e;
                   return Expanded(child: GestureDetector(
                     onTap: (){
                       setState(() {
                         selectedindex=e;
                       });
                     },
                     child: Sizes_Container(isSelected: isSelected,e:e),
                   ));
                  }).toList(),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: NavBar_DetailsScreen(widget: widget,coffeeModel: widget.coffe,),
    );
  }
}


