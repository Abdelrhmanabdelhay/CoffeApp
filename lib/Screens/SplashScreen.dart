import 'package:flutter/material.dart';
import 'package:untitled1/Bottom-nav-bar.dart';
import 'package:untitled1/Screens/HomeScreen.dart';
import 'package:untitled1/Widgets/CustomButoon.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Size size=MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            child: Image.network("assets/coffee-shop/bg.png",
              height: size.height/1.3,
            fit: BoxFit.cover,),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Text("Fall in Love With coffe in Blissful Delight!",textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      height: 1.3,
                      color: Colors.white
                  ),),
                SizedBox(height: 5,),
                Text("Welcome to our cozy corner, where every cup is adeligtful cup",textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      height: 1.3,
                      color: Colors.grey[600]
                  ),),
                SizedBox(height: 20,),
                CustomButton(title: "Get Started", onTab:(){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav()));
                } ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
