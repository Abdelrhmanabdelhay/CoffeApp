import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Coffe-Model.dart';

class FavouriteProvider extends ChangeNotifier{
  final List<CoffeeModel> cart=[];
  List<CoffeeModel> get cartt=>cart;
  void tooglefavourite(CoffeeModel coffeeModel){
    if(cartt.contains(coffeeModel)){
      cart.remove(coffeeModel);
    }else{
      cart.add(coffeeModel);
    }
    notifyListeners();
  }
  bool isExist(CoffeeModel coffeeModel){
    final isExsist=cart.contains(coffeeModel);
    return isExsist;
  }
  static FavouriteProvider of(BuildContext context,{bool listen=true}){
    return Provider.of<FavouriteProvider>(context,listen:listen);
  }
}