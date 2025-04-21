import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Coffe-Model.dart';

class CartProvider extends ChangeNotifier{
  final List<CoffeeModel> cart=[];
   List<CoffeeModel> get cartt=>cart;
   void toogleproduct(CoffeeModel coffeeModel){
     if(cartt.contains(coffeeModel)){
       for(CoffeeModel element in cart){
         element.quntity++;
       }
     }else{
       cart.add(coffeeModel);
     }
     notifyListeners();
   }
   incremntQtn(int index){
     cart[index].quntity++;
     notifyListeners();
   }
   bool isExist(CoffeeModel coffeeModel){
     final isExsist=cartt.contains(coffeeModel);
     return isExsist;
   }
   decremntQtn(int index){
     if(cart[index].quntity<=1){
       return;
     }
     cart[index].quntity--;
     notifyListeners();
   }
   totalprice(){
     double mytotal=0;
     for(CoffeeModel elemnt in cart){
       mytotal+=elemnt.quntity * double.parse(elemnt.price);
     }
     return mytotal;
   }
   void clearCart(){
     cart.clear();
     notifyListeners();
   }
   static CartProvider of(BuildContext context,{bool listen=true}){
     return Provider.of<CartProvider>(context,listen:listen);
   }
}